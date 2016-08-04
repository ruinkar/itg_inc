package inc.itgbbs.validator;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

import javax.validation.Constraint;

@Target({ElementType.METHOD, ElementType.FIELD})
@Retention(RetentionPolicy.RUNTIME)
@Documented
@Constraint(validatedBy={UniqueValidator.class})
public @interface Unique {
	String message() default "{중복}";
	Class<!--?-->[] groups() default {};
    Class<!--? extends Payload-->[] payload() default {};
    
    String col() default "";
    String field() default "";
}
