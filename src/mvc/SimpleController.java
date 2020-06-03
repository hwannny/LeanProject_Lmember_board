package mvc;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SimpleController extends HttpServlet {

	private HashMap<String, CommandHandler> handlerMap = new  HashMap<String, CommandHandler>();
	
	@Override
	//시작하자마자 실행되는 함수
	public void init(ServletConfig config) throws ServletException {//ServletConfig는 web.xml의 config접속
		//web.xml의 configFile이라는 이름의 cofig를 가져온다   ----  WEB-INF/handler.properties
		String configFile = config.getInitParameter("configFile"); 
		
		//﻿http://localhost:8080/JSP/﻿ + WEB-INF/handler.properties
		String fileName = config.getServletContext().getRealPath("/") + configFile; //파일경로, application.리얼패스와 같은 명령어
		
		FileInputStream fis = null;
		Properties prop = new Properties();
		try {
			fis = new FileInputStream( fileName );
			prop.load(fis);// properties로 로드
			Iterator<Object> iter =  prop.keySet().iterator(); //키만뽑아 셋으로 만들어줬다
			
			//객체를 미리 생성해서 넣어준다
			while( iter.hasNext() ) { //키를 가져온것
				String command = (String)iter.next(); //오브젝트로 리턴하므로 string화
				String handlerName = prop.getProperty(command);//키에 해당하는 맵핑값을 가져옴(ex, mvc.HelloHandler )
				Class<?> handlerClass = Class.forName( handlerName ); //클래스를 관리하는 클래스가 생긴거,
				CommandHandler handler = (CommandHandler)handlerClass.newInstance(); //이제 각각에 경로에 해당 하는 핸드러 객체를 만든것이다
				
				//사용 하기 위해 객체를 꺼내준다
				handlerMap.put(command, handler );
			}		
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (InstantiationException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		}
	}
	
	public void doProcess( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {
		
		// 요청을 받는다
		//String command = request.getParameter( "command" );
		String command = request.getRequestURI();
		if( command.indexOf( request.getContextPath() )==0 )  {
			command = command.substring( request.getContextPath().length() );
		}
		
		//핸들러 객체를 꺼내준다
		CommandHandler handler = handlerMap.get(command);
		if(handler==null ) {
			//command가 없거나, 이상하거나
			handler = new DefaultHandler(); //디폴트를 강제로 넣어줌
		}

		String viewPage = null;
		try {
			viewPage = handler.process( request, response ); //페이지 경로를 받는다
		} catch( Exception e ) {
			e.printStackTrace();
		}
				
		// View 로 dispatch				
		RequestDispatcher dispatcher = request.getRequestDispatcher( viewPage );
		dispatcher.forward( request, response );
		
	}//process
	
	
	public void doGet( HttpServletRequest request, HttpServletResponse response) 
		throws ServletException, IOException {
		doProcess( request, response );
	}
	public void doPost( HttpServletRequest request, HttpServletResponse response ) 
		throws ServletException, IOException {
		doProcess( request, response );
	}	
}

