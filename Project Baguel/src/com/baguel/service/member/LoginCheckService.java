package com.baguel.service.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface LoginCheckService {
	public int execute(HttpServletRequest request, HttpServletResponse response);
}
