package com.yamisora.superwebne.validation;
import com.yamisora.superwebne.interfaces.validation.ValueMatching;

import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;

public class ValueMatchingValidator implements ConstraintValidator<ValueMatching, Object>{
    private String field;
    private String fieldMatch;

    @Override
    public void initialize(ValueMatching constraintAnnotation) {
        this.field = constraintAnnotation.field();
        this.fieldMatch = constraintAnnotation.fieldMatch();
    }

    @Override
    public boolean isValid(Object object, ConstraintValidatorContext constraintValidatorContext) {
        try {
            Object fieldObject = object.getClass().getDeclaredField(field).get(object);
            Object fieldMatchObject = object.getClass().getDeclaredField(fieldMatch).get(object);
            return fieldObject != null && fieldObject.equals(fieldMatchObject);
        } catch (Exception e) {
            return false;
        }
    }
}
