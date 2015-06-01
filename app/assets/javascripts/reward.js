$(document).ready(function() {
  $('a.new-reward-link').click(function() {

    var rewardBox = $(this).attr('href');

    $(rewardBox).fadeIn(300);

    var popMargTop = ($(rewardBox).height() + 24) / 2;
    var popMargLeft = ($(rewardBox).width() + 24) / 2;

    $(rewardBox).css({
        'margin-top' : -popMargTop,
        'margin-left' : -popMargLeft
    });

    $('body').append('<div id="mask"></div>');
    $('#mask').fadeIn(300);

    return false;
  });
  getRewards();
  $('.signin').on('submit', assignReward)

// When clicking on the button close or the mask layer the popup closed
$(document).on('click', 'a.close, #mask', function() {
  $('#mask, .new-reward-popup').fadeOut(300, function(e) {
    $('#mask').remove();
  });
  return false;
});


});

var assignReward = function(e){
  e.preventDefault();
  $('#mask, .new-reward-popup').fadeOut(300, function(e) {
    $('#mask').remove();
  });
  $.ajax({
    url: '/tasks',
    method: 'post',
    data: $(e.target).serialize()
  }).done(function(response){
    location.reload(false)
  }).fail(function(error){
  })
}

var getRewards = function(){
  $.ajax({
    url: "http://localhost:3000/rewards",
    type: 'get',
    dataType: 'json'
  }).done(function(response){
    var rewardTemplate = $('#reward-template').html();
    var dropdown = $('#child-reward').html();
    $('.rewards-container').html("");
    response.members.forEach(function(member){
      var rewardRender = Mustache.render(rewardTemplate, member);
      var rewardDropdownMember = Mustache.render(dropdown, member);
      $('.rewards-container').append(rewardRender);
      $('.child-options').append(rewardDropdownMember);
    });
  });
};
