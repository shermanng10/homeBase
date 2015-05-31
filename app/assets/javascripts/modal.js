$('document').ready(function() {
    $('#normaltrigger').on('click', switchMode)
    getWeather();
    $('.create-member').on('submit', createMember)
    $('a.login-window').click(function() {
        var loginBox = $(this).attr('href');
        $(loginBox).fadeIn(300);
        var popMargTop = ($(loginBox).height() + 24) / 2;
        var popMargLeft = ($(loginBox).width() + 24) / 2;

        $(loginBox).css({
            'margin-top': -popMargTop,
            'margin-left': -popMargLeft
        });
        $('body').append('<div id="mask"></div>');
        $('#mask').fadeIn(300);

        return false;
    });
    $(document).on('click', 'a.close, #mask, .submit', function() {
        $('#mask , .login-popup').fadeOut(300, function() {
            $('#mask').remove();
        });
        return false;
    });
});


$(function() {
    $('#loginform').submit(function(e) {
        e.preventDefault();

        $.ajax({
            url: e.target.action,
            method: e.target.method,
            data: $(e.target).serialize()
        }).done(function(response) {
            location.reload(false);
            console.log(response)
        }).fail(function(error) {
            console.log(error)
        })
    });

    $('#parenttrigger').leanModal({
        top: 110,
        overlay: 0.45,
        closeButton: ".hidemodal"
    });
});

var switchMode = function(e) {
    console.log(e.target)
    e.preventDefault();

    $.ajax({
        url: "sessions/normal",
        method: "GET"
    }).done(function(response) {
        location.reload(false);
        console.log(response)
    }).fail(function(error) {
        console.log(error)
    })
}

var getWeather = function() {
    // $.ajax({
    //     url: "http://api.openweathermap.org/data/2.5/weather?zip=10008,us&units=imperial",
    //     method: "GET",
    //   }).done(function(response){
    //     temp = response.main.temp
    //     description = response.weather[0].description
    //     $('#weather').text(temp + " and " + description)
    //   }).fail(function(error){
    //     console.log(error)
    //   })
}

var createMember = function(event){
  event.preventDefault();
  console.log($(event.target).serialize());
  $.ajax({
    url: "/members",
    method: "POST",
    data: $(event.target).serialize(),
  }).done(function(response){
    location.reload(false)
  }).fail(function(error){
    location.reload(false);
    console.log(error, "hello");
  });

}

// var getWeather = function(){
//   $.ajax({
//       url: "http://api.openweathermap.org/data/2.5/weather?zip=10008,us&units=imperial",
//       method: "GET",
//     }).done(function(response){
//       temp = response.main.temp
//       description = response.weather[0].description
//       $('#weather').text(temp + " and " + description)
//     }).fail(function(error){
//       console.log(error)
//     })
// }
>>>>>>> Fixing merge conflict
