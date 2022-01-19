package com.himi.ars_project.controllers;

import com.himi.ars_project.models.Airport;
import com.himi.ars_project.models.Flight;
import com.himi.ars_project.models.User;
import com.himi.ars_project.services.AirportService;
import com.himi.ars_project.services.FlightService;
import com.himi.ars_project.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.security.Principal;

@Controller
public class FlightController {
    @Autowired
    private UserService userService;
    @Autowired
    private FlightService flightService;
    @Autowired
    private AirportService airportService;

    @GetMapping("/admin/flight")
    public String createFlight(@ModelAttribute("flight") Flight flight, Model model, Principal principal, HttpSession session){
        String username = principal.getName();
        model.addAttribute("currentUser", userService.findByUsername(username));
//        model.addAttribute("airId", (Long)session.getAttribute("airportID"));
        model.addAttribute("airport", this.airportService.findAllAirport());
        model.addAttribute("flights", this.flightService.findAllFlight());
        return "/admin/newFlight";
    }
    @PostMapping("/admin/flight")
    public String newFlight(@Valid @ModelAttribute("flight")Flight flight, BindingResult result,Principal principal, HttpSession session) {
        String username = principal.getName();
        User user = userService.findByUsername(username);
        if (result.hasErrors()){
            return "/admin/newFlight";
        }
        flight.setUser(user);
//        Airport airId = airportService.findAirportById((Long)session.getAttribute("airportID"));
//        flight.setAirport(airId);
        this.flightService.createFlight(flight);
        return "redirect:/admin/flight";
    }
    @GetMapping("/admin/flight/{id}/edit")
    public String editFlight(@PathVariable("id") Long id, Model model,Principal principal) {
        String username = principal.getName();
        model.addAttribute("currentUser", userService.findByUsername(username));
        model.addAttribute("airport", this.airportService.findAllAirport());
        model.addAttribute("flight",this.flightService.findFlightById(id));
        return "/admin/editFlight";
    }

    @PutMapping("/admin/flight/{id}/edit")
    public String updateFlight(@Valid @ModelAttribute("flight") Flight flight, BindingResult result,Principal principal, HttpSession session) {
        String username = principal.getName();
        User user = userService.findByUsername(username);
        if (result.hasErrors()) {
            return "/admin/editFlight";
        } else {
            flight.setUser(user);
            this.flightService.createFlight(flight);
            return "redirect:/admin/flight";
        }
    }
    @DeleteMapping("/admin/flight/{id}/delete")
    public String deleteFlight(@PathVariable("id") Long id, Principal principal){
        String username = principal.getName();
        User user = userService.findByUsername(username);
        this.flightService.deleteFlight(id);
        return "redirect:/admin/flight";
    }

}
