package com.uni.spring.meetingRoom.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.uni.spring.common.PageInfo;
import com.uni.spring.meetingRoom.model.dao.MeetingRoomDao;
import com.uni.spring.meetingRoom.model.dto.MeetingRoom;
import com.uni.spring.meetingRoom.model.dto.ReserveRoom;

@Service
public class MeetingRoomServiceImple implements MeetingRoomService {

	@Autowired
	private SqlSessionTemplate sqlsession;

	@Autowired
	private MeetingRoomDao meetingRoomDao;

	// 회의실 관리 권한이 부여된 유저 확인
	@Override
	public int selectRoomSetUser(String roomsetUserId) {

		int result = meetingRoomDao.selectRoomSetUser(sqlsession, roomsetUserId);
		return result;
	}

	@Override
	public int insertMeetingRoom(MeetingRoom m) {

		int result = meetingRoomDao.insertMeetingRoom(sqlsession, m);
		return result;
	}

	@Override
	public int selectRoomListCount(int userCNo) {
		
		return meetingRoomDao.selectRoomListCount(sqlsession, userCNo);
	}

	@Override
	public ArrayList<MeetingRoom> selectRoomList(PageInfo pi, int userCNo) {
		
		return meetingRoomDao.selectRoomList(sqlsession, pi, userCNo);
	}

	// 회의실 예약화면 -> 하단 회의실 현황
	@Override
	public ArrayList<MeetingRoom> selectList(int userCNo) {
		
		return meetingRoomDao.selectList(sqlsession, userCNo);
	}

	@Override
	public int roomNoCheck(String roomNo) {
		
		return meetingRoomDao.roomNoCheck(sqlsession, roomNo);
	}

	@Override
	public int deleteRooms(String roomNo) {
		
		return meetingRoomDao.deleteRooms(sqlsession, roomNo);
	}

	@Override
	public String selectRoomNo(String selectRoom) {
		
		return meetingRoomDao.selectRoomNo(sqlsession, selectRoom);
	}

	//회의실 예약
	@Override
	public int reserveRoom(ReserveRoom room) {
		
		return meetingRoomDao.reserveRoom(sqlsession, room);
	}

	@Override
	public double selectStartKey(String startTime) {
		
		return meetingRoomDao.selectStartKey(sqlsession, startTime);
	}

	@Override
	public double selectEndKey(String endTime) {
		
		return meetingRoomDao.selectEndKey(sqlsession, endTime);
	}

	@Override
	public ArrayList<ReserveRoom> selectReservedRooms(int cNo, String date){
		
		return meetingRoomDao.selectReservedRooms(sqlsession, cNo, date);
	}

	@Override
	public ArrayList<ReserveRoom> checkReservedRooms(String roomNo, String date) {
		
		return meetingRoomDao.checkReservedRooms(sqlsession, roomNo, date);
	}

	@Override
	public ReserveRoom selectRoom(ReserveRoom roomInfo) {	
		
		return meetingRoomDao.selectRoom(sqlsession, roomInfo);
	}

	@Override
	public String selectMName(String mNo) {
		
		return meetingRoomDao.selectMName(sqlsession, mNo);
	}

	@Override
	public String selectMJobName(String mNo) {
		
		return meetingRoomDao.selectMJobName(sqlsession, mNo);
	}

	@Override
	public String selectRoomName(String roomNo) {
		
		return meetingRoomDao.selectRoomName(sqlsession, roomNo);
	}

	@Override
	public int deleteReservation(String reservationNo) {
		
		return meetingRoomDao.deleteReservation(sqlsession, reservationNo);
	}

	@Override
	public String selectReserveDate(String reservationNo) {
		
		return meetingRoomDao.selectReserveDate(sqlsession, reservationNo);
	}

	@Override
	public int updateReservation(ReserveRoom updateRoom) {
		
		return meetingRoomDao.updateReservation(sqlsession, updateRoom);
	}

  	@Override
	public ReserveRoom selectreservedRoom(ReserveRoom r) {
		
		return meetingRoomDao.selectreservedRoom(sqlsession, r);

	}

  	//회의실 정보 수정용 정보조회
	@Override
	public MeetingRoom selectRoomInfo(String roomNo) {
		
		return meetingRoomDao.selectRoomInfo(sqlsession, roomNo);
	}

	//회의실 정보 수정
	@Override
	public int modifyRoom(MeetingRoom r) {
		
		return meetingRoomDao.modifyRoom(sqlsession, r);
	}




}
