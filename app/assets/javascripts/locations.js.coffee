# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
  opts = 
    center: new google.maps.LatLng($('.data-location').data('latitude'), $('.data-location').data('longitude'))
    zoom: $('.data-location').data('zoom')
    mapTypeId: google.maps.MapTypeId.ROADMAP
    
  map = new google.maps.Map(document.getElementById("map_canvas"), opts)
  map.setOptions({draggableCursor: 'url(http://maps.gstatic.com/mapfiles/crosshair.cur), default'})
  google.maps.event.addListener map, "click", (event) ->
    latlng = event.latLng
    $.get "/locations/add_new_point_to_map?latitude=" + latlng.lat() + "&longitude=" + latlng.lng(), (response) ->
      $.fancybox response,
        width: 500
        height: 50
        hideOnContentClick: false
        autoDimensions: false