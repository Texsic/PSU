public class In_Person implements InPerson, Grade{
    private String name;
    private String email;
    private String contact;
    private String grade;

    public In_Person(String n, String e, String c, String g){
        this.name = n;
        this.email = e;
        this.contact = c;
        this.grade = g;
    }
    @Override
    public String get_grade(){
        return grade;
    }


    @Override
    public void attend_in_person_meeting(){
        System.out.println(name + " is attending class in person.");
    }
}
