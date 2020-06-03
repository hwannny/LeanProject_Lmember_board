package mvc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class NullHandler implements CommandHandler {
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//요청을 처리(했다치고)
		
		//처리한 결과를 저장
		request.setAttribute("result", "처리할 요청이 없습니다");
		
		//view 페이지 지정
		return "mvc/null.jsp";
	}
}
