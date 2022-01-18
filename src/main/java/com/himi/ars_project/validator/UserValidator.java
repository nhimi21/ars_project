package com.himi.ars_project.validator;

import com.himi.ars_project.models.User;
import com.himi.ars_project.repositories.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

@Component
public class UserValidator implements Validator {
    @Autowired
    private UserRepository userRepository;

    @Override
    public boolean supports(Class<?> clazz) {
        return User.class.equals(clazz);
    }
    @Override
    public void validate(Object target, Errors errors) {
        User user = (User) target;
        if (this.userRepository.existsByUsername(user.getUsername())) {
            errors.rejectValue("email", "Unique","Email already has been taken!");
        }
        if (!user.getConfirmPassword().equals(user.getPassword())) {
            errors.rejectValue("confirmPassword", "Match","Password and Confirm Password doesn't match!");
        }
    }
}