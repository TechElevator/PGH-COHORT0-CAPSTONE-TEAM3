package com.techelevator.model;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;


import com.techelevator.security.PasswordHasher;



@Component
public class JDBCItineraryDAO implements ItineraryDAO {

	private JdbcTemplate jdbcTemplate;
	private PasswordHasher hashMaster;

	@Autowired
	public JDBCItineraryDAO(DataSource dataSource, PasswordHasher hashMaster) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
		this.hashMaster = hashMaster;
	}
	
	
	@Override
	public void addItinerary(Itinerary NewItinerary) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteItinerary() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Itinerary getItineraryById(int id, int itinerary_id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Itinerary> getItinerarysByUser() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Itinerary> getItineraryforGuests() {
		// TODO Auto-generated method stub
		return null;
	}

	/*
	private Itinerary mapRowToItinerary(SqlRowSet results) {

		Itinerary theItinerary = new Itinerary();
		
		
		
		theItinerary.setSurveyId(results.getInt("surveyid"));
		theItinerary.setParkCode(results.getString("parkcode").toLowerCase());
		theItinerary.setEmailAddress(results.getString("emailaddress"));
		theItinerary.setState(results.getString("state"));
		theItinerary.setActivityLevel(results.getString("activitylevel"));

		return theItinerary;
	}
	*/
	
	private Itinerary mapItineraryNameToSurveyResults(SqlRowSet results) {

		Itinerary theItineraryResult = new Itinerary();
		theItineraryResult.setId(results.getInt("id"));    
		
		return theItineraryResult;
	}
	
	
}
