package com.example.application.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.Collections;
import java.util.Date;
import java.util.Map;

import com.example.application.model.User;
import com.example.application.model.Role;
import com.example.application.repository.UserRepository;
@Controller
public class RegistrationController {
    @Autowired
    private UserRepository userRepository;

    @GetMapping("/registration")
    public String registration() {
        return "registration";
    }

    @PostMapping("/registration")
    public String addUser(User user, Map<String, Object> model) {
        User userBase = userRepository.findByUsername(user.getUsername());

        if (userBase != null) {
            model.put("message", "This user already exists!");
            return "registration";
        }
        Date date = new Date();
        user.setActive(true);
        user.setRoles(Collections.singleton(Role.USER));
        user.setRegistrationDate(date.toString().substring(4));
        user.setLastConnectionDate(date.toString().substring(4));
        userRepository.save(user);

        return "redirect:/login";
    }
}