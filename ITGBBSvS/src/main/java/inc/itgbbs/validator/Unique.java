package inc.itgbbs.validator;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

import javax.validation.Constraint;
import javax.validation.Payload;

import org.springframework.stereotype.Component;

@Target({ElementType.METHOD, ElementType.FIELD})
@Retention(RetentionPolicy.RUNTIME)
@Constraint(validatedBy={UniqueValidator.class})
public @interface Unique {
	
	String message() default "중복 값 존재";
	Class<?>[] groups() default {};
	Class<? extends Payload>[] payload() default {};
	/*
	String tabName() default "";
    String colName() default "";
    String fldName() default "";*/
	
}
