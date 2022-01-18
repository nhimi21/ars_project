package com.himi.ars_project.controllers;

import com.himi.ars_project.models.Airport;
import com.himi.ars_project.models.User;
import com.himi.ars_project.services.AirportService;
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
public class AirportController {
    @Autowired
    private AirportService airportService;
    @Autowired
    private  UserService  userService;

    @GetMapping("/admin/airport")
    public String createAirport(@ModelAttribute("airport") Airport airport, Model model,HttpSession session, Principal principal){
        String username = principal.getName();
        model.addAttribute("currentUser", userService.findByUsername(username));
        model.addAttribute("userID", (Long)session.getAttribute("userId"));
        model.addAttribute("airports", this.airportService.findAllAirport());
        return "/admin/newAirport";
    }
    @PostMapping("/admin/airport")
    public String newAirport(@Valid @ModelAttribute("airport") Airport airport, BindingResult result, Principal principal, HttpSession session) {
        String username = principal.getName();
        User user = userService.findByUsername(username);
        if (result.hasErrors()){
            return "/admin/newAirport";
        } else {
            airport.setCreator(user);
            this.airportService.createAirport(airport);
            return "redirect:/admin/airport";
        }
    }

    @GetMapping("/admin/{id}/edit")
    public String editAirport(@PathVariable("id") Long id, Model model,Principal principal) {
        String username = principal.getName();
        model.addAttribute("currentUser", userService.findByUsername(username));
        model.addAttribute("airport", this.airportService.findAirportById(id));
        return "/admin/editAirport";
    }

    @PutMapping("/admin/{id}/edit")
    public String updateAirport(@Valid @ModelAttribute("airport") Airport airport, BindingResult result,Principal principal,HttpSession session) {
        String username = principal.getName();
        User user = userService.findByUsername(username);
        if (result.hasErrors()) {
            return "/admin/editAirport";
        } else {
            airport.setCreator(user);
            this.airportService.createAirport(airport);
            return "redirect:/admin/airport";
        }
    }
    @DeleteMapping("/admin/{id}/delete")
    public String deleteAirport(@PathVariable("id") Long id, Principal principal){
        String username = principal.getName();
        User user = userService.findByUsername(username);
        this.airportService.deleteAirport(id);
        return "redirect:/admin/airport";
    }
}
