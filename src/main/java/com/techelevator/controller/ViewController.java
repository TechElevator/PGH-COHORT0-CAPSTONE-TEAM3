package com.techelevator.controller;

import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.techelevator.model.Itinerary;
import com.techelevator.model.ItineraryDAO;

import com.techelevator.model.User;

import com.techelevator.model.UserDAO;

@Controller
public class ViewController {
	
	@Autowired
	ItineraryDAO ItinDAO;
	
	@Autowired
	UserDAO userDao;
	
	@Autowired
	private ItineraryDAO itineraryDao;
	
	@RequestMapping (path="/", method=RequestMethod.GET)
	public String displayHomepage() {
		return "homepage";
	}
	
	
	@RequestMapping (path="/hotspotsBurgh", method=RequestMethod.GET)
	public String displayHotspotsBurghPage(HttpServletRequest request) {
		HttpSession session = request.getSession();
		int id = (int) session.getAttribute("id");
		
		
		return "hotSpotsInTheBurgh";
	}
	
	@RequestMapping (path="/hotspotsBurgh", method=RequestMethod.POST)
	public String SaveAnIntinerary(@RequestParam String[] UsersItinerary) {

		
		Itinerary UserNewItinerary = new Itinerary();
		//		HttpSession session = request.getSession();
		for(String POI : UsersItinerary) {
			
			System.out.println(POI);
		}
//		int id = (int) session.getAttribute("id");
		
		
		return "hotSpotsInTheBurgh";
	}
	
	
	
	
	@RequestMapping (path="/users/{currentUser.userName}/profile", method=RequestMethod.GET)

	public String displayProfilePage(HttpServletRequest request) {
		HttpSession session = request.getSession();
		
		int id = (int) session.getAttribute("id");
		session.getAttribute("currentUser");
		
		
		
		List<Itinerary> Itineraries = ItinDAO.getItinerarysByUser(id);
		
		 session.setAttribute("userItin", Itineraries);

		 System.out.println(session.getAttribute("currentUser.userName"));
		

		return "profile";
	}
	
	
	
}