package com.techelevator.controller;

import java.util.ArrayList;
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
		
		
		
		return "hotSpotsInTheBurgh";
	}
	
	@RequestMapping (path="/hotspotsBurgh", method=RequestMethod.POST)
	public String SaveAnIntinerary(@RequestParam ("result[]") List<String>UsersItinerary, HttpServletRequest request) {
		
		//HttpSession session = request.getSession();
		
		List <String> fromJSP = new ArrayList<>();
		Itinerary UserNewItinerary = new Itinerary();
		//		HttpSession session = request.getSession();
		for(String POI : UsersItinerary) {
			fromJSP.add(POI);
			System.out.println(POI);
			System.out.println(POI);
			System.out.println(POI);
			System.out.println(POI);
			System.out.println(POI);
			System.out.println(POI);
			System.out.println(POI);
		}
		
		UserNewItinerary.setName_one(fromJSP.get(0));
		UserNewItinerary.setGoogle_id_one(fromJSP.get(1));
		UserNewItinerary.setName_two(fromJSP.get(2));
		UserNewItinerary.setGoogle_id_two(fromJSP.get(3));
		UserNewItinerary.setName_three(fromJSP.get(4));
		UserNewItinerary.setGoogle_id_three(fromJSP.get(5));
		UserNewItinerary.setName_four(fromJSP.get(6));
		UserNewItinerary.setGoogle_id_four(fromJSP.get(7));
		UserNewItinerary.setName_five(fromJSP.get(8));
		UserNewItinerary.setGoogle_id_five(fromJSP.get(9));
		
		itineraryDao.addItinerary(UserNewItinerary);
		
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