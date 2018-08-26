package com.techelevator.model;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import com.techelevator.security.PasswordHasher;

@Component
public class JDBCPlaceDAO implements PlaceDAO {

	private JdbcTemplate jdbcTemplate;
	private PasswordHasher hashMaster;
	

	@Autowired
	public JDBCPlaceDAO(DataSource dataSource, PasswordHasher hashMaster) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
		this.hashMaster = hashMaster;
	}

	@Override
	public void addPlace(Place newPlace) {
		// TODO Auto-generated method stub
		
	}
	
	@Override
	public Place getPlaceByGoogleId(String google_id) {
		Place PlaceByGoogleID = null;
		String sqlDisplayPlaceInformation = "SELECT * FROM places WHERE google_id = ?;";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlDisplayPlaceInformation, google_id);
		if (results.next()) {
			PlaceByGoogleID = mapPlaceNameToPlaceResults(results);
		
		}
		return PlaceByGoogleID;
	}
	
	@Override
	public List<Place> getAllPlaces() {
		
		
			LinkedList<Place> Place = new LinkedList<>();
			String sqlStatement = "SELECT * FROM places;";

			SqlRowSet results = jdbcTemplate.queryForRowSet(sqlStatement);

			while (results.next()) {
				Place.add(mapPlaceNameToPlaceResults(results));
			}
			return Place;
		
	}

	@Override
	public List<Place> getPlacebyType(String type) {
		LinkedList<Place> PlaceByType = new LinkedList<Place>();
		String sqlDisplayPlaceInformation = "SELECT * FROM places WHERE type = ?;";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlDisplayPlaceInformation, type);
		if (results.next()) {
			Place thePlace = mapPlaceNameToPlaceResults(results);
			PlaceByType.add(thePlace);

		}
		return PlaceByType;
	}
	
	@Override
	public List<Place> getPlacebyHours() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Place> getPlacebyProximity(double lat, double lng) {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	private Place mapRowToPlace(SqlRowSet results) {

		Place thePlace = new Place();
		
		thePlace.setName(results.getString("place_name"));  
		thePlace.setGoogle_id(results.getString("google_id"));
		return thePlace;
	}
	
	
	private Place mapPlaceNameToPlaceResults(SqlRowSet results) {

		Place thePlaceResult = new Place();
		thePlaceResult.setGoogle_id(results.getString("google_id")); 
		thePlaceResult.setName(results.getString("place_name"));
		thePlaceResult.setDescription(results.getString("description"));
		thePlaceResult.setLat(results.getDouble("lat"));
		thePlaceResult.setLat(results.getDouble("llng"));
		thePlaceResult.setType(results.getString("type"));
		thePlaceResult.setDown(results.getInt("down"));
		thePlaceResult.setDown(results.getInt("up"));
		
		return thePlaceResult;
	}

	
	
	
}
