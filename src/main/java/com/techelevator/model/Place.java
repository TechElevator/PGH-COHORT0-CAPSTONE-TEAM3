package com.techelevator.model;

public class Place {
	
	//private int place_id;
	private String google_id;
	private String name;
	private double lat;
	private double lng;
	private int up;
	private int down;
	private String description;
	private String type;
	//private String photo;
	//private String type;
	//private String description;
	//private boolean open;

	public double getLat() {
		return lat;
	}

	public double getLng() {
		return lng;
	}

	public int getUp() {
		return up;
	}

	public int getDown() {
		return down;
	}

	public String getDescription() {
		return description;
	}

	public String getType() {
		return type;
	}

	public void setLat(double lat) {
		this.lat = lat;
	}

	public void setLng(double lng) {
		this.lng = lng;
	}

	public void setUp(int up) {
		this.up = up;
	}

	public void setDown(int down) {
		this.down = down;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Place() {
		
		
		
	}

	/*
	public int getPlace_id() {
		return place_id;
	}

	public void setPlace_id(int place_id) {
		this.place_id = place_id;
	}
*/
		
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
/*
	public double getLat() {
		return lat;
	}

	public void setLat(double lat) {
		this.lat = lat;
	}

	public double getLng() {
		return lng;
	}

	public void setLng(double lng) {
		this.lng = lng;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public boolean isOpen() {
		return open;
	}

	public void setOpen(boolean open) {
		this.open = open;
	}
*/
	
	public String getGoogle_id() {
		return google_id;
	}

	public void setGoogle_id(String google_id) {
		this.google_id = google_id;
	}
	
	
}