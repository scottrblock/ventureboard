jQuery ->
  if !$('.field-add-major').prev().is('fieldset')
   time = new Date().getTime() 
   regexp = new RegExp($(this).data('id'), 'g')
   $('.field-add-major').before($('.add-fields').data('fields'))
  
  $('.add-fields').addClass('blue-button');
  $('.remove-fields').addClass('light-red-button');
 
	
  $('form').on 'click', '.remove-fields', (event) ->
    $(this).prev('input[type=hidden]').val('1')
    $(this).closest('fieldset').hide()
    event.preventDefault()

  $('form').on 'click', '.add-fields', (event) ->
    time = new Date().getTime() 
    regexp = new RegExp($(this).data('id'), 'g')
    $(this).before($(this).data('fields').replace(regexp, time))
    event.preventDefault()
