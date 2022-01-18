package com.himi.ars_project.models;

import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.sql.Time;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "flights")
public class Flight {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String name;
    private String dep_airport_name;
    private String arri_airport_name;
    private String dep_city;
    private String arri_city;
    @DateTimeFormat(pattern = "HH:mm")
    private LocalTime dep_time;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate dep_date;
    @DateTimeFormat(pattern = "HH:mm")
    private LocalTime  arri_time;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate arri_date;
    private Float ticket_price;
    @Column(updatable=false)
    private Date createdAt;
    private Date updatedAt;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="user_id")
    private User user;

    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(
            name = "airports_flights",
            joinColumns = @JoinColumn(name = "flight_id"),
            inverseJoinColumns = @JoinColumn(name = "airport_id"))
    private List<Airport> airports;

    @OneToMany(mappedBy="flight",cascade=CascadeType.ALL, fetch = FetchType.LAZY)
    private List<Invoice> invoices;

    public Flight() {
    }

    public Flight(String name, String dep_airport_name, String arri_airport_name, String dep_city, String arri_city, LocalTime dep_time, LocalDate dep_date, LocalTime arri_time, LocalDate arri_date, Float ticket_price, Date createdAt, Date updatedAt, User user, List<Airport> airports, List<Invoice> invoices) {
        this.name = name;
        this.dep_airport_name = dep_airport_name;
        this.arri_airport_name = arri_airport_name;
        this.dep_city = dep_city;
        this.arri_city = arri_city;
        this.dep_time = dep_time;
        this.dep_date = dep_date;
        this.arri_time = arri_time;
        this.arri_date = arri_date;
        this.ticket_price = ticket_price;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
        this.user = user;
        this.airports = airports;
        this.invoices = invoices;
    }

    public String getDep_city() {
        return dep_city;
    }

    public void setDep_city(String dep_city) {
        this.dep_city = dep_city;
    }

    public String getArri_city() {
        return arri_city;
    }

    public void setArri_city(String arri_city) {
        this.arri_city = arri_city;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDep_airport_name() {
        return dep_airport_name;
    }

    public void setDep_airport_name(String dep_airport_name) {
        this.dep_airport_name = dep_airport_name;
    }

    public String getArri_airport_name() {
        return arri_airport_name;
    }

    public LocalTime getDep_time() {
        return dep_time;
    }

    public void setDep_time(LocalTime dep_time) {
        this.dep_time = dep_time;
    }

    public LocalTime getArri_time() {
        return arri_time;
    }

    public void setArri_time(LocalTime arri_time) {
        this.arri_time = arri_time;
    }

    public void setArri_airport_name(String arri_airport_name) {
        this.arri_airport_name = arri_airport_name;
    }

    public LocalDate getDep_date() {
        return dep_date;
    }

    public void setDep_date(LocalDate dep_date) {
        this.dep_date = dep_date;
    }

    public LocalDate getArri_date() {
        return arri_date;
    }

    public void setArri_date(LocalDate arri_date) {
        this.arri_date = arri_date;
    }

    public Float getTicket_price() {
        return ticket_price;
    }

    public void setTicket_price(Float ticket_price) {
        this.ticket_price = ticket_price;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public List<Airport> getAirports() {
        return airports;
    }

    public void setAirports(List<Airport> airports) {
        this.airports = airports;
    }

    public List<Invoice> getInvoices() {
        return invoices;
    }

    public void setInvoices(List<Invoice> invoices) {
        this.invoices = invoices;
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
