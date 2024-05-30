package com.yamisora.superwebne.validation;
import org.springframework.beans.factory.annotation.Autowired;

import com.yamisora.superwebne.interfaces.validation.UniqueEmailValue;
import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;
import com.yamisora.superwebne.model.User;
import com.yamisora.superwebne.repository.UserRepository;

public class UniqueEmailValueValidation implements ConstraintValidator<UniqueEmailValue, String>{

    @Autowired
    private UserRepository userRepository;

    @Override
    public void initialize(UniqueEmailValue constraintAnnotation) {
        ConstraintValidator.super.initialize(constraintAnnotation);
    }

    @Override
    public boolean isValid(String value, ConstraintValidatorContext context){
        User user = userRepository.findByEmail(value);
        if(user != null){
            return false;
        }
        return true;
    }
}
