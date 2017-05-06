package com.lotto.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import lombok.Data;
import lombok.ToString;

/** 
* @author lotto
* @version 创建时间:2017年4月9日 上午10:19:52 
* @Description 
*/
//@Data
//@Entity
//@ToString
//@Table(name="t_team_teamers")
public class TeamTeamers {
//	@Column(name="teamId")
    private String teamId;
//    @Column(name="teamersId")
    private String teamersId;

	public String getTeamId() {
		return teamId;
	}

	public void setTeamId(String teamId) {
		this.teamId = teamId;
	}

	public String getTeamersId() {
		return teamersId;
	}

	public void setTeamersId(String teamersId) {
		this.teamersId = teamersId;
	}
    
	
}
