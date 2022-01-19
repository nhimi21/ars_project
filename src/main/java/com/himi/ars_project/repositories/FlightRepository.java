package com.himi.ars_project.repositories;

import com.himi.ars_project.models.Flight;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface FlightRepository extends CrudRepository<Flight, Long> {
    List<Flight> findAll();
//    List<Flight> findAllByDep_airport_nameAndArri_airport_nameAndDep_date(
//
//    );
}
