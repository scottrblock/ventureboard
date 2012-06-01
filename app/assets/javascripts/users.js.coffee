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
        $('#user_major_ids option[value="'+ el.val() + '"]').attr('selected', true);
        $('#chosen-majors').append('<li>' + el.parent().parent().parent().text() + '</li>')
      else
        $('#user_major_ids option[value="'+ el.val() + '"]').attr('selected', false);
        $('#chosen-majors li').each ->
          if($(this).html() == el.parent().parent().parent().text())
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
        $('#chosen-minors').append('<li>' + el.parent().parent().parent().text() + '</li>')
        $('#user_minor_ids option[value="'+ el.val() + '"]').attr('selected', true);
      else
        $('#user_minor_ids option[value="'+ el.val() + '"]').attr('selected', false);
        $('#chosen-minors li').each ->
          if($(this).html() == el.parent().parent().parent().text())
            $(this).remove()      
  )

  $("input:radio, input:checkbox").uniform();
  
  $('.checkbox-label').click ->
    the_box = $('.checker span input', $(this).parent())
    console.log(the_box.attr('checked'));
    if(the_box.attr('checked') == undefined || the_box.attr('checked') == false)
      the_box.attr('checked', true);
      $('.checker span', $(this).parent()).addClass('checked');
    else
      the_box.attr('checked', false);
      $('.checker span', $(this).parent()).removeClass('checked');
  
  $('#user_skill_list').tagsInput('defaultText':'add a skill')
  $('#user_interest_list').tagsInput('defaultText':'add an interest', 'minInputWidth': 100)

  $('#tab-container').easytabs(tabs : '#custom-tabs li');

  