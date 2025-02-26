public class Activity2Runner {
    public static void main(String[] args) {
        // Create instance of the outer class Rooms with initial number of tables and chairs
        Rooms rooms = new Rooms(10, 50); // 10 tables and 50 chairs

        // Create instances of the inner classes
        Rooms.ClassRoom classRoom = rooms.new ClassRoom(5); // 5 whiteboards
        Rooms.Labs labs = rooms.new Labs(20); // 20 computers
        Rooms.ConferenceRoom conferenceRoom = rooms.new ConferenceRoom(3); // 3 projectors

        // Display initial values
        System.out.println("Number of tables in Rooms: " + rooms.getNoOfTables());
        System.out.println("Number of chairs in Rooms: " + rooms.getNoOfChairs());
        System.out.println("Number of whiteboards in ClassRoom: " + classRoom.getNoOfWhiteBoards());
        System.out.println("Number of computers in Labs: " + labs.getNoOfComputers());
        System.out.println("Number of projectors in ConferenceRoom: " + conferenceRoom.getNoOfProjectors());

        // Update values using setters
        rooms.setNoOfTables(15); // Change tables count to 15
        rooms.setNoOfChairs(60); // Change chairs count to 60
        classRoom.setNoOfWhiteBoards(6); // Change whiteboards count to 6
        labs.setNoOfComputers(25); // Change computers count to 25
        conferenceRoom.setNoOfProjectors(5); // Change projectors count to 5

        // Display updated values
        System.out.println("\nAfter updating values:");
        System.out.println("Number of tables in Rooms: " + rooms.getNoOfTables());
        System.out.println("Number of chairs in Rooms: " + rooms.getNoOfChairs());
        System.out.println("Number of whiteboards in ClassRoom: " + classRoom.getNoOfWhiteBoards());
        System.out.println("Number of computers in Labs: " + labs.getNoOfComputers());
        System.out.println("Number of projectors in ConferenceRoom: " + conferenceRoom.getNoOfProjectors());
    }
}
