package com.yd05.mprj.myCourse.service;

import java.util.List;

public interface MyCourseService {
	// selectAllCourse
	List<MyCourseVO> selectAllCourse(MyCourseVO vo);
	// selectCourse
	MyCourseVO selectCourse(MyCourseVO vo);
	// updateCourse
	void updateCourse(MyCourseVO vo);
	// delteCourse
	void deleteCourse(MyCourseVO vo);
	// insertCourse
	void insertCourse(MyCourseVO vo);
}
