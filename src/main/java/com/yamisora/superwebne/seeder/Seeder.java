package com.yamisora.superwebne.seeder;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

import com.yamisora.superwebne.repository.PermissionRepository;
import com.yamisora.superwebne.repository.RoleRepository;
import com.yamisora.superwebne.repository.UserRepository;
import com.yamisora.superwebne.model.Role;
import com.yamisora.superwebne.model.User;

@Component
public class Seeder implements CommandLineRunner {
    
    public Seeder() {
        super();
    }

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private RoleRepository roleRepository;

    @Autowired
    private PermissionRepository permissionRepository;

    @Override
    public void run(String... args) throws Exception {
        RoleData();
        UserData();
    }

    //username, email, password, role_id 
    String[][] users = {
        {"superadmin", "superadmin@gmail.com", "SuperAdmin"},
        {"admin", "admin@gmail.com", "Admin"},
        {"user", "user@gmail.com", "User"},
    };

    public void UserData() throws Exception{
        if(userRepository.count() == 0) {
            for (String[] user : users) {
                Role role = roleRepository.findByName(user[2]);
                userRepository.save(new User(user[0], user[1], user[2], role));
            }
            System.out.println("User data has been seeded");
        }
    }

    String[][] roles = {
        {"SuperAdmin", "SuperAdmin role"},
        {"Admin", "Admin role"},
        {"User", "User role"},
    };

    public void RoleData() throws Exception{
        if(roleRepository.count() == 0) {
            for (String[] role : roles) {
                roleRepository.save(new Role(role[0], role[1]));
            }
            System.out.println("Role data has been seeded");
        }
    }
}
