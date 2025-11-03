package servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("*.one")
public class FrontController extends HttpServlet{ 
	private static final long serialVersionUID = 1L;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=UTF-8");
		String uri = req.getRequestURI();
		int lastSlash = uri.lastIndexOf("/");
		String commandStr = uri.substring(lastSlash);
		
		if(commandStr.equals("/regist.one"))
			registFunc(req);
		else if(commandStr.equals("/login.one"))
			logniFunc(req);
		else if(commandStr.equals("/freeboard.one"))
			freeboardFunc(req);
		req.setAttribute("uri", uri);
		req.setAttribute("commandStr", commandStr);
		req.getRequestDispatcher("/12Servlet/FrontController.jsp").forward(req, resp);
	}
	private void freeboardFunc(HttpServletRequest req) {
		// TODO 자동 생성된 메소드 스텁
		req.setAttribute("resultValue", "<h4>회원가입</h4>");
	}
	private void logniFunc(HttpServletRequest req) {
		// TODO 자동 생성된 메소드 스텁
		req.setAttribute("resultValue", "<h4>로그인</h4>");
	}
	private void registFunc(HttpServletRequest req) {
		// TODO 자동 생성된 메소드 스텁
		req.setAttribute("resultValue", "<h4>자유게시판</h4>");
	}
}
