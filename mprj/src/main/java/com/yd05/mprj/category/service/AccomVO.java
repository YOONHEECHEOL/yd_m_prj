package com.yd05.mprj.category.service;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class AccomVO {
	int accmId; // 숙박시설의 번호 or 오늘의 추천 숙박을 뽑아줄 기준(sequence)
	String accomcountlodging; // 수용가능인원
	String checkintime; // 입실시간
	String checkouttime; // 퇴실시간
	String parkinglodging; // 주차시설
	String reservationurl; //예약안내 홈페이지 URL
	
	String addr1; // 주소
	String addr2; // 상세주소
	String tel; // 전화번호
	String title; // 상호명
	String mapx; // x좌표
	String mapy; // y좌표
	String firstimage; // firstimage 대표이미지(원본)500*333
	String firstimage2; // firstimage2 대표이미지(썸네일)150*100
	
}
