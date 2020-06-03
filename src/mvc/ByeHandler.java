package mvc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ByeHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//요청을 처리(했다치고)
		
		//처리한 결과를 저장, 이름 통일해야한다(꺼내쓰기 때문에)
		request.setAttribute("result", "안녕히 가세요");
		
		//view 페이지 지정
		return "mvc/bye.jsp";
	}
	
}
