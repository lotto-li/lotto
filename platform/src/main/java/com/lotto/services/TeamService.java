package com.lotto.services;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Service;

import com.lotto.domain.Team;

/** 
* @author Hydra
* @version 创建时间:2017年4月9日 上午10:22:30 
* @Description 
*/
@Service
public interface TeamService extends JpaRepository<Team, Long> {

    @Query("select n from Team n where teamName like %:teamName%")
    List<Team> findByTeamNameLike(@Param("teamName") String teamName);
    
}
