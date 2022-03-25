package com.himi.ars_project.controllers;

import com.himi.ars_project.models.Invoice;
import com.himi.ars_project.services.FlightService;
import com.himi.ars_project.services.InvoiceService;
import com.himi.ars_project.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import java.security.Principal;


@Controller
public class InvoiceController {
    @Autowired
    private UserService userService;
    @Autowired
    private InvoiceService invoiceService;
    @Autowired
    private FlightService flightService;

    @GetMapping("/admin/invoice")
    public String details(@ModelAttribute("invoice") Invoice invoice, Model model,Principal principal){
        String username = principal.getName();
        model.addAttribute("currentUser", userService.findByUsername(username));
        model.addAttribute("ticket", this.invoiceService.findAllInvoice());
        return "/admin/indetails";
    }
}
