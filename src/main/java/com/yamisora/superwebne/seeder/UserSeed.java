package com.yamisora.superwebne.seeder;
import org.springframework.beans.factory.annotation.Autowired;

import com.yamisora.superwebne.model.Role;
import com.yamisora.superwebne.model.User;
import com.yamisora.superwebne.repository.UserRepository;
import com.yamisora.superwebne.repository.RoleRepository;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;
@Component
public class UserSeed implements CommandLineRunner{
    public UserSeed(){
        super();
    };
    @Autowired
    private UserRepository userRepository;

    @Autowired
    private RoleRepository roleRepository;

    String[][] users = {
        {"admin", "admin@gmail.com", "Admin"},
        {"mod", "mod@gmail.com", "Mod"},
        {"user", "user@gmail.com", "User"},
    };

    public void UserData() throws Exception{
        if(userRepository.count() == 0) {
            for (String[] user : users) {
                Role role = roleRepository.findByName(user[2]);
                userRepository.save(new User(user[0], user[1], "123456", role));
            }
            System.out.println("User data has been seeded");
        }
    }

    @Override
    public void run(String... args) throws Exception {
        UserData();
    }
}
