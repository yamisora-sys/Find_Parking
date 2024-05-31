package com.yamisora.superwebne.validation;
import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;
import com.yamisora.superwebne.model.User;
import com.yamisora.superwebne.repository.UserRepository;

import org.springframework.beans.BeanWrapperImpl;

import com.yamisora.superwebne.interfaces.validation.PasswordMatching;
public class PasswordMatchingValidation implements ConstraintValidator<PasswordMatching, Object>{
        
        private String password;
        private String confirmPassword;
    
        @Override
        public void initialize(PasswordMatching constraintAnnotation) {
            this.password = constraintAnnotation.password();
            this.confirmPassword = constraintAnnotation.confirmPassword();
        }
    
        @Override
        public boolean isValid(Object object, ConstraintValidatorContext constraintValidatorContext) {
            try {
                Object passwordValue = new BeanWrapperImpl(object).getPropertyValue(password);
                Object confirmPasswordValue = new BeanWrapperImpl(object).getPropertyValue(confirmPassword);
                String password = passwordValue.toString();
                String confirmPassword= confirmPasswordValue.toString();
                return password.equals(confirmPassword);
            } catch (Exception e) {
                return false;
            }
        }
    
}
