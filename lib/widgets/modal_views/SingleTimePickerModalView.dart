import 'package:globens_flutter_client/widgets/modal_views/HourSelectorModalView.dart';
import 'package:globens_flutter_client/widgets/screens/ProductPurchaseScreen.dart';
import 'package:globens_flutter_client/entities/Product.dart';
import 'package:globens_flutter_client/utils/Locale.dart';
import 'package:globens_flutter_client/utils/Utils.dart';
import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';

class SingleTimePickerModalView extends StatefulWidget {
  final Product product;
  final TimeSlot timeSlot;

  SingleTimePickerModalView(this.product, this.timeSlot);

  @override
  _SingleTimePickerModalViewState createState() => _SingleTimePickerModalViewState();
}

class _SingleTimePickerModalViewState extends State<SingleTimePickerModalView> {
  int _selectedDayTimestamp;
  int _selectedHour;

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
          onTap: () => _selectDate('from'),
          child: Card(
              margin: EdgeInsets.only(top: 10.0, left: 30.0, right: 30.0),
              child: Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text(Locale.get("Select date")), Text(_selectedDayTimestamp == null ? "#N/A" : timestamp2HourString(_selectedDayTimestamp))],
                ),
              )),
        ),
        GestureDetector(
          onTap: () => _selectHour(),
          child: Card(
              margin: EdgeInsets.only(top: 10.0, left: 30.0, right: 30.0),
              child: Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text(Locale.get("Select hour")), Text(_selectedHour == null ? "#N/A" : "${_selectedHour.toString().padLeft(2, '0')}:00")],
                ),
              )),
        ),
        Container(
          margin: EdgeInsets.only(top: 10.0, left: 30.0, right: 30.0),
          child: RaisedButton.icon(onPressed: _selectedDayTimestamp == null || _selectedHour == null ? null : _okClick, color: Colors.blueAccent, shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))), icon: Icon(Icons.checkroom, color: Colors.white), label: Text("OK", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
        ),
      ],
    );
  }

  void _selectDate(String key) async {
    try {
      var now = DateTime.now();
      var oneMonthFromNow = DateTime(now.year, now.month + 1, now.day, now.hour, now.minute, now.second, now.millisecond, now.microsecond);
      var res = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: now,
        lastDate: oneMonthFromNow,
      );
      setState(() {
        _selectedDayTimestamp = res.millisecondsSinceEpoch;
      });
    } catch (_) {
      return null;
    }
  }

  void _selectHour() async {
    await showModalBottomSheet(context: context, builder: (context) => HourSelectorModalView());
    var res = HourSelectorModalView.getSelectedHour;
    if (res != null) {
      setState(() {
        _selectedHour = res;
      });
    }
    if (![_selectedDayTimestamp, _selectedHour].contains(null)) {
      var dt = DateTime.fromMillisecondsSinceEpoch(_selectedDayTimestamp);
      dt = DateTime(dt.year, dt.month, dt.day, _selectedHour, 0, 0, 0, 0);

      widget.timeSlot.startTimestamp = dt.millisecondsSinceEpoch;
      widget.timeSlot.size = TimeSlotSize.SIXTY_MINUTES;
    }
  }

  void _onBackButtonPressed(BuildContext context) {
    Navigator.of(context).pop();
  }

  void _okClick() async {
    Navigator.of(context).pop();
  }
}
