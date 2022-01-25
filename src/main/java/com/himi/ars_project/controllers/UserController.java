package com.himi.ars_project.controllers;

import com.himi.ars_project.models.Role;
import com.himi.ars_project.models.User;
import com.himi.ars_project.repositories.RoleRepository;
import com.himi.ars_project.services.UserService;
import com.himi.ars_project.validator.UserValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.security.Principal;

@Controller
public class UserController {
    @Autowired
    private  UserService userService;
    @Autowired
    public UserValidator userValidator;
    @Autowired
    private  RoleRepository roleRepository;

    @RequestMapping("/registration")
    public String registerForm(@Valid @ModelAttribute("user") User user) {
        return "/auth/registerPage";
    }
    @PostMapping("/registration")
    public String registration(@Valid @ModelAttribute("user") User user, BindingResult result, Model model, HttpSession session) {
        userValidator.validate(user, result);
        if (result.hasErrors()) {
            return "/auth/registerPage";
        }
        User u = userService.saveWithUserRole(user);
        session.setAttribute("userId", u.getId());
        return "redirect:/";
    }
    @RequestMapping("/login")
    public String login(@RequestParam(value="error", required=false) String error, @RequestParam(value="logout", required=false) String logout, Model model) {
        if(error != null) {
            model.addAttribute("errorMessage", "Invalid Credentials!");
        }
        if(logout != null) {
            model.addAttribute("logoutMessage", "Logout Successful!");
        }
        return "/auth/loginPage";
    }
    @PostMapping(value = "/login")
    public String loginUser(@RequestParam("username") String username,
                            @RequestParam("password") String password,
                            Model model, HttpSession session) {
        boolean isAuthenticated = userService.authenticateUser(username, password);
        if (isAuthenticated) {
            User user = userService.findByUsername(username);
            session.setAttribute("userId", user.getId());
        }
        return "redirect:/";
    }
    @RequestMapping("/")
    public String home(Principal principal, Model model, HttpSession session) {
        String username = principal.getName();
        model.addAttribute("currentUser", userService.findByUsername(username));
        return "/index/homePage";
    }
    @RequestMapping( "/admin")
    public String adminPage(Principal principal, Model model) {
        String username = principal.getName();
        model.addAttribute("currentUser", userService.findByUsername(username));
        return "/admin/homeA";
    }
    @GetMapping("/user")
    public String users(Model model, Principal principal){
        String username = principal.getName();
        model.addAttribute("currentUser", userService.findByUsername(username));
        return "/user/ticket";
    }
//    @GetMapping("/")
//    public String correctUser(@Re("user") User user, Model model, HttpSession session, Principal principal){
//        String username = principal.getName();
//        model.addAttribute("currentUser", userService.findByUsername(username));
//        boolean isCorrectUser = userService.findUserRoleAdmin(user);
//        if (userService.findUserRoleAdmin(user)){
//
//        }
//    }
}
