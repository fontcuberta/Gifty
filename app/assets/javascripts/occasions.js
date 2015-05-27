
//for expired event
$(document).ready(function(){
  var currentDate = new Date();
  var exp_date = new Date(<%= @occasion.expiry_date.to_f*1000%>);
  if (currentDate < exp_date) {
    console.log('Hola cabeza de chola');
  }
  else {
    $('#change_gift').attr("class", "disabled");
    $('#remove_gift').attr("class", "disabled");
    $('#add-user').hide();
    $('#modal_expired_alert').openModal();
  }
});



//for 
$(document).ready(function(){
  $('.modal-trigger').click($('#modal1').openModal());
});


$('#add-user').click(function(){
  $('#person_name').val();
  $('#modal2').openModal();
});










// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
