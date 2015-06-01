$(document).ready(function(){
  $(document).on('submit','.approve-chore', approveChore)
})

var approveChore = function(e){
  e.preventDefault();
  $.ajax({
    url: 'tasks/parent_complete',
    method: "post",
    data: $(e.target).serialize(),
  }).done(function(response){
    console.log(response);
  }).fail(function(error){
    console.log(error);
  });
}
