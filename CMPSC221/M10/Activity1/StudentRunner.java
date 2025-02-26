public class StudentRunner {
    public static void main(String args[])
    {
        InPerson mo = new InPerson("Mo", "mo@gmail.com", "8144401991", "A");
        WorldCampus ahmad = new WorldCampus("Ahmad", "Ahmad@gmail.com", "81440161", "A+");

        System.out.println("Mo's grade is " + mo.get_grade());
        System.out.println("Ahmad's grade is " + ahmad.get_grade());

        mo.attend_in_person_meeting();
        mo.attend_zoom_meeting();

        ahmad.attend_in_person_meeting();
        ahmad.attend_zoom_meeting();
    }
}
