package hl.sztampa.model;

public class DataBaseMock {

    // powinna być tablica rzędów, zawierająca miejsca danego rzędu (tablica miejsc?)

    private static Seat[] seats = new Seat[]{
            new Seat(2, 1),
            new Seat(2, 2),
            new Seat(2, 3),
            new Seat(2, 4),
            new Seat(2, 5),
            new Seat(2, 6),
            new Seat(2, 7),
            new Seat(2, 8),
            new Seat(2, 9),
            new Seat(2, 10),
            new Seat(2, 11)
    };

    public static Seat[] getSeats() {
        return seats;
    }
}


