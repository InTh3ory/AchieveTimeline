package com.web.achievetimeline.server;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
public class ApplicationsService extends HttpServlet {
	
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
				
        String userId = GetUserId();
        
        String institutionName = req.getParameter("institutionName");
        String programName = req.getParameter("programName");
        String colorCode = req.getParameter("colorCode");
        
        
        
        DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
        
        // Create an entity to store event properties.
        Entity entity = new Entity("Application");
        
        entity.setProperty("institutionName", institutionName);
        entity.setProperty("programName", programName);
        entity.setProperty("colorCode", colorCode);
        entity.setProperty("userId", userId);
        
		// Put the entity in the data store.
		datastore.put(entity);
		
		entity.setProperty("key", KeyFactory.keyToString(entity.getKey()));
		
		// Notify the client of success.
		resp.setContentType("application/json");
		
		Gson gson = new Gson();
		String json = gson.toJson(entity);
		resp.getWriter().println(json);
		
	}
        
    private String GetUserId() {
    	UserService userService = UserServiceFactory.getUserService();
        User user = userService.getCurrentUser();
        return user.getUserId();    
    }
	
	public void doGet(HttpServletRequest req, HttpServletResponse resp) {
		DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
				
        String userId = GetUserId();
        
		Query q = new Query("Application");
		
		PreparedQuery pq = datastore.prepare(q);
		
		List<Entity> applications = new ArrayList<Entity>();
		
		for (Entity result : pq.asIterable()) {
			String entry = (String) result.getProperty("userId");
						
			if(userId.equals(entry))
			{
				result.setProperty("key", KeyFactory.keyToString(result.getKey()));
				applications.add(result);
			}			
		}
						
		Gson gson = new Gson();
		String applicationsJson = gson.toJson(applications);
		
		try {
			resp.setContentType("application/json");
			resp.getWriter().println(applicationsJson);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
