package com.lotto.services;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Service;

import com.lotto.domain.Issue;
import com.lotto.domain.IssueRecord;

/** 
* @author lotto
* @version 创建时间:2017年4月9日 上午10:22:30 
* @Description 
*/
@Service
public interface IssueRecordService extends JpaRepository<IssueRecord, Long> {

	@Query("select n from IssueRecord n where issueId like %:issueId%")
	List<IssueRecord> findByIssueIdLike(@Param("issueId") Long issueId);
    
}
