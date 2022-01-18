package com.himi.ars_project.services;

import com.himi.ars_project.models.Airport;
import com.himi.ars_project.repositories.AirportRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AirportService {
    @Autowired
   private AirportRepository airportRepository;

    public void createAirport(Airport airport){
        this.airportRepository.save(airport);
    }
    public List<Airport> findAllAirport(){
        return this.airportRepository.findAll();
    }
    public Airport findAirportById(Long id){
        return this.airportRepository.findById(id).orElse(null);
    }
    public void deleteAirport(Long id) {
        boolean exists = airportRepository.existsById(id);
        if (!exists){
            throw new IllegalStateException("Airport with id" + id + "does not exists");
        }
        this.airportRepository.deleteById(id);
    }
}
