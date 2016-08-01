package com.board.view;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

//뷰클래스의 객체를 생성 -> 뷰클래스 -> AbstractView 클래스를 상속받음.(대화상자)
@Component
public class DownloadView extends AbstractView {

	public DownloadView() {
		System.out.println("DownloadView() 생성자 호출됨");
		setContentType("application/download;charset=utf-8");
	}
	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		// 1.매개변수 받을 때 관여하는 객체(Map) 2.request(요청) 3.response(응답)
		File file = (File)model.get("downloadFile");
		//2.다운로드 받을 파일의 타입, 파일의 길이 설정
		System.out.println("getContentType() = " + getContentType());
		response.setContentType(getContentType());//타입설정
		response.setContentLength((int)file.length());//다운받는 파일의 길이 설정
		//3.브라우저 종류별로 설정 -> User-Agent 키값으로 저장 -> setHeader()저장
		String userAgent = request.getHeader("User-Agent");
		boolean ie = userAgent.indexOf("MSIE") > -1; //브라우저가 MSIE라면
		System.out.println("ie = " + ie);
		String fileName = null; //파일정보
		
		if (ie) { //IE
			fileName = URLEncoder.encode(file.getName(), "utf-8");
		} else {
			fileName = new String(file.getName().getBytes("utf-8"), "iso-8859-1");
		}
		System.out.println("fileName = " + fileName);
		//대화상자가 나오게 설정(다운받은 파일의 위치설정)
		response.setHeader("Content-Disposition", "attachment;filename=\"" + fileName + "\";");
		//이진파일도 설정
		response.setHeader("Content-Transfer-Encoding", "binary");
		//내려받기
		OutputStream out = response.getOutputStream(); //서버
		FileInputStream fis = null; //client
		
		try {
			fis = new FileInputStream(file); //서버의 업로드 위치 및 파일명
			FileCopyUtils.copy(fis, out); //in 객체, out 객체
		} finally {
			if(fis != null) {
				try {
					fis.close();
				} catch(Exception e) {
					e.printStackTrace();
				}
			}
		}
		out.flush();
	}
}
