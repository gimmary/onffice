package com.uni.spring.car.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.uni.spring.car.model.dao.CarDao;
import com.uni.spring.car.model.dto.Car;
import com.uni.spring.car.model.dto.CarNotice;
import com.uni.spring.car.model.dto.ReserveCar;
import com.uni.spring.common.PageInfo;

@Service
public class CarServiceImple implements CarService {
	
	@Autowired
	private SqlSessionTemplate sqlsession;
	
	@Autowired
	private CarDao carDao;

	@Override
	public int selectCarSetUser(String carSetUserId) {

		int result = carDao.selectCarSetUser(sqlsession, carSetUserId);
		return result;
	}
	
	@Override
	public int selectCarListCount(int userCNo) {
	
		return carDao.selectCarListCount(sqlsession, userCNo);
	}
	
	@Override
	public ArrayList<Car> selectCarList(PageInfo pi, int userCNo) {
	
		return carDao.selectCarList(sqlsession, pi, userCNo);
	}

	@Override
	public int carNoCheck(String carNo) {
	
		return carDao.carNoCheck(sqlsession, carNo);
	}

	@Override
	public int insertCar(Car c) {

		return carDao.insertCar(sqlsession, c);
	}

	@Override
	public int deleteCars(String carNo) {
		
		return carDao.deleteCars(sqlsession, carNo);
	}

	@Override
	public ArrayList<Car> selectList(int userCNo) {
	
		return carDao.selectList(sqlsession, userCNo);
	}

	@Override
	public int reserveingCar(ReserveCar car) {

		return carDao.reserveingCar(sqlsession, car);
	}

	@Override
	public void updateStatus(String reserveCarNo) {
	
		carDao.updateStatus(sqlsession, reserveCarNo);
	}

	@Override
	public ReserveCar selectReserveMNo(String reserveCarNo) {
		
		return carDao.selectReserveMNo(sqlsession, reserveCarNo);
	}

	@Override
	public void updateReturn(String reserveCarNo) {
		
		carDao.updateReturn(sqlsession, reserveCarNo);
	}

	@Override
	public ReserveCar selectReserveCar(String reserveCarNo) {
		
		return carDao.selectReserveCar(sqlsession, reserveCarNo);
	}

	@Override
	public String selectUserName(String userNo) {
	
		return carDao.selectUserName(sqlsession, userNo);
	}

	@Override
	public String selectUserJobName(String userNo) {
	
		return carDao.selectUserJobName(sqlsession, userNo);
	}

	@Override
	public int updateReserveCar(ReserveCar c) {
	
		return carDao.updateReserveCar(sqlsession, c);
	}

	@Override
	public int insertNotice(CarNotice cn) {
	
		return carDao.insertNotice(sqlsession, cn);
	}

	@Override
	public CarNotice selectCarNotice(int cNo) {

		return carDao.selectCarNotice(sqlsession, cNo);
	}

	

}
