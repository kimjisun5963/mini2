package com.example.onepickApi.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.example.onepickApi.entity.ApplyList;
import com.example.onepickApi.entity.User;

public interface ApplyListRepository extends JpaRepository<ApplyList, Long> {

	@Query(value="select * from apply_list where jno=:jno", nativeQuery=true)
	public List<ApplyList> findByJno(@Param("jno") Long jno);
	
	//평점 남길 수 있는 지원자 리스트 뽑기
	@Query(value="select * from apply_list where jno=:jno and status='면접완료' and rating_status1='false'", nativeQuery=true)
	public List<ApplyList> findIntervieweesByJno(@Param("jno") Long jno);
	
	@Query(value="select * from apply_list where uid=:uid and jno=:jno", nativeQuery=true)
	public ApplyList findInterviewee(@Param("uid") String uid, @Param("jno") Long jno);
	
	@Query(value="select * from apply_list where jno=:jno and rno=:rno", nativeQuery=true)
	public ApplyList findApplyByJnoAndRno(@Param("jno") Long jno, @Param("rno") Long rno);

	List<ApplyList> findByUser(User user);
	
	
	@Query(value="select * from apply_list where uid=:uid and jno=:jno", nativeQuery=true)
	public ApplyList findApply(@Param("uid") String uid, @Param("jno") Long jno);
	
	
	

}
