$('document').ready(function(){
  $('#normaltrigger').on('click', switchMode)
});


$(function(){
  $('#loginform').submit(function(e){
    e.preventDefault();

    $.ajax({
      url: e.target.action,
      method: e.target.method,
      data: $(e.target).serialize()
    }).done(function(response){
      location.reload(false);
      console.log(response)
    }).fail(function(error){
      console.log(error)
    })
  });

  $('#parenttrigger').leanModal({ top: 110, overlay: 0.45, closeButton: ".hidemodal" });
});

var switchMode = function(e){
  console.log(e.target)
  e.preventDefault();

  $.ajax({
    url: "sessions/normal",
    method: "GET"
  }).done(function(response){
    location.reload(false);
    console.log(response)
  }).fail(function(error){
    console.log(error)
  })
}
