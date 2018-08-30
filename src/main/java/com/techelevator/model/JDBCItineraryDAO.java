package com.techelevator.model;

import java.util.LinkedList;
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
	public void addItinerary(int id) {
			String sqlInsertNewItinerary = "INSERT INTO itineraries(itinerary_id,user_id,google_id_one,google_id_two,google_id_three,google_id_four,google_id_five,visible,name_one,name_two,name_three,name_four,name_five) "
					+ "VALUES (?,?,?,?,?,?,?,true,?,?,?,?,?) RETURNING itinerary_id;";
		
			Itinerary NewItinerary = new Itinerary();
			NewItinerary.setItinerary_id(getNextItineraryId());
			jdbcTemplate.update(sqlInsertNewItinerary, NewItinerary.getUser_id(),
					NewItinerary.getGoogle_id_one(), NewItinerary.getGoogle_id_two(), NewItinerary.getGoogle_id_three(), NewItinerary.getGoogle_id_four(),
					NewItinerary.getGoogle_id_five(), NewItinerary.isVisible(), NewItinerary.getName_one(),
					NewItinerary.getName_two(), NewItinerary.getName_three(), NewItinerary.getName_four() ,NewItinerary.getName_five());
			NewItinerary.setItinerary_id(id);	
	}
	
	private int getNextItineraryId() {
		SqlRowSet nextIdResult = jdbcTemplate.queryForRowSet("Select nextval(pg_get_serial_sequence('itineraries', 'itinerary_id'));");
		if (nextIdResult.next()) {
			return nextIdResult.getInt(1);
		} else {
			throw new RuntimeException("Something went wrong while getting an id for the new campsite");
		}
	}
	
	
	

	@Override
	public void deleteItinerary(int itinerary_id) {
		String sqlSearchByItineraryId ="UPDATE itineraries set visible = 'false' WHERE itinerary_id = ?;";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSearchByItineraryId, itinerary_id);
	}
	
	

	@Override
	public List<Itinerary> getItinerarysByUser(int id) {

		   LinkedList<Itinerary> itineraryByUser = new LinkedList<>();
		   String sqlSearchByUsername ="Select * from itineraries where user_id = ?";
		    SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSearchByUsername, id);
		    while (results.next()) {
		    		itineraryByUser.add(mapRowToItinerary(results));
		    }

		    return itineraryByUser;
		}
	

	@Override
	public List<Itinerary> getItineraryforGuests() {
		 LinkedList<Itinerary> allItineraries = new LinkedList<>();

		   String sqlSearchByUsername ="SELECT * FROM itineraries;";


		    SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSearchByUsername);
		    while (results.next()) {
		       
		    	allItineraries.add(mapRowToItinerary(results));

		    }
		    for(int i= 0; i < allItineraries.size(); i++) {
		   
		    }
		    return allItineraries;
	}

	
	private Itinerary mapRowToItinerary(SqlRowSet results) {

		Itinerary theItinerary = new Itinerary();
		
		theItinerary.setItinerary_id(results.getInt("itinerary_id"));
		theItinerary.setUser_id(results.getInt("user_id"));
		theItinerary.setGoogle_id_one(results.getString("google_id_one"));
		theItinerary.setGoogle_id_two(results.getString("google_id_two"));
		theItinerary.setGoogle_id_three(results.getString("google_id_three"));
		theItinerary.setGoogle_id_four(results.getString("google_id_four"));
		theItinerary.setGoogle_id_five(results.getString("google_id_five"));
		theItinerary.setVisible(results.getBoolean("visible"));
		theItinerary.setName_one(results.getString("name_one"));
		theItinerary.setName_two(results.getString("name_two"));
		theItinerary.setName_three(results.getString("name_three"));
		theItinerary.setName_four(results.getString("name_four"));
		theItinerary.setName_five(results.getString("name_five"));

		return theItinerary;
	}
	
	
	
	
}
