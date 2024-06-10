package com.yamisora.superwebne.seeder;

import org.springframework.stereotype.Component;
import com.yamisora.superwebne.model.ParkingCategory;
import com.yamisora.superwebne.repository.ParkingCategoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.core.annotation.Order;
@Component
@Order(2)
public class ParkingCategorySeed implements CommandLineRunner{
    public ParkingCategorySeed() {
        super();
    }

    @Autowired
    private ParkingCategoryRepository parkingCategoryRepository;

    String [][]data = {
        {"Car", "Parking for Car"},
        {"Bike", "Parking for Bike"},
    };

    public void ParkingCategoryData() throws Exception{
        if(parkingCategoryRepository.count() == 0) {
            for (String[] parkingCategory : data) {
                parkingCategoryRepository.save(new ParkingCategory(parkingCategory[0], parkingCategory[1]));
            }
            System.out.println("Parking Category data has been seeded");
        }
    }
    @Override
    public void run(String... args) throws Exception {
        ParkingCategoryData();
    }
}
