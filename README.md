# Titanium Calendar

An easy to use iOS modal calendar for selecting dates. Based on the awesome [PDTSimpleCalendar](https://github.com/jivesoftware/PDTSimpleCalendar) library.

<img src="./screenshot.png" height="400" />

## Example

```js
var TiCalendar = require('ti.calendar');

var win = Ti.UI.createWindow({
  backgroundColor: '#fff'
});

var button = Ti.UI.createButton({
  title: 'Show calendar'
});

win.add(button);

const calendar = TiCalendar.createCalendar({
  // All optional
  title: L('Select Date', 'Select Date'),
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

win.open();
```

## License

MIT

## Author

Hans Knöchel
