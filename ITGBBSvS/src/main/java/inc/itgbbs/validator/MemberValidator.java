package inc.itgbbs.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import inc.itgbbs.domain.MemberCommand;

public class MemberValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		return MemberCommand.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object obj, Errors e) {
		ValidationUtils.rejectIfEmptyOrWhitespace(e, "id", "required");
		ValidationUtils.rejectIfEmptyOrWhitespace(e, "password", "required");
		ValidationUtils.rejectIfEmptyOrWhitespace(e, "nick", "required");
		ValidationUtils.rejectIfEmptyOrWhitespace(e, "name", "required");
		ValidationUtils.rejectIfEmptyOrWhitespace(e, "email", "required");	

	}

}
