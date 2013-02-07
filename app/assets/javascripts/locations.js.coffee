# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
window.initJsMap = ->
  window.geopoint_search_map($("#gmpoint_location_address"))
  $("#geopoint_search_box_container input").keypress (e) ->
    if e.keyCode == 13 # enter
      window.geopoint_search_map($(@))
  
  zoom = $('.data-location').data('zoom')
  if $("#gmpoint_location_address").val() == ""
    zoom = 11
  opts = 
    center: new google.maps.LatLng($('.data-location').data('latitude'), $('.data-location').data('longitude'))
    zoom: zoom
    mapTypeId: google.maps.MapTypeId.ROADMAP
    
    
  window.gmpoint_map = new google.maps.Map(document.getElementById("map_canvas"), opts)
  window.gmpoint_marker = new google.maps.Marker({position: opts.center, draggable: true})
  window.gmpoint_info_window = new google.maps.InfoWindow({})
  window.gmpoint_map.setCenter(window.gmpoint_marker.getPosition(), 16)
  window.gmpoint_info_window.close()
  window.gmpoint_marker.setMap(window.gmpoint_map)
  if $("#gmpoint_map_allow").attr('value') == "point"
    google.maps.event.addListener window.gmpoint_map, "click", (event) ->
      latlng = event.latLng
      window.geopoint_handle(latlng)

window.mapResize = ->
  google.maps.event.trigger(window.gmpoint_map, "resize");
  
window.geopoint_search_map = (dom) ->
  addressField = $(dom)
  geocoder = new google.maps.Geocoder()
  geocoder.geocode {address: addressField.val()}, (results, status) -> 
    if status == google.maps.GeocoderStatus.OK
      loc = results[0].geometry.location
      window.gmpoint_marker.setPosition(loc)
      window.gmpoint_map.setCenter(window.gmpoint_marker.getPosition(), 16)
      point = loc
      window.geopoint_handle(point)
      
window.geopoint_handle = (attr)->
  $("#gmpoint_location_latitude").val(attr.lat())
  $("#gmpoint_location_longitude").val(attr.lng())
  window.gmpoint_marker.setPosition(attr)    
  geocoder = new google.maps.Geocoder()
  if $("#gmpoint_map_allow").attr('value') == "point"
    window.gmpoint_info_window.open(window.gmpoint_map, window.gmpoint_marker)
  else
    
  window.gmpoint_info_window.setContent("Loading...")
  geocoder.geocode {'latLng': attr}, (results, status) ->     
    if status == google.maps.GeocoderStatus.OK
      if results[1]  
        window.gmpoint_info_window.setContent(results[0].formatted_address)
        $("#gmpoint_location_address").val(results[0].formatted_address)
