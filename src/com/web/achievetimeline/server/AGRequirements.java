package com.web.achievetimeline.server;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.EntityNotFoundException;
import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;
import com.google.appengine.api.datastore.PreparedQuery;
import com.google.appengine.api.datastore.Query;

import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;
import com.google.gson.Gson;

@SuppressWarnings("serial")
public class AGRequirements extends HttpServlet {
	
	public void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {

		UserService userService = UserServiceFactory.getUserService();
        User user = userService.getCurrentUser();
        String userId = user.getUserId();
        
        DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
        Entity entity = new Entity("AGRequirements", userId);
        Enumeration enumeration = req.getParameterNames();
        
        for( ; enumeration.hasMoreElements(); )
        {
        	String param = (String)enumeration.nextElement();
        	System.out.print(param);
        	System.out.println(" " + req.getParameter(param));
        	entity.setProperty(param, req.getParameter(param));
        }
        
        // Put the entity in the data store.
        datastore.put(entity);
        
        // Notify the client of success.
        resp.setContentType("application/json");
        Gson gson = new Gson();
        String json = gson.toJson(entity);
        resp.getWriter().println(json);
	}

	public void doGet(HttpServletRequest req, HttpServletResponse resp) {

		DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();

		UserService userService = UserServiceFactory.getUserService();
		User user = userService.getCurrentUser();
		String userId = user.getUserId();

		try {
			Entity entity = datastore.get(KeyFactory.createKey("AGRequirements", userId));
			
			Gson gson = new Gson();
			String json = gson.toJson(entity);
			
			resp.setContentType("application/json");
			resp.getWriter().println(json);
			
		} catch (EntityNotFoundException e) {
			// Don't do anything if there are no entries in the datastore.
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
