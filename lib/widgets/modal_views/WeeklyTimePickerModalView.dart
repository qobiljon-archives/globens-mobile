import 'package:globens_flutter_client/entities/Product.dart';
import 'package:globens_flutter_client/utils/Utils.dart';
import 'package:globens_flutter_client/utils/Locale.dart';
import 'package:flutter/material.dart';

class WeeklyTimePickerModalView extends StatefulWidget {
  final Product product;
  final List<TimeSlot> timeSlots;

  WeeklyTimePickerModalView(this.product, this.timeSlots);

  @override
  _WeeklyTimePickerModalViewState createState() => _WeeklyTimePickerModalViewState();
}

class _WeeklyTimePickerModalViewState extends State<WeeklyTimePickerModalView> {
  static const _CALENDAR_START_HOUR = 0;
  List<String> _weekdays;
  Map<String, Set<int>> _timeSlotSelections;
  Map<String, bool> _weekdayEnabled;
  int _startDateTimestamp;
  int _signUpDurationMonths;

  @override
  void initState() {
    super.initState();

    _signUpDurationMonths = 1;
    _weekdays = [Locale.get('MON'), Locale.get('TUE'), Locale.get('WED'), Locale.get('THU'), Locale.get('FRI'), Locale.get('SAT'), Locale.get('SUN')];
    _weekdayEnabled = {for (var v in _weekdays) v: true};
    _timeSlotSelections = Map<String, Set<int>>();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          margin: EdgeInsets.only(top: 20.0, right: 30.0),
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
        GestureDetector(
          onTap: _selectDate,
          child: Card(
              margin: EdgeInsets.only(top: 5.0, left: 15.0, right: 15.0),
              child: Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text(Locale.get("Select date")), Text(_startDateTimestamp == null ? "#N/A" : timestamp2HourString(_startDateTimestamp))],
                ),
              )),
        ),
        if (_startDateTimestamp != null)
          GestureDetector(
            onTap: _selectDate,
            child: Card(
                margin: EdgeInsets.only(top: 5.0, left: 15.0, right: 15.0),
                child: Container(
                  padding: EdgeInsets.only(left: 10.0, right: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text(Locale.get("Duration (months)")), DropdownButton<int>(value: _signUpDurationMonths, icon: Icon(Icons.expand_more), iconSize: 24, elevation: 16, underline: Container(), onChanged: _durationPicked, items: List<DropdownMenuItem<int>>.generate(12, (int index) => DropdownMenuItem<int>(value: index + 1, child: Text((index + 1).toString()))).toList())],
                  ),
                )),
          ),
        if (_startDateTimestamp != null && _signUpDurationMonths != null)
          Card(
            margin: EdgeInsets.only(top: 5.0, left: 15.0, right: 15.0, bottom: 15.0),
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
                      return TextButton(onPressed: () => _calendarHourPressed(hour), child: Text("${hour.toString().padLeft(2, '0')}", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10.0)));
                    else {
                      String weekday = _weekdays[col - 1];
                      bool selected = _timeSlotSelections.containsKey(weekday) && _timeSlotSelections[weekday].contains(hour);

                      if (_weekdayEnabled[_weekdays[col - 1]])
                        return IconButton(onPressed: () => _calendarSlotPressed(weekday, hour), icon: selected ? Icon(Icons.check, color: Colors.green) : Icon(Icons.remove, color: Colors.grey), padding: EdgeInsets.zero);
                      else
                        return Icon(Icons.block, color: Colors.grey);
                    }
                  }
                })),
          ),
        Container(
          margin: EdgeInsets.only(top: 10.0, left: 30.0, right: 30.0),
          child: RaisedButton.icon(onPressed: _startDateTimestamp == null || _signUpDurationMonths == null ? null : _okClick, color: Colors.blueAccent, shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))), icon: Icon(Icons.checkroom, color: Colors.white), label: Text("OK", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
        ),
      ],
    );
  }

  void _selectDate() async {
    try {
      var now = DateTime.now();
      var oneMonthFromNow = now.add(Duration(days: 31));
      var res = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: now,
        lastDate: oneMonthFromNow,
      );
      setState(() {
        _startDateTimestamp = res.millisecondsSinceEpoch;
      });
    } catch (_) {
      return null;
    }
  }

  void _durationPicked(int months) async {
    setState(() {
      _signUpDurationMonths = months;
    });
  }

  void _calendarMasterButtonPressed() {
    int blockedCount = 0;
    for (String weekday in _weekdays) if (!_weekdayEnabled[weekday]) blockedCount++;

    bool completelySelected = _timeSlotSelections.length == _weekdays.length - blockedCount;
    for (String weekday in _weekdays)
      if (_weekdayEnabled[weekday]) if (completelySelected)
        completelySelected &= _timeSlotSelections[weekday].length == 24 - _CALENDAR_START_HOUR;
      else
        break;

    _timeSlotSelections.clear();
    if (!completelySelected) for (String weekday in _weekdays) if (_weekdayEnabled[weekday]) _timeSlotSelections[weekday] = List<int>.generate(24 - _CALENDAR_START_HOUR, (index) => _CALENDAR_START_HOUR + index).toSet();

    setState(() {});
  }

  void _calendarHourPressed(int hour) {
    int blockedCount = 0;
    for (String weekday in _weekdays) if (!_weekdayEnabled[weekday]) blockedCount++;

    bool hourCompletelySelected = _timeSlotSelections.length == _weekdays.length - blockedCount;
    for (String weekday in _weekdays)
      if (_weekdayEnabled[weekday]) if (hourCompletelySelected)
        hourCompletelySelected &= _timeSlotSelections.containsKey(weekday) && _timeSlotSelections[weekday].contains(hour);
      else
        break;

    if (hourCompletelySelected) {
      // remove
      for (String weekday in _weekdays)
        if (_weekdayEnabled[weekday]) {
          _timeSlotSelections[weekday].remove(hour);
          if (_timeSlotSelections[weekday].isEmpty) _timeSlotSelections.remove(weekday);
        }
    } else {
      // insert
      for (String weekday in _weekdays)
        if (_weekdayEnabled[weekday]) if (_timeSlotSelections.containsKey(weekday))
          _timeSlotSelections[weekday].add(hour);
        else
          _timeSlotSelections[weekday] = <int>[hour].toSet();
    }

    setState(() {});
  }

  void _calendarWeekdayPressed(final String weekday) {
    bool dayCompletelySelected = _timeSlotSelections.containsKey(weekday);
    for (int hour = _CALENDAR_START_HOUR; hour < 24; hour++)
      if (dayCompletelySelected)
        dayCompletelySelected &= _timeSlotSelections[weekday].contains(hour);
      else
        break;

    if (dayCompletelySelected) {
      // remove
      _timeSlotSelections.remove(weekday);
    } else {
      // insert
      if (_timeSlotSelections.containsKey(weekday))
        for (int hour = _CALENDAR_START_HOUR; hour < 24; hour++) _timeSlotSelections[weekday].add(hour);
      else
        _timeSlotSelections[weekday] = List<int>.generate(24 - _CALENDAR_START_HOUR, (index) => _CALENDAR_START_HOUR + index).toSet();
    }
    setState(() {});
  }

  void _calendarSlotPressed(String weekday, int hour) {
    bool selected = _timeSlotSelections.containsKey(weekday) && _timeSlotSelections[weekday].contains(hour);
    if (selected) {
      // remove
      _timeSlotSelections[weekday].remove(hour);
      if (_timeSlotSelections[weekday].isEmpty) _timeSlotSelections.remove(weekday);
    } else {
      // insert
      if (_timeSlotSelections.containsKey(weekday))
        _timeSlotSelections[weekday].add(hour);
      else
        _timeSlotSelections[weekday] = <int>[hour].toSet();
    }
    setState(() {});
  }

  void _onBackButtonPressed(BuildContext context) {
    Navigator.of(context).pop();
  }

  void _okClick() async {
    var fromDt = DateTime.fromMillisecondsSinceEpoch(_startDateTimestamp);
    var tillDt = DateTime(fromDt.year, fromDt.month + _signUpDurationMonths, fromDt.day, fromDt.hour, fromDt.minute, fromDt.second, fromDt.millisecond, fromDt.microsecond);
    var diffWeeks = tillDt.difference(fromDt).inDays /~ 7;

    for (String weekday in _timeSlotSelections.keys){
      // todo stuck here
    }
    Navigator.of(context).pop();
  }
}
