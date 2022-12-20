package com.baguel.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.sql.Timestamp;
import java.util.ArrayList;

import com.baguel.model.member.*;
import com.baguel.service.member.*;
import com.baguel.model.board.*;
import com.baguel.service.board.*;
/**
 * Servlet implementation class MemberController
 */
@WebServlet("*.do")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public Controller() {
		super();
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet");
		actionDo(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost");
		actionDo(request, response);
	}
	
	private void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String command = uri.substring(conPath.length());
		HttpSession session = request.getSession();
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		
		if(command.equals("/insert_confirm.do")) {
			System.out.println("> Access to → /insert_confirm.do");	
			PrintWriter out = response.getWriter();
			int idResult;
			int nickResult;
			
			request.setAttribute("userId", request.getParameter("userId"));
			InsertIdConfirm insertIdConfirm = new InsertIdConfirmImpl();
			idResult = insertIdConfirm.execute(request, response);
			
			request.setAttribute("userNick", request.getParameter("userNick"));
			InsertNickConfirm insertNcikConfirm = new InsertNickConfirmImpl();
			nickResult = insertNcikConfirm.execute(request, response);
			
			if(idResult == MemberDao.MEMBER_EXISTENT) {
				out.println("<script>");
				out.println("alert(\"아이디가 이미 존재합니다.\");");
				out.println("history.back();");
				out.println("</script>");
				
			} else if(nickResult == MemberDao.MEMBER_EXISTENT) {
				out.println("<script>");
				out.println("alert(\"닉네임 이미 존재합니다.\");");
				out.println("history.back();");
				out.println("</script>");
			} else {
				RequestDispatcher dispatch = request.getRequestDispatcher("/insert_member.do");
				dispatch.forward(request, response);		
			}
		}
	
		if(command.equals("/modify_confirm.do")) {
			System.out.println("> Access to → /modify_confirm.do");
			PrintWriter out = response.getWriter();
			int nickResult;
			
			request.setAttribute("userId", session.getAttribute("userId"));
			request.setAttribute("userNick", request.getParameter("userNick"));
			
			ModifyNickConfirm modifyNcikConfirm = new ModifyNickConfirmImpl();
			nickResult = modifyNcikConfirm.execute(request, response);
			
			if(nickResult == MemberDao.MEMBER_EXISTENT) {
				out.println("<script>");
				out.println("alert(\"닉네임 이미 존재합니다.\");");
				out.println("history.back();");
				out.println("</script>");
			} else {
				RequestDispatcher dispatch = request.getRequestDispatcher("/update_member.do");
				dispatch.forward(request, response);		
			}
		}
		
		if(command.equals("/update_member.do")) {
			System.out.println("> Access to → /update_member.do");
			MemberDto updateMember = new MemberDto();
			int modifyResult;
			
			updateMember.setUserPw(request.getParameter("userPw"));
			updateMember.setUserName(request.getParameter("userName"));
			updateMember.setUserNick(request.getParameter("userNick"));
			updateMember.setUserMail(request.getParameter("userMail"));
			updateMember.setUserId((String)session.getAttribute("userId"));
			
			PrintWriter out = response.getWriter();
			

			request.setAttribute("updateMember", updateMember);
			ModifyService modifyService = new ModifyServiceImpl();
			modifyResult = modifyService.execute(request, response);
			
			if(modifyResult == 1) {
				RequestDispatcher dispatch = request.getRequestDispatcher("/modify_ok");
				dispatch.forward(request, response);
				
			} else {
				out.println("<script>");
				out.println("alert(\"회원정보 수정을 실패 했습니다.\");");
				out.println("history.back();");
				out.println("</script>");
			}
		}
		
		if(command.equals("/insert_member.do")) {
			System.out.println("> Access to → /insert_member.do");
			PrintWriter out = response.getWriter();
			MemberDto insMember = new MemberDto();
			int insertResult;
			
			insMember.setUserId(request.getParameter("userId"));
			insMember.setUserPw(request.getParameter("userPw"));
			insMember.setUserName(request.getParameter("userName"));
			insMember.setUserNick(request.getParameter("userNick"));
			insMember.setUserMail(request.getParameter("userMail"));
			insMember.setrDate(new Timestamp(System.currentTimeMillis()));
			
			request.setAttribute("insMember", insMember);
			InsertService insertService = new InsertServiceImpl();
			insertResult = insertService.execute(request, response);
			
			if(insertResult == MemberDao.MEMBER_JOIN_SUCCESS) {
				RequestDispatcher dispatch = request.getRequestDispatcher("/register_ok");
				dispatch.forward(request, response);
				
			} else {
				out.println("<script>");
				out.println("alert(\"회원가입에 실패 했습니다.\");");
				out.println("history.back();");
				out.println("</script>");
			}
			
		}
		
		if(command.equals("/password_check.do")) {
			System.out.println("> Access to → /password_check.do");
			MemberDto checkMember = new MemberDto();
			MemberDto loginMember = new MemberDto();
			PrintWriter out = response.getWriter();
			loginMember = (MemberDto)session.getAttribute("loginMember");
			
			checkMember.setUserId(String.valueOf(session.getAttribute("userId")));
			checkMember.setUserPw(request.getParameter("userPw"));
			request.setAttribute("checkMember", checkMember);
			
			LoginCheckService loginService = new LoginCheckServiceImpl();
			int result = loginService.execute(request, response);
			
			if(result == 0) {
				out.println("<script>");
				out.println("alert(\"비밀번호가 일치하지 않습니다.\");");
				out.println("history.back();");
				out.println("</script>");
			} else if(result == 1) {

				request.setAttribute("userId", loginMember.getUserId());
				request.setAttribute("userName", loginMember.getUserName());
				request.setAttribute("userNick", loginMember.getUserNick());
				request.setAttribute("userMail", loginMember.getUserMail());
				RequestDispatcher dispatch = request.getRequestDispatcher("/modify");
				dispatch.forward(request, response);
			}
			
		}
		
		if(command.equals("/login_check.do")) {
			System.out.println("> Access to → /login_check.do");
			MemberDto checkMember = new MemberDto();
			PrintWriter out = response.getWriter();
			
			checkMember.setUserId(request.getParameter("userId"));
			checkMember.setUserPw(request.getParameter("userPw"));
			request.setAttribute("checkMember", checkMember);
			System.out.println(">>user try to LOGIN");
			System.out.println(">>ID : " + request.getParameter("userId"));
			System.out.println(">>PW : " + request.getParameter("userPw"));
			
			LoginCheckService loginService = new LoginCheckServiceImpl();
			int result = loginService.execute(request, response);
			
			if(result == -1) {
				out.println("<script>");
				out.println("alert(\"아이디가 존재하지 않습니다.\");");
				out.println("history.back();");
				out.println("</script>");	
			} else if(result == 0) {
				out.println("<script>");
				out.println("alert(\"비밀번호가 일치하지 않습니다.\");");
				out.println("history.back();");
				out.println("</script>");
			} else if(result == 1) {
				request.setAttribute("userId", request.getParameter("userId"));
				RequestDispatcher dispatch = request.getRequestDispatcher("/login.do");
				dispatch.forward(request, response);
			}
		}
		if(command.equals("/login.do")) {
			System.out.println("> Access to → /login.do");			
			LoginService loginService = new LoginServiceImpl();
			MemberDto loginMember = loginService.execute(request, response);
			PrintWriter out = response.getWriter();
			if(loginMember == null) {
				out.println("<script>");
				out.println("alert(\"존재하지 않는 회원입니다.\");");
				out.println("history.back();");
				out.println("</script>");
			} else {
				session.setAttribute("loginMember", loginMember);
				session.setAttribute("userId", loginMember.getUserId());
				session.setAttribute("userNick", loginMember.getUserNick());
				response.sendRedirect("login_ok");
			}
		}
		
		if(command.equals("/deactive.do")) {
			System.out.println("> Access to → /deactive.do");
			request.setAttribute("userId", session.getAttribute("userId"));
			DeactiveService deactiveService = new DeactiveServiceImpl();
			deactiveService.execute(request, response);
			session.invalidate();
			response.sendRedirect("/baguel/goodbye");
		}
		
		if(command.equals("/logout.do")) {
			System.out.println("> Access to → /logout.do");
			session.invalidate();
			response.sendRedirect("/baguel/logout");
		}
		
		//----------------------------------------------------------------------------- BOARD START
		
//		if(command.equals("/listCalc.do")) {
//			System.out.println("> Access to → /listCalc.do");
//
//		}
		if(command.equals("/list.do")) {
			System.out.println("> Access to → /list.do");
			// DB 접근해서 총 페이지 계산 후
			// 1번에 해당되는 범위를 찾아내어,
			// DB 접근 및 해당 범위의 row를 객체에 담아오기
//			String minRowNum = null;
//			String maxRowNum = null;
//			String pages = null;
//			String pagesAdd = null;
			int minRowNum;
			int maxRowNum;
			int pages;
			int pagesAdd;
			
			// 페이지 수 계산
			ArrayList<Integer> rowNumList = new ArrayList<Integer>();
			ListCalcService listCalcService = new ListCalcServiceImpl();
			rowNumList = listCalcService.execute(request, response);
			
			pagesAdd = 0;
			minRowNum = rowNumList.get(0);
			maxRowNum = rowNumList.get(1);
			pages = rowNumList.size() / 2;
			
			request.setAttribute("pagesAdd", pagesAdd);
			request.setAttribute("minRowNum", minRowNum);
			request.setAttribute("maxRowNum", maxRowNum);
			
			// 보여 줄 리스트 받아오기
			ArrayList<BoardDto> boardList = new ArrayList<BoardDto>();
			ListService listService = new ListServiceImpl();
			boardList = listService.execute(request, response);
			
			request.setAttribute("boardList", boardList);
			request.setAttribute("pages", pages);
			RequestDispatcher dispatch = request.getRequestDispatcher("/output.jsp");
			dispatch.forward(request, response);
			
		}
		
		if(command.equals("/paging.do")) {
			System.out.println("> Access to → /paging.do");
			// DB 접근해서 총 페이지 계산 후
			// 전달받은 페이지 번호에 해당하는 범위 찾아내어,
			// DB 접근 및 해당 범위 객체에 담아오기
		}
		if(command.equals("/insert_board.do")) {
			System.out.println("> Access to → /insert_board.do");
			// 전달받은 데이터로 DB 접근하여 INSERT
		}
		
		
	}
}
