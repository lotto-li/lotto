package com.lotto.services;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Service;

import com.lotto.domain.Notice;

/** 
* @author Hydra
* @version 创建时间:2017年4月9日 上午10:22:30 
* @Description 
*/
@Service
public interface NoticeService extends JpaRepository<Notice, Long> {

    @Query("select n from Notice n where title like %:title%")
    List<Notice> findByTitleLike(@Param("title") String title);
    
}
