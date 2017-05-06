package com.lotto.domain;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import lombok.Data;
import lombok.ToString;
import net.minidev.json.annotate.JsonIgnore;

/** 
* @author lotto
* @version 创建时间:2017年4月9日 上午10:19:52 
* @Description 
*/
@Data
@Entity
@ToString
@Table(name="t_issue_record")
public class IssueRecord {

	@Id
    @GeneratedValue
    private Long id;

    @Column(name="content")
    private String content;
    
    @Column(name="name")
    private String name;

    @Column(name="date")
    private Date date;
    
    @ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="issue_id", insertable=false, updatable=false)
    @JsonIgnore
    private Issue issue;
    
    @Column(name="issue_id")
    private Long issueId;

    
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
     
}
