package com.yamisora.superwebne.interfaces.validation;

import java.lang.annotation.*;
import jakarta.validation.Constraint;
import jakarta.validation.Payload;
import com.yamisora.superwebne.validation.PasswordMatchingValidation;

@Target({ElementType.TYPE, ElementType.ANNOTATION_TYPE, ElementType.FIELD})
@Retention(RetentionPolicy.RUNTIME)
@Constraint(validatedBy = PasswordMatchingValidation.class)
@Documented
public @interface PasswordMatching {
    String message() default "Password not matching";
    Class<?>[] groups() default {};
    Class <? extends Payload>[] payload() default {};
    String password();
    String confirmPassword();

    @Target({ElementType.TYPE, ElementType.ANNOTATION_TYPE, ElementType.FIELD})
    @Retention(RetentionPolicy.RUNTIME)
    @Documented
    @interface List {
        PasswordMatching[] value();
    }
}
