  $(document).ready(function(){
  var date = new Date()
  $('#date').text(date.toDateString());
  getPeople();
  getUnassigned();
  $(document).on('submit','.chore-form', updateChore);
  $(document).on('submit', '.reject-chore', deleteChore);
});

var deleteChore = function(e){
  e.preventDefault();
  $.ajax({
    url: 'tasks/delete_task',
    type: 'post',
    data: $(e.target).serialize()
  }).done(function(response){
    location.reload(false)
  }).fail(function(error){
  })
};

var updateChore = function(e){
  e.preventDefault();
  $.ajax({
    url: "tasks/kid_complete",
    type: 'post',
    data: $(e.target).serialize()
  }).done(function(response){
    getPeople();
  }).fail(function(error){
  })
};

var getPeople = function(){
  $.ajax({
    url: "http://localhost:3000/families.json",
    type: 'get',
    dataType: 'json'
  }).done(function(response){
    var template = $('#person-template').html();
    var dropdown = $('#child-chore').html()
    $('.people-container').html("");
    response.members.forEach(function(member){
      var renderPeople = Mustache.render(template, member);
      var renderChildChores = Mustache.render(dropdown, member)
      $('.people-container').append(renderPeople);
      $('#child-options').append(renderChildChores);
    });
  });
};


var getUnassigned = function(){
  $.ajax({
    url: "http://localhost:3000/families.json",
    type: 'get',
    dataType: 'json'
  }).done(function(response){
    var taskTemplate = $('#task-template').html();
    response.unassignedTasks.forEach(function(task){
      var renderUnassigned = Mustache.render(taskTemplate, task);
      $('#unassigned').append(renderUnassigned);
    })
    });
};
