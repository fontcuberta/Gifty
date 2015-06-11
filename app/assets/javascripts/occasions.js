
//for expired event
// $(document).ready(function(){
//   var currentDate = new Date();
//   var exp_date = new Date(<%= @occasion.expiry_date.to_f*1000%>);
//   if (currentDate < exp_date) {
//     console.log('Hola cabeza de chola');
//   }
//   else {
//     $('#change_gift').attr("class", "disabled");
//     $('#remove_gift').attr("class", "disabled");
//     $('#add-user').hide();
//     $('#modal_expired_alert').openModal();
//        $('#buy-now').removeClass('hidden');
//   }
// });


$(document).ready(function(){
//for receivers info
  $('.modal-trigger').leanModal();
// for a new user in occasion
  $('#add-user').click(function(){
    $('#person_name').val();
    $('#modal2').openModal();
  });
    var currentDate = new Date();
    console.log(currentDate);
});

function check_if_expired() {
  var currentDate = new Date();
  if (currentDate < exp_date) {
    console.log('Hola cabeza de chola');
  }
  else {
    console.log('Hola cocacola');
  } 
}







// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
