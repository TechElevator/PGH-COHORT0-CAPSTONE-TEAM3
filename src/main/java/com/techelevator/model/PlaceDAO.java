package com.techelevator.model;

import java.util.List;

public interface PlaceDAO {

	public void addPlace(Place newPlace);
	public Place getPlaceByGoogleId(String google_id);
	public List <Place> getAllPlaces();
	public List <Place> getPlacebyType(String type);
	public List <Place> getPlacebyHours();
	public List <Place> getPlacebyProximity(double lat, double lng);
	public void voteUpPlace(String google_id);
	public void voteDownPlace(String google_id);
}
