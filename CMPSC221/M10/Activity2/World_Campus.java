public class World_Campus implements Grade,WorldCampus{
    private String name;
    private String email;
    private String contact;
    private String grade;

    public World_Campus(String n, String e, String c, String g){
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

}
