package mvc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class WelcomeHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//요청을 처리(했다치고)
		
		//처리한 결과를 저장
		request.setAttribute("result", "방가");
				
		//view 페이지 지정
		return "mvc/welcome.jsp";

	}

}
