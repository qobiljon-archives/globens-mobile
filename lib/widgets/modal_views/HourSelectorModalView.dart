import 'package:cupertino_radio_choice/cupertino_radio_choice.dart';
import 'package:globens_flutter_client/utils/utils.dart';
import 'package:flutter/material.dart';

class HourSelectorModalView extends StatefulWidget {
  HourSelectorModalView() {
    _HourSelectorModalViewState._selectedHour = null;
  }

  static int get getSelectedHour {
    return _HourSelectorModalViewState._selectedHour;
  }

  @override
  _HourSelectorModalViewState createState() => _HourSelectorModalViewState();
}

class _HourSelectorModalViewState extends State<HourSelectorModalView> {
  static int _selectedHour;
  static const int cellsCount = 24;

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Container(margin: EdgeInsets.only(top: 20.0, right: 30.0), child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: () => _onBackButtonPressed(context)), getTitleWidget("Hour selector", textColor: Colors.black, margin: EdgeInsets.zero)])),
      Card(
        margin: EdgeInsets.only(top: 5.0, left: 15.0, right: 15.0),
        child: Container(
          child: GridView.count(
              primary: false,
              shrinkWrap: true,
              crossAxisSpacing: 0,
              mainAxisSpacing: 0,
              crossAxisCount: 4,
              children: List<Widget>.generate(cellsCount, (index) {
                return Container(margin: EdgeInsets.all(2.0), child: RaisedButton(onPressed: () => _hourClick(index), shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))), color: index == _selectedHour ? Colors.blueAccent : Colors.white, child: Text("${index.toString().padLeft(2, '0')}:00")));
              })),
        ),
      ),
    ]);
  }

  void _hourClick(int index) async {
    setState(() {
      _selectedHour = index;
    });
  }

  void _onBackButtonPressed(BuildContext context) {
    Navigator.of(context).pop();
  }
}

/*
Card(
          margin: EdgeInsets.only(top: 10.0, left: 30.0, right: 30.0),
          child: Container(
            child: GridView.count(
                primary: false,
                shrinkWrap: true,
                crossAxisSpacing: 0,
                mainAxisSpacing: 0,
                crossAxisCount: 4,
                children: List<Widget>.generate(24, (index) {
                  return RaisedButton(
                    onPressed: () {},
                    color: Colors.blueAccent,
                    child: Text("${index.toString().padLeft(2, '0')}:00", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  );
                })),
          ),
        ),
* */
