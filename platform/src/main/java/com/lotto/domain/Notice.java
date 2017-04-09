package com.lotto.domain;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;
import lombok.ToString;

/** 
* @author Hydra
* @version 创建时间:2017年4月9日 上午10:19:52 
* @Description 
*/
@Data
@Entity
@ToString
@Table(name="t_notice")
public class Notice {

    @Id
    @GeneratedValue
    private Long id;
    
    @Column(name="title")
    private String title;

    @Column(name="name")
    private String name;

    @Column(name="date")
    private Date date;

    @Column(name="content")
    private String content;
    
}
