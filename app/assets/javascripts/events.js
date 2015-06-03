$(document).ready(function(){
  var date = new Date();
  var d = date.getDate();
  var m = date.getMonth();
  var y = date.getFullYear();
  var calendar = $('#calendar').fullCalendar({
    theme: true,
    aspectRatio: 1.5,
    fixedWeekCount: false,
    header: {
      left: "prev, next today",
      center: "title",
      right: "month,agendaWeek,agendaDay"
    },
    selectable: true,
    selectHelper: true,
    editable: true,
    eventSources: [{
      url: '/events'
    }],
    timeFormat: 'h:mm'
  });
});
