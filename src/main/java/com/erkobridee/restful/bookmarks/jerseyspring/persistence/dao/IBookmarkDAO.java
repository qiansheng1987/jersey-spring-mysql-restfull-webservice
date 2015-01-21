package com.erkobridee.restful.bookmarks.jerseyspring.persistence.dao;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.erkobridee.restful.bookmarks.jerseyspring.persistence.entity.Bookmark;
import com.erkobridee.restful.bookmarks.jerseyspring.persistence.entity.ResultData;
import com.erkobridee.restful.bookmarks.jerseyspring.persistence.entity.TabSysright;

@Transactional
public interface IBookmarkDAO {

	Integer count();
	
	ResultData<List<Bookmark>> list();
	
	List<TabSysright> listSysRight(int page, int size);
	
	ResultData<List<Bookmark>> list(int page, int size);

	Bookmark findById(Long id);

	ResultData<List<Bookmark>> findByName(String name);
	
	ResultData<List<Bookmark>> findByName(String name, int page, int size);

	Bookmark save(Bookmark value);

	boolean remove(Long id);

}
