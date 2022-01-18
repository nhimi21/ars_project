package com.himi.ars_project.repositories;

import com.himi.ars_project.models.User;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserRepository extends CrudRepository<User, Long> {
    List<User> findAll();
    boolean existsByUsername(String username);
    User findByUsername(String username);

}