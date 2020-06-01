package study;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PersonServlet extends HttpServlet {
		@Override
		protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			//요청을 받고
			String name = new String(req.getParameter("name").getBytes("8859_1"),"utf-8" );
			//String name = req.getParameter("name");
			int age = Integer.parseInt(req.getParameter("age"));
			String gender = req.getParameter("gender");
			String[] hobby = req.getParameterValues("hobby"); 
			//요청을 분석하고 (분석할게 아직 없음)
			//요청을 처리하고(처리할게 아직 없음, 보통 DB )
			
			//결과를 응답한다
			resp.setContentType("text/html; charset=utf-8");
			PrintWriter out = resp.getWriter();

			
			out.println( "<html>" );
			out.println( "	<head>");
			out.println( "		<title>PersonServlet</title>");
			out.println( "	</head>" );
			out.println( "	<body>" );
			out.println( "		<h2>Servlet</h2>" );
			out.println( 		"이름 : " + name + "<br>" );
			out.println( 		"나이 : " + age + "<br>" );
			if( gender.equals("1") ) {
				out.println( 	"성별 : 남자  <br>" );
			}else {
				out.println( 	"성별 : 여자  <br>" );
			}
				out.println(		"취미 : ");
			for( String h : hobby ) {
				switch( h ) {
				case "1": out.println("독서"); break;
				case "2": out.println("등산"); break;
				case "3": out.println("운동"); break;
				case "4": out.println("게임"); break;
				}
			}
			out.println("<br>");
			out.println( "	</body>" );
			
			out.println( "</html>");
			
		}
		
		@Override
		protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			doGet(req, resp);
		}
}
