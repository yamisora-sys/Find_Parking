package com.yamisora.superwebne.interfaces.validation;


import java.lang.annotation.*;
import com.yamisora.superwebne.validation.PasswordMatchingValidator;
import jakarta.validation.Constraint;
import jakarta.validation.Payload;

@Target({ElementType.TYPE})
@Retention(RetentionPolicy.RUNTIME)
@Documented
@Repeatable(PasswordMatching.List.class)
@Constraint(validatedBy = PasswordMatchingValidator.class)
public @interface PasswordMatching {
    String message() default "Passwords do not match";
    Class<?>[] groups() default {};
    Class<? extends Payload>[] payload() default {};
    String password();
    String confirmPassword();

    @Target({ElementType.TYPE})
    @Retention(RetentionPolicy.RUNTIME)
    @Documented
    @interface List {
        PasswordMatching[] value();
    }
}
