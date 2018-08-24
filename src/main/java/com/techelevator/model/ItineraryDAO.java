package com.techelevator.model;

import java.util.List;

public interface ItineraryDAO {

	public void addItinerary(Itinerary NewItinerary);
	public void deleteItinerary();
	public Itinerary getItineraryById(int id, int itinerary_id);
	public List <Itinerary> getItinerarysByUser();
	public List <Itinerary> getItineraryforGuests();
	
}
