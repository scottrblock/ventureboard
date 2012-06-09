 $(document).ready(function(){
	$('ul.sf-menu').superfish();
    
    $(":header:contains('&')").each(function(){
        $(this).html($(this).html().replace(/&amp;/, "<span class='amp'>&amp;</span>"))
    });

        
    $.facebox.settings.loadingImage = '/js/facebox/loading.gif';
    $.facebox.settings.closeImage = '/js/facebox/closelabel.png';
    $.facebox.settings.opacity = 0.75;
    $('a[rel*=facebox]').facebox();
    
      $('.home-login').click(function(){
        var me = this;
        $.facebox(function(){
            $.get(me.href,
                null,
                function(data){
                    ajaxifyLoginForm(); // Here is the line we need to add
                },
            'html');
        });
        return false;
    });
    
    if($("#grid-filters").length > 0){
        buildUserGrid();
    }
    
 });

 //grid stuff, too much to write in cs for now
function buildUserGrid(){
   
    $('.user-grid .user-grid-box').mouseenter(function(e){
        $('.overlay', $(this)).fadeIn('fast');
    });
    
    $('.user-grid .user-grid-box').mouseleave(function(e){
        $('.overlay', $(this)).fadeOut('fast');
    });
    
    
    
    
    $(":text", $("#grid-filters")).labelify({ labelledClass: "labelHighlight" });
    
    //filter type
    $( "#filter-type" ).buttonset();
    
    //filter programs
    $('#filter-program').buttonset();
    
    //major filter
    var major_data = [];
    $('.more-info .box-majors ul li').each(function(e){
        major_data.push($(this).html());
    });
    major_data = _.uniq(major_data);
    major_data = _.sortBy(major_data, function(major){return major;});
    
    $.each(major_data, function(e, v){
        major_data[e] = {id: e, text: v}      
    });
    
    var place_holder = "Select Majors..."
    $("#filter-major").select2({
        query: function (query) {
            var data = {results: []}, i, j, s;
            for (i = 0; i < major_data.length; i++) {
                if(major_data[i].text.toLowerCase().indexOf(query.term.toLowerCase()) > -1 || query.term.indexOf('Select Major') > -1 || query.term.length < 1){
                    data.results.push({id: major_data[i].id, text: major_data[i].text});
                }
                
            }
            query.callback(data);
        },
        multiple: true,
        allowClear: true,
        placeholder: place_holder
    });

    
    //minor filter
    var minor_data = [];
    $('.more-info .box-minors ul li').each(function(e){
        minor_data.push($(this).html());
    });
    minor_data = _.uniq(minor_data);
    minor_data = _.sortBy(minor_data, function(minor){return minor;});
    
    $.each(minor_data, function(e, v){
        minor_data[e] = {id: e, text: v}      
    });
    
    var place_holder = "Select Minors..."
    $("#filter-minor").select2({
        query: function (query) {
            var data = {results: []}, i, j, s;
            for (i = 0; i < minor_data.length; i++) {
                if(minor_data[i].text.toLowerCase().indexOf(query.term.toLowerCase()) > -1 || query.term.indexOf('Select Minor') > -1  || query.term.length < 1){
                    data.results.push({id: minor_data[i].id, text: minor_data[i].text});
                }
                
            }
            query.callback(data);
        },
        multiple: true,
        allowClear: true,
        placeholder: place_holder
    });
    $(".select2-container").css('width', '241px');
    $(".select2-search-field input.select2-default").css('width', '220px');
 }
 
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
