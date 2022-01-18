package com.himi.ars_project.services;

import com.himi.ars_project.models.Role;
import com.himi.ars_project.models.User;
import com.himi.ars_project.repositories.RoleRepository;
import com.himi.ars_project.repositories.UserRepository;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserService {
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private RoleRepository roleRepository;
    @Autowired
    private  BCryptPasswordEncoder bCryptPasswordEncoder;
    // 1
    public User saveWithUserRole(User user) {
        user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
        user.setRoles(roleRepository.findByName("ROLE_USER"));
        return this.userRepository.save(user);
    }
    // 2
    public User saveUserWithAdminRole(User user) {
        user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
        user.setRoles(roleRepository.findByName("ROLE_ADMIN"));
        return this.userRepository.save(user);
    }
    public void findUserRoleAdmin(User user, Role role){
        List<Role> role_user = roleRepository.findByName("ROLE_USER");
        user.setRoles(role_user);
    }
    public void findUserRole(User user, Role role){
        List<Role> role_user = roleRepository.findByName("ROLE_ADMIN");
        user.setRoles(role_user);
    }
    // register user and hash their password
    public User registerUser(User user) {
        String hashed = BCrypt.hashpw(user.getPassword(), BCrypt.gensalt());
        user.setPassword(hashed);
        return userRepository.save(user);
    }
    // find all users
    public List<User> getAllUsers(){
        return this.userRepository.findAll();
    }
    // find user by id
    public User findUserById(Long id) {
        return this.userRepository.findById(id).orElse(null);
    }
    // 3
    public User findByUsername(String username) {
        return userRepository.findByUsername(username);
    }
    // authenticate user
    public boolean authenticateUser(String username, String password) {
        // first find the user by email
        User user = userRepository.findByUsername(username);
        // if we can't find it by email, return false
        if(user == null) {
            return false;
        } else {
            return BCrypt.checkpw(password, user.getPassword());
        }
    }

}
