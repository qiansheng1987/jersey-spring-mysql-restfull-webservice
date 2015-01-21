package com.erkobridee.restful.bookmarks.jerseyspring.persistence.factory;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.Properties;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.igfay.jfig.JFig;
import org.igfay.jfig.JFigIF;
import org.igfay.jfig.JFigLocator;

public class DAOConfig {
	
	private static Logger logger = LogManager.getLogger(DAOConfig.class);
	
	private static final String DAO_CONFIG_FILE = "src/main/resources/dao.xml";
	private static final String DAO_CONFIG_SECTION = "DAO";
	
	public static synchronized HashMap load() {
		
		HashMap map = new HashMap();
		JFigLocator jfigLocator = new JFigLocator(DAO_CONFIG_FILE);
		JFigIF daoConfig = JFig.getInstance(jfigLocator);
		Properties prop = daoConfig.getSectionAsProperties(DAO_CONFIG_SECTION);
		
		Enumeration enumSection = prop.keys();
		while (enumSection.hasMoreElements()) {
			String daoIface = (String) enumSection.nextElement();
			String daoImpl = prop.getProperty(daoIface);
			
			try {
				Class iface = ClassToolKit.loadClass(daoIface);
				Class impl = ClassToolKit.loadClass(daoImpl);
				map.put(iface, impl);
			} catch (ClassNotFoundException e) {
				logger.debug("No Class Found: "+ e.getMessage());
			}
		}
		
		return map;
	}
	
	public static void main(String[] args) {
		HashMap map = DAOConfig.load();
		System.out.println(map);
	}
}
