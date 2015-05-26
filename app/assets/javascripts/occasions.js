
$(document).ready(function(){
  $('.modal-trigger').leanModal();
});

$('#add-user').click(function(){
  $('#person_name').val();
  $('#modal2').openModal();
});


$(document).ready(function(){
  var currentDate = new Date();
  var exp_date = new Date(<%= @occasion.expiry_date.to_f*1000%>);
  if (currentDate < exp_date) {
    console.log('Hola cabeza de chola');
  }
  else {
    $('#change_gift').attr("class", "disabled");
    $('#remove_gift').attr("class", "disabled");
  }
});


// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
