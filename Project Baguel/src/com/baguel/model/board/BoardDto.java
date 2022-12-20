package com.baguel.model.board;

public class BoardDto {
	private String rownumber;
	private String boardNum; //
	private String eventFrom;
	private String eventTo;
	private String eventPlace;
	private String eventType;
	private String event;
	private String writeDate; //
	private String editDate;
	private String eventDesc;
	private String adminMSG;
	private String id;
	private String viewcount;
	private String approval; //
	private String status; //

	public BoardDto() {}
	
	public BoardDto(String rownumber,String eventPlace, String event, String writeDate, String id, String approval) {
		this.rownumber = rownumber;
		this.eventPlace = eventPlace;
		this.event = event;
		this.writeDate = writeDate;
		this.id = id;
		this.approval = approval;
	}





	public String getBoardNum() {
		return boardNum;
	}
	public void setBoardNum(String boardNum) {
		this.boardNum = boardNum;
	}
	public String getEventFrom() {
		return eventFrom;
	}
	public void setEventFrom(String eventFrom) {
		this.eventFrom = eventFrom;
	}
	public String getEventTo() {
		return eventTo;
	}
	public void setEventTo(String eventTo) {
		this.eventTo = eventTo;
	}
	public String getEventPlace() {
		return eventPlace;
	}
	public void setEventPlace(String eventPlace) {
		this.eventPlace = eventPlace;
	}
	public String getEventType() {
		return eventType;
	}
	public void setEventType(String eventType) {
		this.eventType = eventType;
	}
	public String getEvent() {
		return event;
	}
	public void setEvent(String event) {
		this.event = event;
	}
	public String getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(String writeDate) {
		this.writeDate = writeDate;
	}
	public String getEditDate() {
		return editDate;
	}
	public void setEditDate(String editDate) {
		this.editDate = editDate;
	}
	public String getEventDesc() {
		return eventDesc;
	}
	public void setEventDesc(String eventDesc) {
		this.eventDesc = eventDesc;
	}
	public String getAdminMSG() {
		return adminMSG;
	}
	public void setAdminMSG(String adminMSG) {
		this.adminMSG = adminMSG;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getViewcount() {
		return viewcount;
	}
	public void setViewcount(String viewcount) {
		this.viewcount = viewcount;
	}
	public String getApproval() {
		return approval;
	}
	public void setApproval(String approval) {
		this.approval = approval;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getRownumber() {
		return rownumber;
	}
	public void setRownumber(String rownum) {
		this.rownumber = rownum;
	}
	
}
