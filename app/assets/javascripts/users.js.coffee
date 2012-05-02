jQuery ->
  $('#user_major_ids').parent().after('<ul id="chosen-majors"></ul>');
  
  $('#user_major_ids option').each ->
    if($(this).is(':checked'))
       $('#chosen-majors').append('<li>' + $(this).text() + '</li>')
  
  $('#user_major_ids').multiSelect(
    selectAll: false
    noneSelected: "Choose Major(s):"
    oneOrMoreSelected: "Choose Major(s):"
    (el) ->
      if(el.is(':checked'))
        $('#chosen-majors').append('<li>' + el.parent().text() + '</li>')
      else
        $('#chosen-majors li').each ->
          if($(this).html() == el.parent().text())
            $(this).remove()      
  ) 
  
  $('#user_minor_ids').parent().after('<ul id="chosen-minors"></ul>');
  
  $('#user_minor_ids option').each ->
    if($(this).is(':checked'))
       $('#chosen-minors').append('<li>' + $(this).text() + '</li>')
  
  $('#user_minor_ids').multiSelect(
    selectAll: false
    noneSelected: "Choose Minor(s):"
    oneOrMoreSelected: "Choose Minor(s):"
    (el) ->
      if(el.is(':checked'))
        $('#chosen-minors').append('<li>' + el.parent().text() + '</li>')
      else
        $('#chosen-minors li').each ->
          if($(this).html() == el.parent().text())
            $(this).remove()      
  ) 
  
