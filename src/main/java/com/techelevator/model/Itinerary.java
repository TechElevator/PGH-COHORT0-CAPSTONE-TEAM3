package com.techelevator.model;

public class Itinerary {
	
	
	private int user_id;
	private int itinerary_id;
	private String google_id_one;
	private String google_id_two;
	private String google_id_three;
	private String google_id_four;
	private String google_id_five;
	private boolean visible;
	
	
	
	public Itinerary() {
		
	}



	public int getUser_id() {
		return user_id;
	}



	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}



	public int getItinerary_id() {
		return itinerary_id;
	}



	public void setItinerary_id(int itinerary_id) {
		this.itinerary_id = itinerary_id;
	}



	public String getGoogle_id_one() {
		return google_id_one;
	}



	public void setGoogle_id_one(String google_id_one) {
		this.google_id_one = google_id_one;
	}



	public String getGoogle_id_two() {
		return google_id_two;
	}



	public void setGoogle_id_two(String google_id_two) {
		this.google_id_two = google_id_two;
	}



	public String getGoogle_id_three() {
		return google_id_three;
	}



	public void setGoogle_id_three(String google_id_three) {
		this.google_id_three = google_id_three;
	}



	public String getGoogle_id_four() {
		return google_id_four;
	}



	public void setGoogle_id_four(String google_id_four) {
		this.google_id_four = google_id_four;
	}



	public String getGoogle_id_five() {
		return google_id_five;
	}



	public void setGoogle_id_five(String google_id_five) {
		this.google_id_five = google_id_five;
	}



	public boolean isVisible() {
		return visible;
	}



	public void setVisible(boolean visible) {
		this.visible = visible;
	}

}