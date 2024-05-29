package com.yamisora.superwebne.interfaces.validation;
import java.lang.annotation.*;

import com.yamisora.superwebne.validation.ValueMatchingValidator;

import jakarta.validation.Constraint;
import jakarta.validation.Payload;

@Target({ElementType.TYPE})
@Retention(RetentionPolicy.RUNTIME)
@Documented
@Repeatable(ValueMatching.List.class)
@Constraint(validatedBy = ValueMatchingValidator.class)
public @interface ValueMatching {
    String message() default "Fields are not equal";
    Class<?>[] groups() default {};
    Class<? extends Payload>[] payload() default {};
    String field();
    String fieldMatch();

    @Target({ElementType.TYPE})
    @Retention(RetentionPolicy.RUNTIME)
    @Documented
    @interface List {
        ValueMatching[] value();
    }
}
