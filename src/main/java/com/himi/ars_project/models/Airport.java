package com.himi.ars_project.models;


import javax.persistence.*;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "airports")
public class Airport {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private Integer airportCode;
    private String name;
    private String state;
    private String city;
    private String address;
    @Column(updatable=false)
    private Date createdAt;
    private Date updatedAt;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="user_id")
    private User creator;

    @OneToMany(mappedBy="airport",cascade=CascadeType.ALL, fetch = FetchType.LAZY)
    private List<Flight> flights;

    public Airport() {
    }

    public Airport(Long id, Integer airportCode,
                   String name, String state,
                   String city, String address,
                   Date createdAt, Date updatedAt,
                   User creator, List<Flight> flights) {
        this.id = id;
        this.airportCode = airportCode;
        this.name = name;
        this.state = state;
        this.city = city;
        this.address = address;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
        this.creator = creator;
        this.flights = flights;
    }

    public List<Flight> getFlights() {
        return flights;
    }

    public void setFlights(List<Flight> flights) {
        this.flights = flights;
    }

    public User getCreator() {
        return creator;
    }

    public void setCreator(User creator) {
        this.creator = creator;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Integer getAirportCode() {
        return airportCode;
    }

    public void setAirportCode(Integer airportCode) {
        this.airportCode = airportCode;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
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
