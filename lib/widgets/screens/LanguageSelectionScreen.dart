import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:globens_flutter_client/entities/AppUser.dart';
import 'package:globens_flutter_client/utils/Locale.dart';

class LanguageSelectionScreen extends StatefulWidget {

  static const String route_name = '/language_selection_screen';

  @override
  State<StatefulWidget> createState() => _LanguageSelectionState();
}


class _LanguageSelectionState extends State<LanguageSelectionScreen> {
  var selectedLanguage = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final prefLanguage = AppUser.userPrefs.getInt("language");
    selectedLanguage = prefLanguage == null ? -1 : prefLanguage;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Locale.get("Select language")),
      ),
      body: _buildLanguagesList(),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  Widget _buildLanguagesList() {
    return ListView.separated(
      separatorBuilder: (context, index) =>
          Divider(
            height: 1,
            color: Colors.black12,
          ),
      itemCount: 4,
      itemBuilder: (context, index) => _buildLanguageRow(index-1),
    );
  }

  Widget _buildLanguageRow(int languageCode) {
    final alreadySelected = languageCode == selectedLanguage;
    return ListTile(
      onTap: () => _onLanguagePressed(languageCode),
      title: Text(Language.languagePrettyStringFromInt(languageCode),
          style: TextStyle(fontSize: 18.0)
      ),
      trailing: Icon(
        alreadySelected ? Icons.check : null,
        color: alreadySelected ? Colors.black : null,
      ),
    );
  }

  void _onLanguagePressed(int languageCode) async {
    Locale.languageCode = languageCode;
    await AppUser.userPrefs.setInt("language", languageCode);
    Navigator.of(context).pop();
  }
}