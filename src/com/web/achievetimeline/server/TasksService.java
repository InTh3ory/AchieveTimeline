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
import com.google.appengine.api.datastore.Query.Filter;
import com.google.appengine.api.datastore.Query.FilterPredicate;
import com.google.appengine.api.datastore.Query.FilterOperator;
import com.google.appengine.api.datastore.Query.SortDirection;

import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;
import com.google.gson.Gson;

@SuppressWarnings("serial")
public class TasksService extends HttpServlet {

	public void doPost(HttpServletRequest req, HttpServletResponse resp)
	{
		String userId = GetUserId();
		
		String applicationKey = req.getParameter("applicationKey");
        String taskTitle = req.getParameter("taskTitle");
        String taskData = req.getParameter("taskDate");
        String taskNotes = req.getParameter("taskNotes");
        String taskStatus = req.getParameter("taskStatus");
        String key = req.getParameter("key");
        String taskStatus = req.getParameter("taskStatus");
        
		DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
		Entity task;
		
		if(null != key)
		{
			// Modifying existing task.
			task = new Entity(KeyFactory.stringToKey(key));
		}
		else
		{
			// Creating a new task.
			task = new Entity("Task", KeyFactory.stringToKey(applicationKey));
		}
		
		task.setProperty("taskTitle", taskTitle);
		task.setProperty("taskDate", taskData);
		task.setProperty("taskNotes", taskNotes);
		task.setProperty("taskStatus", taskStatus);
		task.setProperty("userId", userId);
		task.setProperty("taskStatus", taskStatus);
		
		// Put the entity in the data store.
		datastore.put(task);
		
		// This line adds a new column 'key' to the returned entity, not the persisted one.
		task.setProperty("key", KeyFactory.keyToString(task.getKey()));
		task.setProperty("applicationKey", applicationKey);
		
		System.out.println("TasksService::doPost - Created task: " + KeyFactory.keyToString(task.getKey()));
		
		// Notify the client of success.
		resp.setContentType("application/json");

		Gson gson = new Gson();
		String json = gson.toJson(task);
		try {
			resp.getWriter().println(json);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
	{
		String userId = GetUserId();
		String applicationKey = req.getParameter("applicationKey");
		
		DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
		
		// Find all tasks that belong to an application.
		Query q = new Query("Task").setAncestor(KeyFactory.stringToKey(applicationKey));
		PreparedQuery pq = datastore.prepare(q);
		
		//System.out.println("Number of tasks: " + pq.countEntities());
		List<Entity> applications = new ArrayList<Entity>();

		for (Entity result : pq.asIterable()) {
			System.out.println("Task name=" + result.getProperty("name"));
			result.setProperty("key", KeyFactory.keyToString(result.getKey()));
			applications.add(result);
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
	
	public void doDelete(HttpServletRequest req, HttpServletResponse resp)
	{
		String userId = GetUserId();
        
        String applicationKey = req.getParameter("applicationKey");
        String keyStr = req.getParameter("key");
        
        System.out.print("ApplicationsService::doDelete(");
        System.out.print("applicationKey=" + applicationKey + ", key=" + keyStr + ")");
        
        DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
        
        // Grab all tasks belonging to an application from the datastore.
        Query q = new Query("Task").setAncestor(KeyFactory.stringToKey(applicationKey));
		Filter f = new FilterPredicate("userId", FilterOperator.EQUAL, userId);
        q.setFilter(f);
		
		PreparedQuery pq = datastore.prepare(q);
        
		System.out.println("User has " + pq.countEntities() + " tasks belonging to application " + applicationKey);
		
		Entity task = null;
		
		if(null != keyStr)
        {
			Key key = KeyFactory.stringToKey(keyStr);
			for (Entity result : pq.asIterable()) {
				if(key == result.getKey())
				{
					System.out.println("Deleting task " + keyStr);
					task = result;
					task.setProperty("key", KeyFactory.keyToString(key));
					datastore.delete(key);
				}
			}
        }
		
		Gson gson = new Gson();
		String applicationsJson = gson.toJson(task);
		
		try {
			resp.setContentType("application/json");
			resp.getWriter().println(applicationsJson);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	private String GetUserId() {
    	UserService userService = UserServiceFactory.getUserService();
        User user = userService.getCurrentUser();
        return user.getUserId();    
    }
}
