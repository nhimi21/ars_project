package com.himi.ars_project.repositories;

import com.himi.ars_project.models.Flight;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.util.Date;
import java.util.List;

@Repository
public interface FlightRepository extends CrudRepository<Flight, Long> {
    List<Flight> findAll();
    List<Flight> findAllByDepartureCityAndArrivalCityAndDepartureDateAndArrivalDate(
            String departureCity, String arrivalCity, Date departureDate, Date arrivalDate
    );
}
