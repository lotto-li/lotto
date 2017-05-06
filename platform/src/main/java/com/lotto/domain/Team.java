package com.lotto.domain;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import lombok.Data;
import lombok.ToString;

/** 
* @author lotto
* @version 创建时间:2017年4月9日 上午10:19:52 
* @Description 
*/
@Data
@Entity
@ToString
@Table(name="t_team")
public class Team {

	@Id
    @GeneratedValue
    private Long id;
    
    @Column(name="teamName")
    private String teamName;
    
    @Column(name="createName")
    private String createName;
    
    private String isAdd;
    
//    @ManyToMany(cascade = CascadeType.DETACH, fetch = FetchType.LAZY)
//    @JoinColumn()
//    List<SysUser> teamers;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getTeamName() {
		return teamName;
	}

	public void setTeamName(String teamName) {
		this.teamName = teamName;
	}

	public String getCreateName() {
		return createName;
	}

	public void setCreateName(String createName) {
		this.createName = createName;
	}

	public String getIsAdd() {
		return isAdd;
	}

	public void setIsAdd(String isAdd) {
		this.isAdd = isAdd;
	}
    
	
    
}
