package controller;

//FileInputStream
import java.io.FileInputStream;
import java.io.IOException;
//Map,Properties
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.CommandAction;

public class ControllerAction extends HttpServlet {
	
	// 명령어와 명령어 처리클래스를 쌍으로 저장
	private Map commandMap = new HashMap();

	// 서블릿을 실행시 서블릿의 초기화 작업->생성자
	public void init(ServletConfig config) throws ServletException {

		// 경로에 맞는 CommandPro.properties파일을 불러옴
//		String props = "C:/Users/increpas03/git/itg_inc/ITGBBS/WebContent/props/commandPro.properties";
		String props = config.getInitParameter("propertyConfig");

		// 명령어와 처리클래스의 매핑정보를 저장할
		// Properties객체 생성
		Properties pr = new Properties();
		FileInputStream f = null;// 파일불러올때
		
		props = config.getServletContext().getRealPath(props);
		System.out.println("불러온경로 = " + props);
		
		try {
			// CommandPro.properties파일의 내용을 읽어옴
			f = new FileInputStream(props);

			// 파일의 정보를 Properties에 저장
			pr.load(f);

		} catch (IOException e) {
			throw new ServletException(e);
		} finally {
			if (f != null)
				try {
					f.close();
				} catch (IOException ex) {
				}
		}

		// 객체를 하나씩 꺼내서 그 객체명으로 Properties
		// 객체에 저장된 객체를 접근
		Iterator keyiter = pr.keySet().iterator();

		while (keyiter.hasNext()) {
			// 요청한 명령어를 구하기위해
			String command = (String) keyiter.next();
			System.out.println("command=" + command);
			// 요청한 명령어(키)에 해당하는 클래스명을 구함
			String className = pr.getProperty(command);
			System.out.println("className=" + className);

			try {
				// 그 클래스의 객체를 얻어오기위해 메모리에 로드
				Class commandClass = Class.forName(className);
				System.out.println("commandClass=" + commandClass);
				Object commandInstance = commandClass.newInstance(); // 객체 생성
				System.out.println("commandInstance=" + commandInstance);

				// Map객체 commandMap에 저장
				commandMap.put(command, commandInstance);
				System.out.println("commandMap=" + commandMap);

			} catch (ClassNotFoundException e) {
				throw new ServletException(e);
			} catch (InstantiationException e) {
				throw new ServletException(e);
			} catch (IllegalAccessException e) {
				throw new ServletException(e);
			}
		} // while
	}

	public void doGet(// get방식의 서비스 메소드
			HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		requestPro(request, response);
	}

	protected void doPost(// post방식의 서비스 메소드
			HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		requestPro(request, response);
	}

	// 시용자의 요청을 분석해서 해당 작업을 처리
	private void requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String view = null; // 이동할 페이지명 /list.do → action.ListAction → list.jsp
		// 각 요청마다 액션 클래스의 객체를 생성하지 않음
		// → 상속받은 인터페이스 객체 생성
		CommandAction com = null; // 요청마다 처리할 클래스의 객체
		// 요청 명령어 분석
		try {
			String command = request.getRequestURI(); // JspBoard2/list.do
			System.out.printf("request.getRequestURI() = %s%n", command);
			System.out.printf("request.getContextPath() = %s%n", request.getContextPath()); // /JspBoard2
			if (command.indexOf(request.getContextPath()) == 0) {
				command = command.substring(request.getContextPath().length());
				System.out.printf("command = %s%n", command); // /list.do
			}
			// 이 요청 명령어에 해당하는 객체를 Map에서 꺼내온다.
			com = (CommandAction) commandMap.get(command);
			System.out.printf("com = %s%n", com);
			// 생성한 객체를 이용해 이동할 페이지명을 얻어온다.
			view = com.requestPro(request, response);
			System.out.printf("view = %s%n", view); // list.jsp
		} catch (Throwable t) {

			throw new ServletException(t); // e.getMessage(), e.toString()
		}
		// 실질적 이동 구문
		RequestDispatcher dispatcher = request.getRequestDispatcher(view);
		dispatcher.forward(request, response);
	}
}

