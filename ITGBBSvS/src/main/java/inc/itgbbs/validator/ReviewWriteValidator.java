package inc.itgbbs.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import inc.itgbbs.domain.BoardDTO;

//스프링에서 유효성검사(필수입력)를 할려면 Validator인터페이스를 상속받아야 된다.

public class ReviewWriteValidator implements Validator {

	//유효성 검사를 받을 클래스를 지정
	//@Override
	public boolean supports(Class<?> clazz) {//유효성검사를 지원해주는 클래스정보
		// TODO Auto-generated method stub
		//유효성검사를 받을 클래스명.class.isAssignableFrom(매개변수받은 클래스형)
		return BoardDTO.class.isAssignableFrom(clazz);
	}

	//유효성 검사를 해주는 메서드(1.입력받은값이 들어가있는 객체(DTO)model,
	//                                  2.입력받은값에 문제가 발생시 처리해주는 에러객체명
	//@Override
	public void validate(Object target, Errors errors) {
		// TODO Auto-generated method stub
		//1.발생된 에러정보를 가진 객체명,필드(웹상),에러메세지의 에러코드명
		//공백,whitespace를 만나면 에러메세지를 출력
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "pwd", "required");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "writer", "required");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "title", "required");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "content", "required");
	}
}




