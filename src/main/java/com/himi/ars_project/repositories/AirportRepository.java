package com.himi.ars_project.repositories;

import com.himi.ars_project.models.Airport;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AirportRepository extends CrudRepository<Airport, Long> {
    List<Airport> findAll();
}
