# GMPOIT

This is gem for help to point on google map. You can marker your address and search your location

## Installation
### in your Gemfile
		gem 'gmpoint', git: 'git@github.com:dangluan/gmpoint.git'
		
## Setting Up

	bundle
	rails g gmpoint:install
	rails g gmpoint MODEL
	rake db:migrate

## Usage

### Registry google map key and add google map key in your head tag in application.html.erb

    <%= google_map_api_js("your google api key") %>
    
### Require locations.coffee.js into your application.js

    .....
    //= require locations
    .....
    

### Add code below into any where if you want to display the map :

		<%= show_map_helper your_model %>
		
		Example:
			<%= show_map_helper user %>
			
			
### You can set options for view
	
#### You can set "width" , "height" for map view
		<%= show_map_helper user, {width: 400, height: 200} %>
			
#### You can set "searchbox_with" for search box
		<%= show_map_helper user, {searchbox_width: 300} %>
		
#### You can show or hide your search box
		<%= show_map_helper user, {searchbox: 'show', width: 400, height: 200, searchbox_width: 300} %>
			
	and when you want to hide the search box
		<%= show_map_helper user, {searchbox: 'none', width: 400, height: 200, searchbox_width: 300} %>
			
#### You can only set show or point to map using attribute "allow"
		<%= show_map_helper user, {allow: 'show', searchbox: 'none', width: 400, height: 200, searchbox_width: 300} %>
			
	and when you want to point
		<%= show_map_helper user, {allow: 'point', searchbox: 'none', width: 400, height: 200, searchbox_width: 300} %>
			
	Example:
		<%= show_map_helper user, {width: 400, height: 200, searchbox_width: 300} %>
		
#### You can set latitude and longitude default for your place

    <%= show_map_helper user, {latitude: 1.3028, longitude: 103.35, allow: 'show', searchbox: 'none', width: 400, height: 200, searchbox_width: 300} %>
    
#### You can set zoom for map
    
    <%= show_map_helper user, {zoom: 10, latitude: 1.3028, longitude: 103.35, allow: 'show', searchbox: 'none', width: 400, height: 200, searchbox_width: 300} %>