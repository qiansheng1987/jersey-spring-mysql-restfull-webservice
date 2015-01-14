package com.erkobridee.restful.bookmarks.jerseyspring.persistence.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
@Entity
@Table(name = "simple_book")
public class Bookmark implements Serializable {

	// --------------------------------------------------------------------------
	private static final long serialVersionUID = -1058743390684974211L;
	// --------------------------------------------------------------------------

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column
	private Long id;

	@Column(nullable = false, length = 250)
	private String name;

	@Column
	private String description;

	@Column(nullable = false, length = 250)
	private String url;

	// --------------------------------------------------------------------------

	@XmlAttribute(name = "id")
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	@XmlAttribute(name = "name")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@XmlAttribute(name = "description")
	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getUrl() {
		return url;
	}

	@XmlAttribute(name = "url")
	public void setUrl(String url) {
		this.url = url;
	}

	// --------------------------------------------------------------------------

}
