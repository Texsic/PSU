import java.util.Arrays;
import java.util.List;

public class Activity1Runner {
    public static void main(String[] args) {
        PC pc1 = new PC("Dell");
        PC pc2 = new PC("HP");
        List<PC> pcs = Arrays.asList(pc1, pc2);

        Office office = new Office("Room 101");

        Teacher teacher = new Teacher("Mr. Smith", pcs, office);

        System.out.println(teacher.toString());
    }
}
