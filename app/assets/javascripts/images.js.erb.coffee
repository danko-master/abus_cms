# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/



window.sortable_images = ->  
  jQuery ->
    $("#ul_images").sortable
      update: (event, ui) ->
        $.post($("#ul_images").data('update-url'), $(this).sortable('serialize'))
    
    $("#ul_images").disableSelection()
    
    $(".group1").colorbox({rel:'group1', transition:"none", maxWidth:"85%", maxHeight:"85%", current: "{current} <%= I18n.t('views.image.of') %> {total}"})
    
    
    
sortable_images() 

