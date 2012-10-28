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
public class AGRequirements extends HttpServlet {
	
	public void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {

		UserService userService = UserServiceFactory.getUserService();
        User user = userService.getCurrentUser();
        String userId = user.getUserId();
        
        String keyStr = req.getParameter("key");
        String a_unitone = req.getParameter("a_unitone");    // TODO: Use a for loop for iterating through all parameters, Ras
        String a_unittwo = req.getParameter("a_unittwo");
        
        String b_unitone = req.getParameter("b_unitone");
        String b_unittwo = req.getParameter("b_unittwo");
        String b_unitthree = req.getParameter("b_unitthree");
        String b_unitfour = req.getParameter("b_unitfour");


        DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
        Entity entity;
        
        if (keyStr != null) {
        	System.out.println(keyStr);
        	
        	try {
				entity = datastore.get(KeyFactory.stringToKey(keyStr));
			} catch (EntityNotFoundException e) {
				System.out.println("Event not updated, event " + keyStr + " not found: " + e);
				return;
			}
        } else
        {
        	entity = new Entity("AGRequirements");
        	//Key key = entity.getKey();
        	//if(null != key)
        		//System.out.println("Creating new entity: " + KeyFactory.keyToString(key));
        }
        
        //Key key = entity.getKey();
        
        
        entity.setProperty("userId", userId);
        entity.setProperty("a_unitone", a_unitone);
		entity.setProperty("a_unittwo", a_unittwo);
		
		entity.setProperty("b_unitone", b_unitone);
		entity.setProperty("b_unittwo", b_unittwo);
		entity.setProperty("b_unitthree", b_unitthree);
		entity.setProperty("b_unitfour", b_unitfour);
		//entity.setProperty("key", KeyFactory.keyToString(entity.getKey()));
		
		
		// Put the entity in the data store.
        datastore.put(entity);
        //entity.setProperty("key", KeyFactory.keyToString(entity.getKey()));

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
    
    Gson gson = new Gson();
	String json = gson.toJson(userId);
    
    try {
		resp.setContentType("application/json");
		resp.getWriter().println(json);
	} catch (IOException e) {
		e.printStackTrace();
	}
	
	}
}
