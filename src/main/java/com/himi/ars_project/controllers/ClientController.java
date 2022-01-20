package com.himi.ars_project.controllers;

import com.himi.ars_project.services.FlightService;
import com.himi.ars_project.services.InvoiceService;
import com.himi.ars_project.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestParam;

import java.security.Principal;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;

@Controller
public class ClientController {
    @Autowired
    private UserService userService;
    @Autowired
    private InvoiceService invoiceService;
    @Autowired
    private FlightService flightService;

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        binder.registerCustomEditor(Date.class, new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"), true, 10));
    }

    @GetMapping("/user/search")
    public String searched(
            @RequestParam("departureCity") String departureCity,
            @RequestParam("arrivalCity") String arrivalCity,
            @RequestParam("departureDate") Date departureDate,
            @RequestParam("arrivalDate") Date arrivalDate,
            Model model, Principal principal
    ) {
        model.addAttribute("search", this.flightService.allSearches(departureCity, arrivalCity, departureDate, arrivalDate));
        model.addAttribute("from", departureCity);
        model.addAttribute("to", arrivalCity);
        model.addAttribute("date",departureDate);
        String username = principal.getName();
        model.addAttribute("currentUser", userService.findByUsername(username));
        return "/user/searched";
    }
    @GetMapping("/user/book")
    public String ticket(Model model){
        return "/user/book";
    }
}
