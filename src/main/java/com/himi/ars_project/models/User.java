package com.himi.ars_project.models;

import javax.persistence.*;
import javax.validation.constraints.Email;
import javax.validation.constraints.Size;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "users")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Column
    private String firstName;
    @Column
    private String lastName;
    @Email
    private String username;
    @Column
    private String nationality;
    @Column
    private Integer num_of_phone;
    @Size(min = 6, message = "Password must be greater 6 characters!")
    private String password;
    @Transient
    private String confirmPassword;
    @Column(updatable=false)
    private Date createdAt;
    private Date updatedAt;

    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(
            name = "users_roles",
            joinColumns = @JoinColumn(name = "user_id"),
            inverseJoinColumns = @JoinColumn(name = "role_id"))
    private List<Role> roles;

    @OneToMany(mappedBy="creator",cascade=CascadeType.ALL, fetch = FetchType.LAZY)
    private List<Airport> airportList;

    @OneToMany(mappedBy="user",cascade=CascadeType.ALL, fetch = FetchType.LAZY)
    private List<Flight> flightList;

    @OneToMany(mappedBy="userIn",cascade=CascadeType.ALL, fetch = FetchType.LAZY)
    private List<Invoice> invoiceList;

    public User() {
    }

    public User(Long id, String firstName, String lastName,
                String username, String nationality,
                Integer num_of_phone, String password,
                String confirmPassword, Date createdAt,
                Date updatedAt, List<Role> roles,
                List<Airport> airportList,
                List<Flight> flightList,
                List<Invoice> invoiceList) {
        this.id = id;
        this.firstName = firstName;
        this.lastName = lastName;
        this.username = username;
        this.nationality = nationality;
        this.num_of_phone = num_of_phone;
        this.password = password;
        this.confirmPassword = confirmPassword;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
        this.roles = roles;
        this.airportList = airportList;
        this.flightList = flightList;
        this.invoiceList = invoiceList;
    }

    public List<Airport> getAirportList() {
        return airportList;
    }

    public void setAirportList(List<Airport> airportList) {
        this.airportList = airportList;
    }

    public List<Flight> getFlightList() {
        return flightList;
    }

    public void setFlightList(List<Flight> flightList) {
        this.flightList = flightList;
    }

    public List<Invoice> getInvoiceList() {
        return invoiceList;
    }

    public void setInvoiceList(List<Invoice> invoiceList) {
        this.invoiceList = invoiceList;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getNationality() {
        return nationality;
    }

    public void setNationality(String nationality) {
        this.nationality = nationality;
    }

    public Integer getNum_of_phone() {
        return num_of_phone;
    }

    public void setNum_of_phone(Integer num_of_phone) {
        this.num_of_phone = num_of_phone;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getConfirmPassword() {
        return confirmPassword;
    }

    public void setConfirmPassword(String confirmPassword) {
        this.confirmPassword = confirmPassword;
    }

    public List<Role> getRoles() {
        return roles;
    }

    public void setRoles(List<Role> roles) {
        this.roles = roles;
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
