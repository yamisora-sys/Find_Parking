package com.yamisora.superwebne.seeder;

import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;
import com.yamisora.superwebne.component.PythonRunner;
import org.springframework.beans.factory.annotation.Autowired;
import com.yamisora.superwebne.repository.ParkingRepository;
import org.springframework.core.annotation.Order;
@Component
@Order(7)
public class ParkingSeed  implements CommandLineRunner{

    @Autowired
    private ParkingRepository parkingRepository;

    @Override
    public void run(String... args) throws Exception {
        if(parkingRepository.count() == 0) {
            PythonRunner pythonRunner = new PythonRunner();
            pythonRunner.runScript("parking_data.py");
            System.out.println("Parking data has been seeded");
        }
    }
}
