package com.erkobridee.restful.bookmarks.jerseyspring.persistence.factory;

import java.util.HashMap;

import com.erkobridee.restful.bookmarks.jerseyspring.exception.DAOException;

public class DAOFactory {
	
	private static HashMap daoMap = null;
	
	public static Object getDAO(Class daoInterface) {
		initial();
		Object dao = daoMap.get(daoInterface);
		if (null == dao) {
			new DAOException("dao Îªnull£¡");
		}
		return dao;
	}
	
	public static synchronized void initial() {
		if (daoMap == null) {
			daoMap = null;
		}
	}
	
	
}
















