import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:globens_flutter_client/entities/AppUser.dart';
import 'package:globens_flutter_client/utils/Locale.dart';

class CountrySelectionScreen extends StatefulWidget {

  static const String route_name = '/country_selection_screen';

  @override
  State<StatefulWidget> createState() => _CountrySelectionState();

}

class _CountrySelectionState extends State<CountrySelectionScreen>{
  var selectedCountry = "";

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final prefCountry = AppUser.userPrefs.getString("country");
    selectedCountry = prefCountry == null ? "Korea" : prefCountry;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Locale.get("Country")),
      ),
      body: _buildCountriesList(["Russia","Uzbekistan","Kazakhstan","Korea", "China", "Malaysia", "Japan", "Germany","Turkey", "Italy", "USA", "Canada", "Australia"]),
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

  Widget _buildCountryRow(String country) {
    final alreadySelected = country == selectedCountry;
    return ListTile(
      onTap: () => _onCountryPressed(country),
      title: Text(country,
          style: TextStyle(fontSize: 18.0)
      ),
      trailing: Icon(
        alreadySelected ? Icons.check : null,
        color: alreadySelected ? Colors.black : null,
      ),
    );
  }

  void _onCountryPressed(String country) async {
    await AppUser.userPrefs.setString("country", country);
    Navigator.of(context).pop();
  }
}
