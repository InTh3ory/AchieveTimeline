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
