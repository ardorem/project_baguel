package com.baguel.service.board;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.baguel.model.board.BoardDao;
import com.baguel.model.board.BoardDto;

public class ListServiceImpl implements ListService {
	private BoardDao boardDao;
	
	public ListServiceImpl() {
		boardDao = BoardDao.getInstance();
	}
	@Override
	public ArrayList<BoardDto> execute(HttpServletRequest request, HttpServletResponse response) {
		int pagesAdd = (int)request.getAttribute("pagesAdd");
		int minRowNum = (int)request.getAttribute("minRowNum");
		int maxRowNum = (int)request.getAttribute("maxRowNum");
		System.out.println(">>> ListServiceImpl");
		System.out.println("pagesAdd : "+pagesAdd);
		System.out.println("minRowNum : "+minRowNum);
		System.out.println("maxRowNum : "+maxRowNum);
		return boardDao.getList(pagesAdd, minRowNum, maxRowNum);
	}

}
