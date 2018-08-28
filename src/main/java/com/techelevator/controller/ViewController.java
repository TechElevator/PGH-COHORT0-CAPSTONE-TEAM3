package com.techelevator.controller;

import java.util.LinkedList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.techelevator.model.Itinerary;
import com.techelevator.model.ItineraryDAO;
import com.techelevator.model.UserDAO;

@Controller
public class ViewController {
	
	
	@Autowired
	private ItineraryDAO itineraryDao;
	
	@RequestMapping (path="/", method=RequestMethod.GET)
	public String displayHomepage() {
		return "homepage";
	}
	
	
	@RequestMapping (path="/hotspotsBurgh", method=RequestMethod.GET)
	public String displayHotspotsBurghPage() {
		return "hotSpotsInTheBurgh";
	}
	
	
	@RequestMapping (path="/users/{currentUser}/profile", method=RequestMethod.GET)
	public String displayProfilePage(HttpServletRequest request, @RequestParam String user_name) {
		HttpSession session = request.getSession();
		
		String userName = request.getParameter("user_name");
		
		List<Itinerary> itinerary = itineraryDao.getItinerarysByUser(userName);
		
		request.setAttribute("itinerary", itinerary);
		
		return "profile";
	}
	
	
	
}