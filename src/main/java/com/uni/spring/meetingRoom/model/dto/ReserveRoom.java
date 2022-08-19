package com.uni.spring.meetingRoom.model.dto;

public class ReserveRoom {

	private String reserveNo;
	private String roomNo;
	private String reserveDate;
	private String startTime;
	private String endTime;
	private String reserveTitle;
	private String mNo;
	private int cNo;

	public ReserveRoom() {
		
	}

	public String getReserveNo() {
		return reserveNo;
	}

	public void setReserveNo(String reserveNo) {
		this.reserveNo = reserveNo;
	}

	public String getRoomNo() {
		return roomNo;
	}

	public void setRoomNo(String roomNo) {
		this.roomNo = roomNo;
	}

	public String getReserveDate() {
		return reserveDate;
	}

	public void setReserveDate(String reserveDate) {
		this.reserveDate = reserveDate;
	}

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	public String getReserveTitle() {
		return reserveTitle;
	}

	public void setReserveTitle(String reserveTitle) {
		this.reserveTitle = reserveTitle;
	}

	public String getmNo() {
		return mNo;
	}

	public void setmNo(String mNo) {
		this.mNo = mNo;
	}

	public int getcNo() {
		return cNo;
	}

	public void setcNo(int cNo) {
		this.cNo = cNo;
	}

	@Override
	public String toString() {
		return "ReserveRoom [reserveNo=" + reserveNo + ", roomNo=" + roomNo + ", reserveDate=" + reserveDate
				+ ", startTime=" + startTime + ", endTime=" + endTime + ", reserveTitle=" + reserveTitle + ", mNo="
				+ mNo + ", cNo=" + cNo + "]";
	}
	
	

}
