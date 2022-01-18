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
    private Integer invoice_num;
    private String flight_name;
    private String full_name;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate dep_date;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate arri_date;
    private String num_of_person;
    private String pnr_code;
    private Float total_price;
    @Column(updatable=false)
    private Date createdAt;
    private Date updatedAt;

    @ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="flight_id")
    private Flight flight;

    @ManyToMany(fetch = FetchType.EAGER)//dcfgvbhjnmk,l./
    @JoinTable(
            name = "invoices_users",
            joinColumns = @JoinColumn(name = "invoice_id"),
            inverseJoinColumns = @JoinColumn(name = "user_id"))
    private List<User> userIn;

    public Invoice() {
    }
//comment
    public Invoice(Integer invoice_num, String flight_name, String full_name, LocalDate dep_date, LocalDate arri_date, String num_of_person, String pnr_code, Float total_price, Date createdAt, Date updatedAt, Flight flight, List<User> userIn) {
        this.invoice_num = invoice_num;
        this.flight_name = flight_name;
        this.full_name = full_name;
        this.dep_date = dep_date;
        this.arri_date = arri_date;
        this.num_of_person = num_of_person;
        this.pnr_code = pnr_code;
        this.total_price = total_price;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
        this.flight = flight;
        this.userIn = userIn;
    }

    public Float getTotal_price() {
        return total_price;
    }

    public String getPnr_code() {
        return pnr_code;
    }

    public void setPnr_code(String pnr_code) {
        this.pnr_code = pnr_code;
    }

    public void setTotal_price(Float total_price) {
        this.total_price = total_price;
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

    public List<User> getUserIn() {
        return userIn;
    }

    public void setUserIn(List<User> userIn) {
        this.userIn = userIn;
    }

    public Flight getFlight() {
        return flight;
    }

    public void setFlight(Flight flight) {
        this.flight = flight;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Integer getInvoice_num() {
        return invoice_num;
    }

    public void setInvoice_num(Integer invoice_num) {
        this.invoice_num = invoice_num;
    }

    public String getFlight_name() {
        return flight_name;
    }

    public void setFlight_name(String flight_name) {
        this.flight_name = flight_name;
    }

    public String getFull_name() {
        return full_name;
    }

    public void setFull_name(String full_name) {
        this.full_name = full_name;
    }

    public String getNum_of_person() {
        return num_of_person;
    }

    public void setNum_of_person(String num_of_person) {
        this.num_of_person = num_of_person;
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
