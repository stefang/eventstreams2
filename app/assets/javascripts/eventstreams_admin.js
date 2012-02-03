$(document).ready(function(){
	$('#ajax_status').hide();
	
	// Stand alone old school sortable
	
	$("#sortable").sortable({ 
		axis: 'y',
		update: function(event, ui) { 
			update_list_order(
				$("#sortable").attr('data-user_id'),
				$("#sortable").attr('data-event_id'),
				$("#sortable").attr('data-model'),
				$("#sortable").attr('data-location'),
				$("#sortable").sortable('serialize')
			); 
		}
	});
	$("#sortable").disableSelection();
	
	// Target Source For Multiple Sortables
	
	$("#sortable_source").sortable({
	  axis: 'y',
	  connectWith: '.connected',
	  start: function(){
	    $(".sortable_target").prepend("<li class='target'>Drop menu item here to activate</li>").addClass('activeTarget');
	  },
	  beforeStop: function() {
	    $(".sortable_target").removeClass('activeTarget');
	    $(".sortable_target .target").remove();
	  }
	});
	
	// Multiple Sortable targets
	
	$(".sortable_target").sortable({
	  axis: 'y',
	  connectWith: '.connected',
	  start: function(){
	    $("#sortable_source").prepend("<li class='target'>Drop menu item here to disable</li>").addClass('activeTarget');
	  },
	  beforeStop: function() {
	    $("#sortable_source").removeClass('activeTarget');
	    $("#sortable_source .target").remove();
    },
		update: function(event, ui) { 
		  console.log('update:' + $(this).attr('data-location'));
			update_list_order(
				$(this).attr('data-user_id'),
				$(this).attr('data-event_id'),
				$(this).attr('data-model'),
				$(this).attr('data-location'),
				$(this).sortable('serialize')
			); 
		},
		receive: function(event, ui) {
		  console.log('receive:' + $(this).attr('data-location') + ' from:'+ui.sender.attr('data-location'));
		  li = $(event.srcElement);
			create_menu_item(
				$(this).attr('data-user_id'),
				$(this).attr('data-event_id'),
				$(this).attr('data-location'),
				li.attr('data-type'),
				li.attr('data-id'),
				li.find('.title').text(),
				li.find('.url').text(),
				li				
			); 
		},
		remove: function(event, ui) {
		  console.log('remove:' + $(this).attr('data-location'));
		  li = $(event.srcElement);
		  destroy_menu_item(
				$(this).attr('data-user_id'),
				$(this).attr('data-event_id'),
		    li.attr('id').replace('event_menu_', '')
		  );
		}		
	});
	
  var create_menu_item = function(user_id, event_id, location, item_type, item_id, title, url, el) {
    item_order = el.index() + 1;
    el.addClass = "saving"
    $('#ajax_status').show().empty().append("Saving new menu item");
    $.post("/users/"+user_id+"/events/"+event_id+"/event_menus", {location: location, item_type: item_type, item_id: item_id, title: title, url: url, item_order: item_order}, function(data){
       if (data != "false") {
         el.attr('id', 'event_menu_'+data).find('.title').removeClass('saving').addClass('editable');
       }
    });   
  }
  
  var destroy_menu_item = function(user_id, event_id, menu_item_id) {
    $('#ajax_status').show().empty().append("Deleting new menu item");
    $.post("/users/"+user_id+"/events/"+event_id+"/event_menus/"+menu_item_id+"/destroy", function(data){
    });   
  }

	var update_list_order = function(user_id, event_id, model, location, serialize) {
  	$('#ajax_status').show().empty().append("Saving new order");
    $.post("/users/"+user_id+"/events/"+event_id+"/"+model+"/update_order", {menu_location: location, item_order: serialize}, function(data){
       $('#ajax_status').empty().append(data);
    });
    
    // if ($('.sortable_target li').length > 0) {
    //   $('p.empty_menu').hide();
    // } else {
    //   $('p.empty_menu').show();
    // }
    
  };
	
	$("#sortable_source, #sortable_target").disableSelection();
	
	$("span.editable").live('dblclick', function(){
	  var title_span = $(this);
	  if (title_span.find('input').length < 1) {
  	  title_span.attr('data-original-value', title_span.html()).html("<input type='text' value='"+title_span.html()+"'>");
  	  title_span.find('input').focus().keyup(function(e){
  	    switch(e.keyCode) {
  	      case 27: // esc
  	        content_edit_reset_value(title_span)
  	        break;
  	      case 13: // enter
  	        if (content_edit_value_changed(title_span)) content_edit_init_save(title_span)
  	        break;	      
  	    }
  	  }).blur(function(){
  	    if (content_edit_value_changed(title_span)) {
  	      content_edit_save_value(title_span)
  	    } else {
  	      content_edit_reset_value(title_span)
  	    }
  	  });
	  }
	  return false;
	});
	
	var content_edit_reset_value = function(el){
	  el.empty().text(el.attr('data-original-value'));  
	};

	var content_edit_update_value = function(el, value){
	  el.empty().text(value);  
	};
	
	var content_edit_value_changed = function(el){
	  if (el.find('input').val() == el.attr('data-original-value') || el.find('input').val() == '') {
	    return false;
	  } else {
	    return true;
	  }
	}
	
	var content_edit_init_save = function(el){
	  var li = el.parent();
	  var ul = li.parent();

  	content_edit_save_value(
  	  el,
  		ul.attr('data-user_id'),
  		ul.attr('data-event_id'),
  		li.attr('id').replace('event_menu_', ''),
  		el.find('input').val()
  	); 
	}
	
  var content_edit_save_value = function(el, user_id, event_id, menu_item_id, value) {
  	$('#ajax_status').show().empty().append("Saving new title");
    $.post("/users/"+user_id+"/events/"+event_id+"/event_menus/"+menu_item_id+"/update", {custom_title: value}, function(data){
       $('#ajax_status').empty().append(data);
       if (!data.match('failed')) {
         content_edit_update_value(el, value);
       }
       
    });
  };	
		
  $('#flash').hide();
  if ($('#flash').length > 0) {
    flashType = $('#flash div').attr('id');
    if (flashType == 'error') {
      stayType = true;
    } else {
      stayType = false;
    }
    $.noticeAdd({
     text: $('#flash div.inner div').text(),
     stay: stayType,
     type: flashType
    });
  }
  
	$("input.datepicker").datepicker({dateFormat: "dd-mm-yy"});
	$("#ui-datepicker-div").hide();
	
	if ($('#picker').length > 0) {
    var f = $.farbtastic('#picker');
    var p = $('#picker').css('opacity', 0);
    var selected;
    $('.colorwell')
      .each(function () { f.linkTo(this); $(this).css('opacity', 0.75); })
      .focus(function() {
        if (selected) {
          $(selected).css('opacity', 0.75).removeClass('colorwell-selected');
        }
        f.linkTo(this);
        p.css('opacity', 1);
        $(selected = this).css('opacity', 1).addClass('colorwell-selected');
      })
  		.blur(function(){
        p.css('opacity', 0);
  		});    
	}

});