package com.techelevator.model;

import java.util.List;

public interface ItineraryDAO {

	public void addItinerary(int id);
	public void deleteItinerary(int itinerary_id);
	//public Itinerary getItineraryById(int id, int itinerary_id);
	public List <Itinerary> getItinerarysByUser(int id);
	public List <Itinerary> getItineraryforGuests();
	
}
