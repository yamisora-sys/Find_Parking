package com.yamisora.superwebne.validation;

import com.yamisora.superwebne.interfaces.validation.PasswordMatching;
import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;

public class PasswordMatchingValidator implements ConstraintValidator<PasswordMatching, Object>{
    
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
            Object passwordObject = object.getClass().getDeclaredField(password).get(object);
            Object confirmPasswordObject = object.getClass().getDeclaredField(confirmPassword).get(object);
            return passwordObject != null && passwordObject.equals(confirmPasswordObject);
        } catch (Exception e) {
            return false;
        }
    }
}
