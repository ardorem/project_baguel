package com.baguel.service.board;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.baguel.model.board.BoardDao;

public class ListCalcServiceImpl implements ListCalcService {
	private BoardDao boardDao;
	
	public ListCalcServiceImpl() {
		boardDao = BoardDao.getInstance();
	}
	@Override
	public ArrayList execute(HttpServletRequest request, HttpServletResponse response) {
		ArrayList<Integer> rowNumList = new ArrayList<Integer>();
		int count = boardDao.listCalc();
		System.out.println("ListCalcServiceImpl : " + count);
		
		int tenUnits = count / 10;
		int remainder = count % 10;
		for(int i = 0; i<tenUnits; i++) {
			rowNumList.add(1 + 10*i);
			rowNumList.add(10 + 10*i);
		}
		rowNumList.add(10*tenUnits + 1);
		rowNumList.add(10*tenUnits + remainder);
		
		return rowNumList;
	}

}
