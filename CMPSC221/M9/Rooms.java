// Outer class Rooms
class Rooms {
    private int noOfTables;
    private int noOfChairs;

    // Default constructor
    public Rooms() {
        this.noOfTables = 0;
        this.noOfChairs = 0;
    }

    // Parameterized constructor
    public Rooms(int noOfTables, int noOfChairs) {
        this.noOfTables = noOfTables;
        this.noOfChairs = noOfChairs;
    }

    // Setters and Getters
    public void setNoOfTables(int noOfTables) {
        this.noOfTables = noOfTables;
    }

    public int getNoOfTables() {
        return this.noOfTables;
    }

    public void setNoOfChairs(int noOfChairs) {
        this.noOfChairs = noOfChairs;
    }

    public int getNoOfChairs() {
        return this.noOfChairs;
    }

    // Inner class ClassRoom
    class ClassRoom {
        private int noOfWhiteBoards;

        public ClassRoom(int noOfWhiteBoards) {
            this.noOfWhiteBoards = noOfWhiteBoards;
        }

        public void setNoOfWhiteBoards(int noOfWhiteBoards) {
            this.noOfWhiteBoards = noOfWhiteBoards;
        }

        public int getNoOfWhiteBoards() {
            return this.noOfWhiteBoards;
        }
    }

    // Inner class Labs
    class Labs {
        private int noOfComputers;

        public Labs(int noOfComputers) {
            this.noOfComputers = noOfComputers;
        }

        public void setNoOfComputers(int noOfComputers) {
            this.noOfComputers = noOfComputers;
        }

        public int getNoOfComputers() {
            return this.noOfComputers;
        }
    }

    // Inner class ConferenceRoom
    class ConferenceRoom {
        private int noOfProjectors;

        public ConferenceRoom(int noOfProjectors) {
            this.noOfProjectors = noOfProjectors;
        }

        public void setNoOfProjectors(int noOfProjectors) {
            this.noOfProjectors = noOfProjectors;
        }

        public int getNoOfProjectors() {
            return this.noOfProjectors;
        }
    }
}