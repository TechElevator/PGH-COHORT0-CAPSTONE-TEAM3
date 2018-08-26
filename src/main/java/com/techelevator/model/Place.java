package com.techelevator.model;

public class Place {

//private int place_id;
private String google_id;
private String name;
private double lat;
private double lng;
//private String photo;
private String type;
private String description;
private int up;
private int down;

public Place() {    
}

public String getGoogle_id() {
    return google_id;
}

public void setGoogle_id(String google_id) {
    this.google_id = google_id;
}

public String getName() {
    return name;
}

public void setName(String name) {
    this.name = name;
}

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

public int getUp() {
    return up;
}

public void setUp(int up) {
    this.up = up;
}

public int getDown() {
    return down;
}

public void setDown(int down) {
    this.down = down;
}
}