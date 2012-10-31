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
public class TaskService extends HttpServlet {
	
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		String userId = GetUserId();
        
        String applicationKey = req.getParameter("applicationKey");
        String taskTitle = req.getParameter("taskTitle");
        String taskData = req.getParameter("taskData");
        String taskNotes = req.getParameter("taskNotes");
        
        
        
        DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
        
        Key appKey = KeyFactory.stringToKey(applicationKey);        
        
        Entity applicationEntity = new Entity(appKey);
        
        try {
        	applicationEntity = datastore.get(appKey);
			
			resp.setContentType("application/json");
			
			Gson gson = new Gson();
			String json = gson.toJson(applicationEntity);
			resp.getWriter().println(json);
			
		} catch (EntityNotFoundException e) {			
			e.printStackTrace();
		}
        
        // Create an entity to store event properties.
        
        
		
		// Notify the client of success.
	
	}
        
    private String GetUserId() {
    	UserService userService = UserServiceFactory.getUserService();
        User user = userService.getCurrentUser();
        return user.getUserId();    
    }
	
	public void doGet(HttpServletRequest req, HttpServletResponse resp) {
		
	}

}
