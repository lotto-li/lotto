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
* @author Hydra
* @version 创建时间:2017年4月9日 上午1:01:31 
* @Description 
*/
@Data
@Entity
@ToString
@Table(name="sys_user")
public class SysUser implements Serializable {
    private static final long serialVersionUID = 1L;
    
    @Id
    @GeneratedValue
    private Long id;
    
    @Column(name="username")
    private String username;
    
    @Column(name="password")
    private String password;
}
