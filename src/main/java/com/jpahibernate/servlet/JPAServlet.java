package com.jpahibernate.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.codehaus.jettison.json.JSONObject;
import org.hibernate.Query;
import org.springframework.beans.factory.annotation.Autowired;

import com.erkobridee.restful.bookmarks.jerseyspring.persistence.dao.IBookmarkDAO;
import com.erkobridee.restful.bookmarks.jerseyspring.persistence.entity.TabSysright;

public class JPAServlet extends HttpServlet {

	/** 
	* @Fields serialVersionUID : TODO
	*/ 
	
	private static final long serialVersionUID = -2393196713624283824L;

	/**
	 * Constructor of the object.
	 */
	public JPAServlet() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		HttpSession httpsession = request.getSession();
		String action = request.getParameter("action");
		/*if (action.equals("jpa")) {
			List<TabSysright> list = dao.findSysRight();
			for (int i = 0; i < list.size(); i++) {
				System.out.println(list.get(i).getMemo() + "---" + list.get(i).getName());
			}
		}*/
		out.flush();
		out.close();
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
