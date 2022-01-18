package com.himi.ars_project.controllers;

import com.himi.ars_project.services.FlightService;
import com.himi.ars_project.services.InvoiceService;
import com.himi.ars_project.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.security.Principal;


@Controller
public class InvoiceController {
    @Autowired
    private UserService userService;
    @Autowired
    private InvoiceService invoiceService;
    @Autowired
    private FlightService flightService;
}
