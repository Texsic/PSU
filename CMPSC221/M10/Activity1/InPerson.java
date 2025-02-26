public class InPerson implements Student{
    private String name;
    private String email;
    private String contact;
    private String grade;

    public InPerson(String n, String e, String c, String g){
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
    public void attend_zoom_meeting(){
        System.out.println(name + " can't attend class through zoom, class should be in person!");
    }

    @Override
    public void attend_in_person_meeting(){
        System.out.println(name + " is attending class in person.");
    }
}
