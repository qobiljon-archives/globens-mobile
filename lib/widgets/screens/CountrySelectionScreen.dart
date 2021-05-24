import 'package:globens_flutter_client/utils/CountryHelper.dart';
import 'package:globens_flutter_client/utils/Locale.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CountrySelectionScreen extends StatefulWidget {
  static const String route_name = '/country_selection_screen';
  static String resultCountryCode;

  @override
  State<StatefulWidget> createState() => _CountrySelectionState();
}

class _CountrySelectionState extends State<CountrySelectionScreen> {
  var selectedCountry;
  var countries = CountryHelper.countries.keys.toList();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    setState(() {
      selectedCountry = ModalRoute.of(context).settings.arguments as String;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: IconButton(icon: Icon(Icons.arrow_back_ios, color: Colors.white), onPressed: () => Navigator.of(context).pop()), backgroundColor: Colors.blue, title: Flexible(child: Text(Locale.get("Country"), overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.white)))),
      body: ListView.separated(
        separatorBuilder: (context, index) => Divider(
          height: 1,
          color: Colors.black12,
        ),
        itemCount: countries.length,
        itemBuilder: (context, index) => _buildCountryRow(countries[index]),
      ),
    );
  }

  Widget _buildCountryRow(String countryCode) {
    final isSelected = countryCode == selectedCountry;
    return ListTile(
      onTap: () => _onCountryPressed(countryCode),
      title: Text(CountryHelper.countryName(countryCode), style: TextStyle(fontSize: 18.0)),
      trailing: Icon(
        isSelected ? Icons.check : null,
        color: isSelected ? Colors.black : null,
      ),
    );
  }

  void _onCountryPressed(String country) async {
    CountrySelectionScreen.resultCountryCode = country;
    Navigator.of(context).pop();
  }
}
