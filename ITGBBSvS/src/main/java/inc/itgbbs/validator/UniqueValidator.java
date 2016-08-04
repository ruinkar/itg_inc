package inc.itgbbs.validator;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import inc.itgbbs.dao.LoginDao;

@Component
public class UniqueValidator implements ConstraintValidator<Unique, Object> {

	@Autowired
	LoginDao loginDao;
	
	String col;
	
	@Override
	public void initialize(Unique constraintAnnotation) {
		this.col = constraintAnnotation.col();
	}

	@Override
	public boolean isValid(Object value, ConstraintValidatorContext context) {
		
		if (loginDao.getMember(value.toString()) == 0) {
			return false;
		} else {
			return true;
		}
		
	}
	
}
