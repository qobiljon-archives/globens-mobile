import 'package:flutter/material.dart';
import 'package:globens_flutter_client/utils/utils.dart';
import 'package:globens_flutter_client/utils/Locale.dart';

class WeeklyTimePickerModalView extends StatefulWidget {
  final int fromTimestamp, untilTimestamp;
  final Map<String, Set<int>> timeSlots;

  WeeklyTimePickerModalView(this.timeSlots, this.fromTimestamp, this.untilTimestamp);

  @override
  _WeeklyTimePickerModalViewState createState() => _WeeklyTimePickerModalViewState();
}

class _WeeklyTimePickerModalViewState extends State<WeeklyTimePickerModalView> {
  static const _CALENDAR_START_HOUR = 8;
  List<String> _weekdays;
  Map<String, bool> _weekdayEnabled;

  @override
  void initState() {
    super.initState();

    _weekdays = [Locale.get('MON'), Locale.get('TUE'), Locale.get('WED'), Locale.get('THU'), Locale.get('FRI'), Locale.get('SAT'), Locale.get('SUN')];
    _weekdayEnabled = {for (var v in _weekdays) v: true};

    if (widget.fromTimestamp > 0 && widget.untilTimestamp > 0) {
      var fromDt = DateTime.fromMillisecondsSinceEpoch(widget.fromTimestamp);
      var tillDt = DateTime.fromMillisecondsSinceEpoch(widget.untilTimestamp);

      if (tillDt.difference(fromDt).inDays < 7) {
        for (var key in _weekdayEnabled.keys) _weekdayEnabled[key] = false;
        for (int n = fromDt.weekday - 1;; n = (n + 1) % 7) {
          _weekdayEnabled[_weekdays[n]] = true;
          if (n == tillDt.weekday - 1) break;
        }
        setState(() {});
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          margin: EdgeInsets.only(top: 40.0, right: 30.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed: () => _onBackButtonPressed(context),
              ),
              getTitleWidget(Locale.get("Time slot selector"), textColor: Colors.black, margin: EdgeInsets.zero),
            ],
          ),
        ),
        Card(
          margin: EdgeInsets.only(top: 5.0, left: 15.0, right: 15.0),
          child: Container(
            child: GridView.count(
                primary: false,
                shrinkWrap: true,
                crossAxisSpacing: 0,
                mainAxisSpacing: 0,
                crossAxisCount: _weekdays.length + 1,
                children: List<Widget>.generate((24 - _CALENDAR_START_HOUR + 1) * (_weekdays.length + 1), (index) {
                  int col = index % (_weekdays.length + 1);
                  int row = index ~/ (_weekdays.length + 1);

                  if (row == 0) {
                    if (col == 0)
                      return TextButton(onPressed: _calendarMasterButtonPressed, child: Text(Locale.get('ALL'), textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 7.5)));
                    else {
                      String weekday = _weekdays[col - 1];
                      return TextButton(onPressed: () => _weekdayEnabled[_weekdays[col - 1]] ? _calendarWeekdayPressed(weekday) : null, child: Text(weekday, textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 9.0)));
                    }
                  } else {
                    int hour = row + _CALENDAR_START_HOUR - 1;

                    if (col == 0)
                      return TextButton(onPressed: () => _calendarHourPressed(hour), child: Text('${hour < 13 ? hour : hour % 12}\n${hour < 12 ? "AM" : "PM"}', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 9.0)));
                    else {
                      String weekday = _weekdays[col - 1];
                      bool selected = widget.timeSlots.containsKey(weekday) && widget.timeSlots[weekday].contains(hour);

                      if (_weekdayEnabled[_weekdays[col - 1]])
                        return IconButton(onPressed: () => _calendarSlotPressed(weekday, hour), icon: selected ? Icon(Icons.check, color: Colors.green) : Icon(Icons.remove, color: Colors.grey), padding: EdgeInsets.zero);
                      else
                        return Icon(Icons.block, color: Colors.grey);
                    }
                  }
                })),
          ),
        ),
      ],
    );
  }

  void _calendarMasterButtonPressed() {
    int blockedCount = 0;
    for (String weekday in _weekdays) if (!_weekdayEnabled[weekday]) blockedCount++;

    bool completelySelected = widget.timeSlots.length == _weekdays.length - blockedCount;
    for (String weekday in _weekdays)
      if (_weekdayEnabled[weekday]) if (completelySelected)
        completelySelected &= widget.timeSlots[weekday].length == 24 - _CALENDAR_START_HOUR;
      else
        break;

    widget.timeSlots.clear();
    if (!completelySelected) for (String weekday in _weekdays) if (_weekdayEnabled[weekday]) widget.timeSlots[weekday] = List<int>.generate(24 - _CALENDAR_START_HOUR, (index) => _CALENDAR_START_HOUR + index).toSet();

    setState(() {});
  }

  void _calendarHourPressed(int hour) {
    int blockedCount = 0;
    for (String weekday in _weekdays) if (!_weekdayEnabled[weekday]) blockedCount++;

    bool hourCompletelySelected = widget.timeSlots.length == _weekdays.length - blockedCount;
    for (String weekday in _weekdays)
      if (_weekdayEnabled[weekday]) if (hourCompletelySelected)
        hourCompletelySelected &= widget.timeSlots.containsKey(weekday) && widget.timeSlots[weekday].contains(hour);
      else
        break;

    if (hourCompletelySelected) {
      // remove
      for (String weekday in _weekdays)
        if (_weekdayEnabled[weekday]) {
          widget.timeSlots[weekday].remove(hour);
          if (widget.timeSlots[weekday].isEmpty) widget.timeSlots.remove(weekday);
        }
    } else {
      // insert
      for (String weekday in _weekdays)
        if (_weekdayEnabled[weekday]) if (widget.timeSlots.containsKey(weekday))
          widget.timeSlots[weekday].add(hour);
        else
          widget.timeSlots[weekday] = <int>[hour].toSet();
    }

    setState(() {});
  }

  void _calendarWeekdayPressed(final String day) {
    bool dayCompletelySelected = widget.timeSlots.containsKey(day);
    for (int hour = _CALENDAR_START_HOUR; hour < 24; hour++)
      if (dayCompletelySelected)
        dayCompletelySelected &= widget.timeSlots[day].contains(hour);
      else
        break;

    if (dayCompletelySelected) {
      // remove
      widget.timeSlots.remove(day);
    } else {
      // insert
      if (widget.timeSlots.containsKey(day))
        for (int hour = _CALENDAR_START_HOUR; hour < 24; hour++) widget.timeSlots[day].add(hour);
      else
        widget.timeSlots[day] = List<int>.generate(24 - _CALENDAR_START_HOUR, (index) => _CALENDAR_START_HOUR + index).toSet();
    }
    setState(() {});
  }

  void _calendarSlotPressed(String weekday, int hour) {
    bool selected = widget.timeSlots.containsKey(weekday) && widget.timeSlots[weekday].contains(hour);
    if (selected) {
      // remove
      widget.timeSlots[weekday].remove(hour);
      if (widget.timeSlots[weekday].isEmpty) widget.timeSlots.remove(weekday);
    } else {
      // insert
      if (widget.timeSlots.containsKey(weekday))
        widget.timeSlots[weekday].add(hour);
      else
        widget.timeSlots[weekday] = <int>[hour].toSet();
    }
    setState(() {});
  }

  void _onBackButtonPressed(BuildContext context) {
    Navigator.of(context).pop();
  }
}
