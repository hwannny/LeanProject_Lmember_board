package study;
import javax.servlet.http.HttpServlet; //웹용 서블릿 클래스
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.ServletException;

import java.io.IOException;


public class HelloServlet extends HttpServlet{
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
		throws IOException, ServletException{
		//요청을 받는다
		//요청을 분석한다
		//요청을 처리한다
		// 처리된 결과를 응답
		resp.setContentType( "text/html" );
		java.io.PrintWriter out = resp.getWriter();

		out.println( "<html>" );
		out.println(		"<head>" );
		out.println(			"<title> Hello Servlet </title>" );
		out.println(		"</head>" );
		out.println( 	"<body>" );
		out.println(			"<h2> Servlet </h2>" );
		out.println(			"Hello Servlet!!! <br>" );
		out.println( 	"</body>" );
		out.println( "</html>" );
		
	}
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
		throws IOException, ServletException{
		doGet( req, resp );
	}

}
