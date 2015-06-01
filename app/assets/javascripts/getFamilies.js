// $(document).ready(function(){
//   getFamilyname();
//   getFamilymembers();
// });


<<<<<<< HEAD
var getFamilyname = function(){
  $.ajax({
    url: "http://localhost:3000/families.json",
    type: 'get',
    dataType: 'json'
  }).done(function(response){
    var familynameTemplate = $('#familyname-template').html();
    var showName = function(name){
    var familynameRender = Mustache.render(familynameTemplate, name);
    $('.familyname-container').append(familynameRender);
    };
    showName(response)
    });
};


var getFamilymembers = function(){
  $.ajax({
    url: "http://localhost:3000/families.json",
    type: 'get',
    dataType: 'json'
  }).done(function(response){
    var memberMedalTemplate = $('#memberMedal-template').html();
    response.members.forEach(function(member){
      var memberMedalRender = Mustache.render(memberMedalTemplate, member);
      $('.members-medals-container').append(memberMedalRender);
    })
    });
};
=======
// var getFamilyname = function(){
//   $.ajax({
//     url: "http://localhost:3000/families.json",
//     type: 'get',
//     dataType: 'json'
//   }).done(function(response){
//     console.log(response);
//     var familynameTemplate = $('#familyname-template').html();
//     var showName = function(name){
//     var familynameRender = Mustache.render(familynameTemplate, name);
//     $('.familyname-container').append(familynameRender);
//     };
//     showName(response)
//     });
// };


// var getFamilymembers = function(){
//   $.ajax({
//     url: "http://localhost:3000/families.json",
//     type: 'get',
//     dataType: 'json'
//   }).done(function(response){
//     var memberMedalTemplate = $('#memberMedal-template').html();
//     response.members.forEach(function(member){
//       console.log(member)
//       var memberMedalRender = Mustache.render(memberMedalTemplate, member);
//       $('.members-medals-container').append(memberMedalRender);
//     })
//     });
// };
>>>>>>> Ability for parents to add points
