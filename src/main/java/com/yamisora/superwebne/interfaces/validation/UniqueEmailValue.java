package com.yamisora.superwebne.interfaces.validation;
import java.lang.annotation.*;
import jakarta.validation.Constraint;
import jakarta.validation.Payload;
import com.yamisora.superwebne.validation.UniqueEmailValueValidation;
@Target({ElementType.METHOD, ElementType.FIELD})
@Retention(RetentionPolicy.RUNTIME)
@Documented
@Constraint(validatedBy = UniqueEmailValueValidation.class)
public @interface UniqueEmailValue {
    String message() default "Email already exists";
    Class<?>[] groups() default {};
    Class <? extends Payload>[] payload() default {};
}
