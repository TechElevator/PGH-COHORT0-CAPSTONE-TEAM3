package com.techelevator.model;

import java.util.Date;

public class Itinerary {
	
	
	private int id;
	private int itinerary_id;
	private String place_id;
	private String name;
	private double lat;
	private double lng;
	private Date date;
	private String startingPoint;  //this could be the google place id, 
									//not sure if we need lng/lat for this yet
	
	public Itinerary() {
		
	}

	public String getPlace_id() {
		return place_id;
	}

	public String getName() {
		return name;
	}

	public double getLat() {
		return lat;
	}

	public double getLng() {
		return lng;
	}

	public Date getDate() {
		return date;
	}
	
	public String getStartingPoint() {
		return startingPoint;
	}

	public void setPlace_id(String place_id) {
		this.place_id = place_id;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setLat(double lat) {
		this.lat = lat;
	}

	public void setLng(double lng) {
		this.lng = lng;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public void setStartingPoint(String startingPoint) {
		this.startingPoint = startingPoint;
	}
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getItinerary_id() {
		return itinerary_id;
	}

	public void setItinerary_id(int itinerary_id) {
		this.itinerary_id = itinerary_id;
	}
	
}