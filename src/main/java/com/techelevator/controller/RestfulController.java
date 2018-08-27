package com.techelevator.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.techelevator.model.Place;
import com.techelevator.model.PlaceDAO;

@RestController 
public class RestfulController {

	private List<Place> placeList = new ArrayList<Place>();
	private List<Place> typePlaceList = new ArrayList<Place>();
	
	@Autowired
	private PlaceDAO placeDao;
	
	@RequestMapping(value="API/placeList", method = RequestMethod.GET, produces = "application/json")
	public List<Place> getPlacesInJSON() {
		
		placeList = placeDao.getAllPlaces();
		
		for (Place i: placeList)  {
		//System.out.println(i.getGoogle_id());
		}
		
		return placeList;
	}
	
	@RequestMapping(value="API/typePlaceList/{type}", method = RequestMethod.GET, produces = "application/json")
	public List<Place> getPlacesbyTypeInJSON(@PathVariable String type) {
		
		typePlaceList = placeDao.getPlacebyType(type);
		
		
		for (Place i: typePlaceList)  {
		System.out.println(i.getName());
		}
		
		
		
		return typePlaceList;
	}
	
	
	
	
	
	
	
}
