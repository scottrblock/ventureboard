 $(document).ready(function(){
	$('ul.sf-menu').superfish();
    
    $.facebox.settings.loadingImage = '/js/facebox/loading.gif';
    $.facebox.settings.closeImage = '/js/facebox/closelabel.png';
    $.facebox.settings.opacity = 0.75
    $('a[rel*=facebox]').facebox();
    
    $('a[rel*=facebox]').click(function(){
        var me = this;
        $.facebox(function(){
            $.get(me.href,
                null,
                function(data){
                    $.facebox(data);
                    ajaxifyLoginForm(); // Here is the line we need to add
                },
            'html');
        });
        return false;
    });
    
    //grid stuff, too much to write in cs for now
    var currentTallest = 0;
    $('.user-box-wrap').each(function(e){
        currentTallest = 0;
        $('.user-box', $(this)).each(function(f){
            if ($(this).outerHeight() > currentTallest) { currentTallest = $(this).outerHeight(); }
        });
        $(this).children().css('min-height', currentTallest + 'px');
        
    });
 });
 
 
function ajaxifyLoginForm() {
    $('#facebox .new_user_session').submit(function(){
      var me = $(this); // need access to this in our callbacks
      
      $.ajax({
          type: 'POST',
          url: $(this).attr('action'),
          data: $(this).serialize(),
          dataType: 'html',
          success: function(data) { window.location = '/'; },
          error: function(xhr) {
            if (xhr.status == '406') {
              $('#errorExplanation').remove();
              me.before('<div id="errorExplanation" class="alert-error">' + xhr.responseText +  '</div>');
            }
          }
      });
      return false;
    });
}
