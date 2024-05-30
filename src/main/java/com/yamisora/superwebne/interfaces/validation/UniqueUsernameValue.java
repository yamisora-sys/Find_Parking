package com.yamisora.superwebne.interfaces.validation;


import java.lang.annotation.*;
import jakarta.validation.Constraint;
import jakarta.validation.Payload;
import com.yamisora.superwebne.validation.UniqueUsernameValueValidation;
@Target({ElementType.METHOD, ElementType.FIELD})
@Retention(RetentionPolicy.RUNTIME)
@Documented
@Constraint(validatedBy = UniqueUsernameValueValidation.class)
public @interface UniqueUsernameValue {
    String message() default "Username already exists";
    Class <?>[] groups() default {};
    Class <? extends Payload>[] payload() default {};
}
