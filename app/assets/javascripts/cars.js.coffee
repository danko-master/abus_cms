# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

# Объявляем глобальную переменную, дабы вызвать ее в index.js.erb
window.sortable_cars = ->
  jQuery ->
    $("#ul_cars").sortable
      connectWith: ".ul-cars-connectedSortable"
      placeholder:"li-state-highlight"        
      update: (event, ui) ->
        $.post($("#ul_cars").data('update-url'), {car_id: ui.item.attr('id').split('_')[1], domain_id: $("#ul_cars_selected").data('domain-id')})

        
    $("#ul_cars_selected").sortable
      connectWith: ".ul-cars-connectedSortable"
      placeholder:"li-state-highlight"
      update: (event, ui) ->
        #alert($("#ul_cars_selected").data('update-url'))  
        $.post($("#ul_cars_selected").data('update-url'), {car_id: ui.item.attr('id').split('_')[1], domain_id: $("#ul_cars_selected").data('domain-id')}) 
       

    $("#ul_cars, #ul_cars_selected").disableSelection()

        
# Не забываем вызвать функцию после объявления
sortable_cars() 
  
  
  
  
