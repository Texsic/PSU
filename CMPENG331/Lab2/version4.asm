        .text
        .globl main

main:
        subu    $sp, $sp, 40    # stack push, 40 bytes
        sw      $ra, 20($sp)    # save return address
        sd      $a0, 32($sp)    # save registers $a0, $a1
        sw      $0, 24($sp)     # sum = 0
        sw      $0, 28($sp)     # i = 0

loop:
        lw      $t6, 28($sp)    # i
        mul     $t7, $t6, $t6   # i * i
        lw      $t8, 24($sp)    # sum
        addu    $t9, $t8, $t7   # sum + i*i
        sw      $t9, 24($sp)    # update sum
        addu    $t0, $t6, 1     # i + 1
        sw      $t0, 28($sp)    # update i
        ble     $t0, 100, loop  # if (i <= 100) loop

        la      $a0, str1
        jal     Print_string
        lw      $a0, 24($sp)
        jal     Print_integer
        la      $a0, str2
        jal     Print_string

        move    $a0, $0
        jal     Exit2

# ---------------- Data ----------------
        .data
        .align  0

str1:   .asciiz "The sum from 0 .. 100 is :"
str2:   .asciiz ":\n"

# ---------------- Wrappers ----------------
        .text
        .globl Print_integer
Print_integer:
        li      $v0, 1
        syscall
        jr      $ra

        .globl Print_string
Print_string:
        li      $v0, 4
        syscall
        jr      $ra

        .globl Exit2
Exit2:
        li      $v0, 17
        syscall
        jr      $ra
