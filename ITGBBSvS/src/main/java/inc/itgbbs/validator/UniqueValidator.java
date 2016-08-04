package inc.itgbbs.validator;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import inc.itgbbs.dao.LoginDao;


@Component
public class UniqueValidator implements ConstraintValidator<Unique, /*Object*/String> {

	@Autowired
	LoginDao loginDao;
	/*
	String colName;
	String tabName;
	String fldName;*/
	
	@Override
	public void initialize(Unique constraintAnnotation) {
		/*
		this.tabName = constraintAnnotation.tabName();
		this.colName = constraintAnnotation.colName();
		this.fldName = constraintAnnotation.fldName();*/
	}

	@Override
	public boolean isValid(String value, ConstraintValidatorContext context) {
		System.out.println("validating unique");
		
		if (loginDao.getMember(value) > 0) {
			return false;
		} else {
			return true;
		}
	}
	
}