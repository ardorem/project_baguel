package com.baguel.service.board;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface ListCalcService {
	public ArrayList execute(HttpServletRequest request, HttpServletResponse response);
}
