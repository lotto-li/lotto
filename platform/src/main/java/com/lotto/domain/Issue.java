package com.lotto.domain;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
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
@Table(name="t_issue")
public class Issue {

	@Id
    @GeneratedValue
    private Long id;
    
    @Column(name="title")
    private String title;

    @Column(name="content")
    private String content;
    
    @Column(name="name")
    private String name;

    @Column(name="date")
    private Date date;

    @OneToMany(cascade=CascadeType.ALL,fetch=FetchType.LAZY,mappedBy="issue")
    private List<IssueRecord> issueRecord = new ArrayList<IssueRecord>();

}
