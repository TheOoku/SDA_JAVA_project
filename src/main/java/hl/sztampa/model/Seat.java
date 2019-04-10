package hl.sztampa.model;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "seat")
public class Seat implements Serializable {

    @Id
    @GeneratedValue
    @Column(name = "id")
    private long id;

    @Column(name = "row")
    private int row;

    @Column(name = "column")
    private int column;

    public Seat() {
    }

    public Seat(int row, int column) {
        this.row = row;
        this.column = column;
    }

    public long getId() {
        return id;
    }

    public int getRow() {
        return row;
    }

    public int getColumn() {
        return column;
    }
}
