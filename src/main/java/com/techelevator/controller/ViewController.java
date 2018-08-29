package com.techelevator.controller;

import java.util.LinkedList;
import java.util.List;

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
	public String displayHotspotsBurghPage() {
		return "hotSpotsInTheBurgh";
	}
	
	
	
	
	@RequestMapping (path="/users/{currentUser}/profile", method=RequestMethod.GET)

	public String displayProfilePage(HttpServletRequest request) {
		HttpSession session = request.getSession();
		
		 int id = (int) session.getAttribute("id");
		//String currentUser = (String) session.getAttribute("currentUser");
		
		
		List<Itinerary> Itineraries = ItinDAO.getItinerarysByUser(id);
		
		 session.setAttribute("userItin", Itineraries);
		
		 System.out.println("size" + Itineraries.size());
		 
		 System.out.println("I-id" +Itineraries.get(0).getItinerary_id());
		 System.out.println("user id"+Itineraries.get(0).getUser_id());
		
		 System.out.println("gID" +Itineraries.get(0).getGoogle_id_one());
		 System.out.println(Itineraries.get(0).getGoogle_id_two());
		 System.out.println(Itineraries.get(0).getGoogle_id_three());
		 System.out.println(Itineraries.get(0).getGoogle_id_four());
		 System.out.println(Itineraries.get(0).getGoogle_id_five());
		
		 System.out.println("I ID"+Itineraries.get(0).getName_one());
		 System.out.println(Itineraries.get(0).getName_two());
		 System.out.println(Itineraries.get(0).getName_three());
		 System.out.println(Itineraries.get(0).getName_four());
		 System.out.println(Itineraries.get(0).getName_five());
	
		 
	
	

		
		return "profile";
	}
	
	
	
}