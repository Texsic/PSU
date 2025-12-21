# CMPEN 331, Lab 2_part2
# Name: Mohammad Abu Shariha
# This program iterates through a set of Unicode code points and converts
# each one to its corresponding UTF-8 representation using bitwise operations.

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# switch to the Data segment
	.data
	# global data is defined here

	# Don't forget the backslash-n (newline character)
Homework:
	.asciiz	"CMPEN 331 Lab 2\n"
Name:
	.asciiz	"Mohammad Abu Shariha\n"
 

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# switch to the Text segment
	.text
	# the program is defined here

	.globl	main
main:
	# Whose program is this?
	la	$a0, Homework
	jal	Print_string
	la	$a0, Name
	jal	Print_string
	
	# int i, j = 2, n = 3;
	# for (i = 0; i <= 16; i++)
	#   {
	#      ... j = testcase[i]
	#      ... calculate n from j
	#      ... print i, j and n
	#   }
	
	# register assignments
	#  $s0   i (loop counter)
	#  $s1   j = testcase[i] (the input code point)
	#  $s2   n (the resulting UTF-8 value)
	#  $t0   address of testcase[i]
	#  $a0   argument to Print_integer, Print_string, etc.
	#  $t1-$t7 Temporary registers used for bit masking and assembly of n
	#  $t8, $t9 Temp registers for holding large comparison constants
	

	# initialization
	li	$s1, 2			# j = 2
	li	$s2, 3			# n = 3
	
	# for (i = 0; i <= 16; i++)
	li	$s0, 0			# i = 0
	la	$t0, testcase		# address of testcase[i]
	bgt	$s0, 16, bottom
top:
	lw	$s1, 0($t0)		# j = testcase[i]
	# calculate n from j
	# Your part starts here
	
	# This section implements the if-then-else structure for UTF-8 encoding.
	# To handle immediate values > 16 bits, we first load them into temp
	# registers ($t8, $t9) and then use register-to-register comparisons.
	
	li      $t8, 0x80
	sltu    $t9, $s1, $t8		# Check if j < 0x80
	bne     $t9, $zero, case1

	li      $t8, 0x800
	sltu    $t9, $s1, $t8		# Check if j < 0x800 (j <= 0x7FF)
	bne     $t9, $zero, case2

	li      $t8, 0x10000
	sltu    $t9, $s1, $t8		# Check if j < 0x10000 (j <= 0xFFFF)
	bne     $t9, $zero, case3

	li      $t8, 0x10FFFF
	sltu    $t9, $t8, $s1		# $t9 = 1 if 0x10FFFF < j (j is out of valid range)
	bne     $t9, $zero, case5	# If j is too large, go to error case

	b       case4			# Otherwise, it must be case 4
        

case1:  # 1-byte encoding: n = j
        # For values < 0x80, the UTF-8 encoding is the value itself.
        move    $s2, $s1
        b       endif

case2:  # 2-byte encoding: n = 110aaaaa 10bbbbbb
        # Isolate the lower 6 bits (bbbbbb)
        andi    $t1, $s1, 0x3F          
        # Isolate the upper 5 bits (aaaaa)
        srl     $t2, $s1, 6             
        andi    $t2, $t2, 0x1F          
        
        # Construct n
        li      $s2, 0xC0               # Start with first byte prefix: 11000000
        or      $s2, $s2, $t2           # Combine with aaaaa -> 110aaaaa
        sll     $s2, $s2, 8             # Shift left to make room for second byte
        
        li      $t3, 0x80               # Start with second byte prefix: 10000000
        or      $t3, $t3, $t1           # Combine with bbbbbb -> 10bbbbbb
        or      $s2, $s2, $t3           # Combine both bytes into n
        b       endif

case3:  # 3-byte encoding: n = 1110aaaa 10bbbbbb 10cccccc
        andi    $t1, $s1, 0x3F          # Isolate cccccc (low 6 bits)
        srl     $t2, $s1, 6
        andi    $t2, $t2, 0x3F          # Isolate bbbbbb (next 6 bits)
        srl     $t3, $s1, 12
        andi    $t3, $t3, 0x0F          # Isolate aaaa (next 4 bits)

        # Build n byte by byte
        li      $s2, 0xE0               # Byte 1 prefix: 11100000
        or      $s2, $s2, $t3           # -> 1110aaaa
        sll     $s2, $s2, 8

        li      $t4, 0x80               # Byte 2 prefix: 10000000
        or      $t4, $t4, $t2           # -> 10bbbbbb
        or      $s2, $s2, $t4
        sll     $s2, $s2, 8

        li      $t5, 0x80               # Byte 3 prefix: 10000000
        or      $t5, $t5, $t1           # -> 10cccccc
        or      $s2, $s2, $t5
        b       endif

