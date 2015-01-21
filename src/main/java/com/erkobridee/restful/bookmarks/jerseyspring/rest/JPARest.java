package com.erkobridee.restful.bookmarks.jerseyspring.rest;

import java.net.URI;
import java.util.List;

import javax.ws.rs.DefaultValue;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import javax.ws.rs.core.UriBuilder;
import javax.ws.rs.core.UriInfo;
import javax.ws.rs.core.Response.Status;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.erkobridee.restful.bookmarks.jerseyspring.persistence.dao.IBookmarkDAO;
import com.erkobridee.restful.bookmarks.jerseyspring.persistence.entity.ResultData;
import com.erkobridee.restful.bookmarks.jerseyspring.persistence.entity.TabSysright;

@Component
@Scope("prototype")
@Path("/jpa")
public class JPARest {
	
	private Logger log = LoggerFactory.getLogger( JPARest.class );
	
	@Autowired
	private IBookmarkDAO dao;
	
	@Context UriInfo uriInfo;
	
	// --------------------------------------------------------------------------
	
	private URI getLocation() {
		return getLocation( "" );
	}
	
	private URI getLocation( Long id ) {		
		return getLocation( "" + id );
	}
	
	private URI getLocation( String add ) {
		URI uri = null;
		
		if( uriInfo != null ) {
			UriBuilder ub = uriInfo.getAbsolutePathBuilder();
			uri = ub.path( add ).build();
		}
		
		return uri;
	}
		
		// --------------------------------------------------------------------------
	

	@GET
	@Produces({ MediaType.APPLICATION_JSON })
	public List<TabSysright> getList(
		@DefaultValue("1") @QueryParam("page") int page,
		@DefaultValue("10") @QueryParam("size") int size
	) {
		log.debug( "getList [ page: " + page + " | size: " + size + " ]" );
		
		//ResultData<List<TabSysright>> rd = dao.listSysRight(page, size);
		List<TabSysright> list = dao.listSysRight(page, size);
		for (int i = 0; i < list.size(); i++) {
			System.out.println(list.get(i).getMemo());
		}
		return list;
	}
}
