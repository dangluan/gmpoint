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
	* Add code below into application.html.erb :
		<%= show_map_helper your_model %>
		Example:
			<%= show_map_helper :users %>
	* You can set options for view
		width , height for map view
		search_box_with for search box
		Example:
			<%= show_map_helper :users, {width: 400, height: 200, search_box_width: 300} %>
	