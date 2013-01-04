# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
  map = new GMap2(document.getElementById("map_canvas"))
  map.setCenter(new GLatLng($(".data-location").data("latitude"), $(".data-location").data("longitude")), 15)
  GEvent.addListener map, "click", (overlay, latlng) ->
    if latlng
      $.get "/locations/"+ $('.data-location').data('id') + "/add_new_point_to_map?latitude=" + latlng.lat() + "&longitude=" + latlng.lng(), (response) ->
        $.fancybox response, {
          width: 500
          height: 50
          hideOnContentClick: false
          autoDimensions: false
        }