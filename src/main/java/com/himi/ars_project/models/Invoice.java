package com.himi.ars_project.models;

import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.time.LocalDate;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "invoices")
public class Invoice {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private Integer ticketNumber;
    private String full_name;
    private String numOfPerson;
    private Float totalPrice;
    @Column(updatable=false)
    private Date createdAt;
    private Date updatedAt;

    @ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="flight_id")
    private Flight flight;

    @ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="user_id")
    private User userIn;

    public Invoice() {
    }

    public Invoice(Long id, Integer ticketNumber,
                   String full_name, String numOfPerson,
                   Float totalPrice, Date createdAt,
                   Date updatedAt, Flight flight, User userIn) {
        this.id = id;
        this.ticketNumber = ticketNumber;
        this.full_name = full_name;
        this.numOfPerson = numOfPerson;
        this.totalPrice = totalPrice;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
        this.flight = flight;
        this.userIn = userIn;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Integer getTicketNumber() {
        return ticketNumber;
    }

    public void setTicketNumber(Integer ticketNumber) {
        this.ticketNumber = ticketNumber;
    }

    public String getFull_name() {
        return full_name;
    }

    public void setFull_name(String full_name) {
        this.full_name = full_name;
    }

    public String getNumOfPerson() {
        return numOfPerson;
    }

    public void setNumOfPerson(String numOfPerson) {
        this.numOfPerson = numOfPerson;
    }

    public Float getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(Float totalPrice) {
        this.totalPrice = totalPrice;
    }

    public Flight getFlight() {
        return flight;
    }

    public void setFlight(Flight flight) {
        this.flight = flight;
    }

    public User getUserIn() {
        return userIn;
    }

    public void setUserIn(User userIn) {
        this.userIn = userIn;
    }

    @PrePersist
    protected void onCreate(){
        this.createdAt = new Date();
    }
    @PreUpdate
    protected void onUpdate(){
        this.updatedAt = new Date();
    }
}
