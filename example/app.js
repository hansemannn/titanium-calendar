
/*
 * There are two ways of using this module:
 *   1. Add the calendar view to a view of your desire  (current example)
 *   2. Show a calendar dialog modally (commented out below)
 */

var TiCalendar = require('ti.calendar');

var selectedDate = new Date();

var win = Ti.UI.createWindow({
    title: 'Select Date',
    backgroundColor: '#fff'
});

var button = Ti.UI.createButton({
    title: 'Show calendar'
});

win.add(button);

button.addEventListener('click', function() {
    const calendar = TiCalendar.createCalendarView({
        title: 'Select Date',
        value: selectedDate,
        circleBackgroundColor: '#fff',
        circleSelectedBackgroundColor: '#f00',
        textColor: '#000',
        textSelectedColor: '#fff',
        todayTextColor: '#333',
        todayCircleBackgroundColor: '#dbdbdb'
    });

    calendar.addEventListener('change', function(e) {
        Ti.API.warn('Selected date: ' + e.date);
        selectedDate = e.date;
    });

    var win2 = Ti.UI.createWindow({
        title: 'Select Date',
        backgroundColor: '#fff'
    });

    win2.add(calendar);

    nav.openWindow(win2);
});

var nav = Ti.UI.iOS.createNavigationWindow({
    window: win
});

nav.open();

// var win = Ti.UI.createWindow({
//     title: 'Select Date',
//     backgroundColor: '#fff'
// });

// var button = Ti.UI.createButton({
//     title: 'Show calendar'
// });

// win.add(button);

// const calendar = TiCalendar.createCalendar({
//     title: 'Select Date',
//     value: new Date(),
//     circleBackgroundColor: '#fff',
//     circleSelectedBackgroundColor: '#f00',
//     textColor: '#000',
//     textSelectedColor: '#fff',
//     todayTextColor: '#333',
//     todayCircleBackgroundColor: '#dbdbdb'
// });

// calendar.addEventListener('change', function() {
//     calendar.hide();
// });

// button.addEventListener('click', function() {
//     calendar.show();
// });

// var nav = Ti.UI.iOS.createNavigationWindow({
//     window: win
// });

// nav.open();