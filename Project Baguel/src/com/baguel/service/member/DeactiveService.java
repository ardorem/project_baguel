package com.baguel.service.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface DeactiveService {
	public void execute(HttpServletRequest request, HttpServletResponse response);
}
