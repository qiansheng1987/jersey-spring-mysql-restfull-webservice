package com.erkobridee.restful.bookmarks.jerseyspring.persistence.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlRootElement;

/**
 * TabSysright entity. @author MyEclipse Persistence Tools
 */

@XmlRootElement
@Entity
@Table(name = "tab_sysright")
public class TabSysright implements java.io.Serializable {

	/** 
	* @Fields serialVersionUID : TODO
	*/ 
	
	private static final long serialVersionUID = -4692783394125619390L;

	// Fields
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column
	private Integer id;
	
	@Column(nullable = false, length = 100)
	private String name;
	
	private Integer state;
	
	@Column(length = 250)
	private String memo;

	// Constructors

	/** default constructor */
	public TabSysright() {
	}

	/** minimal constructor */
	public TabSysright(String name) {
		this.name = name;
	}

	/** full constructor */
	public TabSysright(String name, Integer state, String memo) {
		this.name = name;
		this.state = state;
		this.memo = memo;
	}

	@XmlAttribute(name = "id")
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@XmlAttribute(name = "name")
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@XmlAttribute(name = "state")
	public Integer getState() {
		return this.state;
	}

	public void setState(Integer state) {
		this.state = state;
	}

	@XmlAttribute(name = "memo")
	public String getMemo() {
		return this.memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

}