package com.himi.ars_project.services;

import com.himi.ars_project.models.Flight;
import com.himi.ars_project.repositories.FlightRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FlightService {
    @Autowired
    private FlightRepository flightRepository;

    public List<Flight> findAllFlight(){
        return this.flightRepository.findAll();
    }
    public Flight findFlightById(Long id){
        return this.flightRepository.findById(id).orElse(null);
    }
    public void createFlight(Flight flight){
        this.flightRepository.save(flight);
    }
    public void deleteFlight(Long id) {
        boolean exists = flightRepository.existsById(id);
        if (!exists){
            throw new IllegalStateException("Flight with id" + id + "does not exists");
        }
        this.flightRepository.deleteById(id);
    }
}
