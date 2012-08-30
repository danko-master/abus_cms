# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  $("#ul_cars, #ul_cars_selected").sortable
    connectWith: ".ul-cars-connectedSortable"
    #update: (event, ui) ->
      #$.post($("#ul_images").data('update-url'), $(this).sortable('serialize'))

  $("#ul_cars, #ul_cars_selected").disableSelection()
  
# $("div[class~='div-move-car']").droppable
#   greedy: true
#   tolerance: 'pointer'
#   drop: (event, ui) ->
#     $.post($("#ul_cars_selected").data('update-url'))