case4:  # 4-byte encoding: n = 11110aaa 10bbbbbb 10cccccc 10dddddd
        andi    $t1, $s1, 0x3F          # Isolate dddddd (low 6 bits)
        srl     $t2, $s1, 6
        andi    $t2, $t2, 0x3F          # Isolate cccccc (next 6 bits)
        srl     $t3, $s1, 12
        andi    $t3, $t3, 0x3F          # Isolate bbbbbb (next 6 bits)
        srl     $t4, $s1, 18
        andi    $t4, $t4, 0x07          # Isolate aaa (top 3 bits)
        
        # Build n byte by byte
        li      $s2, 0xF0               # Byte 1 prefix: 11110000
        or      $s2, $s2, $t4           # -> 11110aaa
        sll     $s2, $s2, 8

        li      $t5, 0x80               # Byte 2 prefix: 10000000
        or      $t5, $t5, $t3           # -> 10bbbbbb
        or      $s2, $s2, $t5
        sll     $s2, $s2, 8

        li      $t6, 0x80               # Byte 3 prefix: 10000000
        or      $t6, $t6, $t2           # -> 10cccccc
        or      $s2, $s2, $t6
        sll     $s2, $s2, 8

        li      $t7, 0x80               # Byte 4 prefix: 10000000
        or      $t7, $t7, $t1           # -> 10dddddd
        or      $s2, $s2, $t7
        b       endif

case5:  # Error case for values outside the valid UTF-8 range
        li      $s2, 0xFFFFFFFF         # Set n to -1 (0xFFFFFFFF) as per instructions
        # Fall through to endif

endif:
	# Your part ends here
	
	# print i, j and n
	move	$a0, $s0	# i
	jal	Print_integer
	la	$a0, sp		# space
	jal	Print_string
	move	$a0, $s1	# j
	jal	Print_hex
	la	$a0, sp		# space
	jal	Print_string
	move	$a0, $s2	# n
	jal	Print_hex
	la	$a0, sp		# space
	jal	Print_string
	move	$a0, $s1	# j
	jal	Print_bin
	la	$a0, sp		# space
	jal	Print_string
	move	$a0, $s2	# n
	jal	Print_bin
	la	$a0, nl		# newline
	jal	Print_string
	
	# for (i = 0; i <= 16; i++)
	addi	$s0, $s0, 1	# i++
	addi	$t0, $t0, 4	# address of testcase[i]
	ble	$s0, 16, top	# i <= 16
bottom:
	
	la	$a0, done	# mark the end of the program
	jal	Print_string
	
	jal	Exit0	# end the program, default return status

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

	.data
	# global data is defined here
sp:
	.asciiz	" "	# space
nl:
	.asciiz	"\n"	# newline
done:
	.asciiz	"All done!\n"

testcase:
	# UTF-8 representation is one byte
	.word 0x0000	# nul		# Basic Latin, 0000 - 007F
	.word 0x0024	# $ (dollar sign)
	.word 0x007E	# ~ (tilde)
	.word 0x007F	# del

	# UTF-8 representation is two bytes
	.word 0x0080	# pad		# Latin-1 Supplement, 0080 - 00FF
	.word 0x00A2	# cent sign
	.word 0x0627	# Arabic letter alef
	.word 0x07FF	# unassigned

	# UTF-8 representation is three bytes
	.word 0x0800
	.word 0x20AC	# Euro sign
	.word 0x2233	# anticlockwise contour integral sign
	.word 0xFFFF

	# UTF-8 representation is four bytes
	.word 0x10000
	.word 0x10348	# Hwair, see http://en.wikipedia.org/wiki/Hwair
	.word 0x22E13	# randomly-chosen character
	.word 0x10FFFF

	.word 0x89ABCDEF	# randomly chosen bogus value

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Wrapper functions around some of the system calls
# See P&H COD, Fig. A.9.1, for the complete list.

	.text

	.globl	Print_integer
Print_integer:	# print the integer in register $a0 (decimal)
	li	$v0, 1
	syscall
	jr	$ra

	.globl	Print_string
Print_string:	# print the string whose starting address is in register $a0
	li	$v0, 4
	syscall
	jr	$ra

	.globl	Exit
Exit:		# end the program, no explicit return status
	li	$v0, 10
	syscall
	jr	$ra	# this instruction is never executed

	.globl	Exit0
Exit0:		# end the program, default return status
	li	$a0, 0	# return status 0
	li	$v0, 17
	syscall
	jr	$ra	# this instruction is never executed

	.globl	Exit2
Exit2:		# end the program, with return status from register $a0
	li	$v0, 17
	syscall
	jr	$ra	# this instruction is never executed

# The following syscalls work on MARS, but not on QtSPIM

	.globl	Print_hex
Print_hex:	# print the integer in register $a0 (hexadecimal)
	li	$v0, 34
	syscall
	jr	$ra

	.globl	Print_bin
Print_bin:	# print the integer in register $a0 (binary)
	li	$v0, 35
	syscall
	jr	$ra

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -