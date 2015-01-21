package com.erkobridee.restful.bookmarks.jerseyspring.persistence.factory;

public class ClassToolKit {
	
	/**
	 * 
	* @Title: loadClass 
	* @Description: ◊∞‘ÿ¿‡
	* @param @param className
	* @param @return
	* @param @throws ClassNotFoundException     
	* @return Class<?>     
	* @throws
	 */
	public static Class<?> loadClass(String className) throws ClassNotFoundException {
		
		Class<?> cls = null;
		
		try {
			cls = Thread.currentThread().getContextClassLoader().loadClass(className);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if (cls == null) {
			cls = Class.forName(className);
		}
		return cls;
	}
}
