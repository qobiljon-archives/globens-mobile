import 'package:flutter/material.dart';
import 'package:globens_flutter_client/entities/Product.dart';
import 'package:globens_flutter_client/utils/utils.dart';
import 'package:globens_flutter_client/widgets/modal_views/HourSelectorModalView.dart';
import 'package:globens_flutter_client/widgets/screens/ProductPurchaseScreen.dart';

// PPOTSS - Product Purchase One Time Slot Selector Modal View

class PPOTSSModalView extends StatefulWidget {
  final Product product;

  PPOTSSModalView(this.product);

  @override
  _PPOTSSModalViewState createState() => _PPOTSSModalViewState();
}

class _PPOTSSModalViewState extends State<PPOTSSModalView> {
  static const _weekdays = ['MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT', 'SUN'];
  static const _calendarStartHour = 8;
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
              getTitleWidget("Time slot selector", textColor: Colors.black, margin: EdgeInsets.zero),
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
                  children: [Text("Select date"), Text(_selectedDayTimestamp == null ? "#N/A" : timestamp2HourString(_selectedDayTimestamp))],
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
                  children: [Text("Select hour"), Text(_selectedHour == null ? "#N/A" : "${_selectedHour.toString().padLeft(2, '0')}:00")],
                ),
              )),
        ),
        Container(
          margin: EdgeInsets.only(top: 10.0, left: 30.0, right: 30.0),
          child: RaisedButton.icon(onPressed: _selectedHour == null || _selectedDayTimestamp == null ? null : _purchaseClick, color: Colors.blueAccent, shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))), icon: Icon(Icons.checkroom, color: Colors.white), label: Text("MAKE PAYMENT ${widget.product.priceStr}", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
        ),
      ],
    );
  }

  void _selectDate(String key) async {
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
        _selectedDayTimestamp = res.millisecondsSinceEpoch;
      });
    } catch (_) {
      return null;
    }
  }

  void _selectHour() async {
    await showModalBottomSheet(context: context, builder: (context) => HourSelectorModalView());
    var res = HourSelectorModalView.getSelectedHour;
    if (res != null)
      setState(() {
        _selectedHour = res;
      });
  }

  void _purchaseClick() async {
    await Navigator.of(context).pushNamed(ProductPurchaseScreen.route_name, arguments: widget.product);
  }

  void _onBackButtonPressed(BuildContext context) {
    Navigator.of(context).pop();
  }

  void _selectTimeSlotsPressed(BuildContext context) async {
    Navigator.of(context).pop();
  }
}