package com.yamisora.superwebne.validation;
import com.yamisora.superwebne.model.User;
import com.yamisora.superwebne.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import jakarta.validation.ConstraintValidator;
import com.yamisora.superwebne.interfaces.validation.UniqueUsernameValue;
import jakarta.validation.ConstraintValidatorContext;
public class UniqueUsernameValueValidation implements ConstraintValidator<UniqueUsernameValue, String>{

    @Override
    public void initialize(UniqueUsernameValue constraintAnnotation) {
        ConstraintValidator.super.initialize(constraintAnnotation);
    }

    @Autowired
    private UserRepository userRepository;

    @Override
    public boolean isValid(String value, ConstraintValidatorContext context){
        User user = userRepository.findByUsername(value);
        if(user != null){
            return false;
        }
        return true;
    }
    
}
