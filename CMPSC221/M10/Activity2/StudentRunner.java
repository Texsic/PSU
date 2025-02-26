public class StudentRunner {
    public static void main(String args[])
    {
        In_Person mo = new In_Person("Mo", "mo@gmail.com", "8144401991", "A");
        World_Campus ahmad = new World_Campus("Ahmad", "ahmad@gmail.com", "81440161", "A+");

        System.out.println("mo's grade is " + mo.get_grade());
        System.out.println("ahmad's grade is " + ahmad.get_grade());

        mo.attend_in_person_meeting();


        ahmad.attend_zoom_meeting();

    }
}
