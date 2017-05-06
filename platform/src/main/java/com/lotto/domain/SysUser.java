package com.lotto.domain;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;
import lombok.ToString;

/** 
* @author lotto
* @version 创建时间:2017年4月9日 上午1:01:31 
* @Description 
*/
@Data
@Entity
@ToString
@Table(name="sys_user")
public class SysUser implements Serializable {
    public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	private static final long serialVersionUID = 1L;
    
    @Id
    @GeneratedValue
    private Long id;
    
    @Column(name="username")
    private String username;
    
    @Column(name="password")
    private String password;
}
