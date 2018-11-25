var TiCalendar = require('ti.calendar');

var win = Ti.UI.createWindow({
    title: 'Select Date',
    backgroundColor: '#fff'
});

var button = Ti.UI.createButton({
    title: 'Show calendar'
});

win.add(button);

const calendar = TiCalendar.createCalendar({
    title: 'Select Date',
    value: new Date(),
    circleBackgroundColor: '#fff',
    circleSelectedBackgroundColor: '#f00',
    textColor: '#000',
    textSelectedColor: '#fff',
    todayTextColor: '#333',
    todayCircleBackgroundColor: '#dbdbdb'
});

calendar.addEventListener('change', function() {
    calendar.hide();
});

button.addEventListener('click', function() {
    calendar.show();
});

var nav = Ti.UI.iOS.createNavigationWindow({
    window: win
});

nav.open();