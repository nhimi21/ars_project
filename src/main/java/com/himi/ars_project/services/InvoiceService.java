package com.himi.ars_project.services;

import com.himi.ars_project.models.Invoice;
import com.himi.ars_project.repositories.InvoiceRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class InvoiceService {
    @Autowired
   private  InvoiceRepository invoiceRepository;

    public List<Invoice> findAllInvoice(){
        return this.invoiceRepository.findAll();
    }
    public Invoice createInvoice(Invoice invoice){
        return this.invoiceRepository.save(invoice);
    }
    public Invoice findInvoiceById(Long id){
        return this.invoiceRepository.findById(id).orElse(null);
    }
    public void deleteInvoice(Long id) {
        boolean exists = invoiceRepository.existsById(id);
        if (!exists){
            throw new IllegalStateException("Invoice with id" + id + "does not exists");
        }
        this.invoiceRepository.deleteById(id);
    }
}
