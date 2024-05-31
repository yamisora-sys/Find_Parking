package com.yamisora.superwebne.seeder;

import org.springframework.stereotype.Component;
import org.springframework.boot.CommandLineRunner;
import org.springframework.beans.factory.annotation.Autowired;
import com.yamisora.superwebne.repository.PermissionRepository;
import com.yamisora.superwebne.model.Permission;
@Component
public class PermissionSeed implements CommandLineRunner{
    

    public PermissionSeed() {
        super();
    }

    @Autowired
    private PermissionRepository permissionRepository;

    String[][] permissions = {
        {"Create Permission", "Create permission"},
        {"Read Permission", "Read permission"},
        {"Update Permission", "Update permission"},
        {"Delete Permission", "Delete permission"},
    };

    public void PermissionData() throws Exception{
        if(permissionRepository.count() == 0) {
            for (String[] permission : permissions) {
                permissionRepository.save(new Permission(permission[0], permission[1]));
            }
            System.out.println("Permission data has been seeded");
        }
    }

    @Override
    public void run(String... args) throws Exception {
        PermissionData();
    }
}
