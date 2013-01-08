# GMPOIT

This is gem for help to point on google map. You can marker your address and search your location

## Installation

	gem 'gmpoint','>= 0.0.2'
		
## Setting Up

	bundle
	rails g gmpoint:install
	rails g gmpoint MODEL
	rake db:migrate

## Usage
	1. Add code below into application.html.erb :
		<%= show_map_helper your_model %>
		
		Example:
			<%= show_map_helper :users %>
			
			
	2. You can set options for view
	
		* You can set width , height for map view
		
		* You can set searchbox_with for search box
		
		* You can show or hidden your search box
		
			<%= show_map_helper :users, {searchbox: 'show', width: 400, height: 200, searchbox_width: 300} %>
			
			and when you want to hidden
			<%= show_map_helper :users, {searchbox: 'none', width: 400, height: 200, searchbox_width: 300} %>
			
		* You can only set show or point to map using "allow"
		
			<%= show_map_helper :users, {allow: 'show', searchbox: 'none', width: 400, height: 200, searchbox_width: 300} %>
			
			and when you want to point
			<%= show_map_helper :users, {allow: 'point', searchbox: 'none', width: 400, height: 200, searchbox_width: 300} %>
			
		Example:
			<%= show_map_helper :users, {width: 400, height: 200, searchbox_width: 300} %>
		