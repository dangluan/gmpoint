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

### Add code below into application.html.erb :
		<%= show_map_helper your_model %>
		
		Example:
			<%= show_map_helper :users %>
			
			
### You can set options for view
	
		* You can set width , height for map view
			<%= show_map_helper :users, {width: 400, height: 200} %>
			
		* You can set searchbox_with for search box
			<%= show_map_helper :users, {searchbox_width: 300} %>
		
		* You can show or hide your search box
		
			<%= show_map_helper :users, {searchbox: 'show', width: 400, height: 200, searchbox_width: 300} %>
			
			and when you want to hide the search box
			<%= show_map_helper :users, {searchbox: 'none', width: 400, height: 200, searchbox_width: 300} %>
			
		* You can only set show or point to map using attribute "allow"
		
			<%= show_map_helper :users, {allow: 'show', searchbox: 'none', width: 400, height: 200, searchbox_width: 300} %>
			
			and when you want to point
			<%= show_map_helper :users, {allow: 'point', searchbox: 'none', width: 400, height: 200, searchbox_width: 300} %>
			
		Example:
			<%= show_map_helper :users, {width: 400, height: 200, searchbox_width: 300} %>
		