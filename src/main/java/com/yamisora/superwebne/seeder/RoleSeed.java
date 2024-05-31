package com.yamisora.superwebne.seeder;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;
import com.yamisora.superwebne.repository.RoleRepository;
import com.yamisora.superwebne.model.Role;

@Component
public class RoleSeed implements CommandLineRunner {
    
    public RoleSeed() {
        super();
    }

    @Autowired
    private RoleRepository roleRepository;


    @Override
    public void run(String... args) throws Exception {
        RoleData();
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
