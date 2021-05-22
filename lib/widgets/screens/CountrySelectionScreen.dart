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

class _CountrySelectionState extends State<CountrySelectionScreen>{
  var selectedCountry = "";

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
      appBar: AppBar(
        title: Text(Locale.get("Country")),
      ),
      body: _buildCountriesList(CountryHelper.countries.keys.toList()),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  Widget _buildCountriesList(List<String> countryList) {
    return ListView.separated(
        separatorBuilder: (context, index) => Divider(
          height: 1,
          color: Colors.black12,
        ),
        itemCount: countryList.length,
        itemBuilder: (context, index) => _buildCountryRow(countryList[index]),
    );
  }

  Widget _buildCountryRow(String countryCode) {
    final alreadySelected = countryCode == selectedCountry;
    return ListTile(
      onTap: () => _onCountryPressed(countryCode),
      title: Text(CountryHelper.countryName(countryCode),
          style: TextStyle(fontSize: 18.0)
      ),
      trailing: Icon(
        alreadySelected ? Icons.check : null,
        color: alreadySelected ? Colors.black : null,
      ),
    );
  }

  void _onCountryPressed(String country) async {
    // await AppUser.userPrefs.setString("country", country);
    CountrySelectionScreen.resultCountryCode = country;
    Navigator.of(context).pop();
  }
}
