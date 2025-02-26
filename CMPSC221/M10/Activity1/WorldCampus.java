public class WorldCampus implements Student{
    private String name;
    private String email;
    private String contact;
    private String grade;

    public WorldCampus(String n, String e, String c, String g){
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
        System.out.println(name + " is attending class on zoom.");
    }

    @Override
    public void attend_in_person_meeting(){
        System.out.println(name + " can't attend class in person, class should be on zoom!");
    }
}

