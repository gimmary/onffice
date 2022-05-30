package com.uni.spring.notice.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.uni.spring.notice.model.notice;
import com.uni.spring.common.exception.CommException;
import com.uni.spring.notice.model.noticeDao;

@Service
public class noticeServiceImpl implements noticeService {
	
	@Autowired
	private SqlSessionTemplate sqlsession;
	
	@Autowired
	private noticeDao noticedao;
	
	@Override
	public int selectListCount() {
		// TODO Auto-generated method stub
		return noticedao.selectListCount(sqlsession);
	}
	
	@Override
	public ArrayList<notice> selectList() {
		return noticedao.selectList(sqlsession);
	}

	@Override
	public notice selectNotice(int no_Num) {
		return noticedao.selectNotice(sqlsession, no_Num);
	}

	@Override
	public void insertNotice(notice n) {
		int result = noticedao.insertNotice(sqlsession, n);
		
		if(result < 0) {
			throw new CommException("게시글 추가 실패");
		}
	}

	@Override
	public void deleteNotice(int No_Num) {
		int result = noticedao.deleteNotice(sqlsession, No_Num);
		
		if(result < 0) {
			throw new CommException("게시글 삭제 실패");
		}
	}

	@Override
	public void updateNotice(notice n) {
		int result = noticedao.updateNotice(sqlsession, n);
		
		if(result < 0) {
			throw new CommException("게시글 수정 실패");
		}
	}

}
