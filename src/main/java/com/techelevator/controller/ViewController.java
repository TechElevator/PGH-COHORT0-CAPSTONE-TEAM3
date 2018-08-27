package com.techelevator.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.techelevator.model.UserDAO;

@Controller
public class ViewController {
	
	
	@RequestMapping (path="/", method=RequestMethod.GET)
	public String displayHomepage() {
		return "homepage";
	}
	
	
	@RequestMapping (path="/hotspotsBurgh", method=RequestMethod.GET)
	public String displayHotspotsBurghPage() {
		return "hotSpotsInTheBurgh";
	}
	
	
}