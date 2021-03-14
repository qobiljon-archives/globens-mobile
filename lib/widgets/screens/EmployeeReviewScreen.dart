import 'package:flutter/material.dart';
import 'package:globens_flutter_client/entities/AppUser.dart';
import 'package:globens_flutter_client/utils/Locale.dart';
import 'package:globens_flutter_client/utils/Utils.dart';

/*
*  Usage:
*   await Navigator.of(context).pushNamed(EmployeeReviewScreen.route_name, arguments: {'business_page_id': businessPageId, 'employee_id': id});
* */
class EmployeeReviewScreen extends StatefulWidget {
  static const String route_name = '/employee_review_screen';

  @override
  State<StatefulWidget> createState() => _EmployeeReviewScreenState();
}

class _EmployeeReviewScreenState extends State<EmployeeReviewScreen> {
  final _reviewTitleController = TextEditingController();
  final _reviewController = TextEditingController();

  int _businessPageId;
  int _employeeId;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context).settings.arguments as Map<String, int>;
    _businessPageId = args['business_page_id'];
    _employeeId = args['employee_id'];
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Locale.get("Review")),
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: ListView(
          padding: EdgeInsets.only(left: 16.0, right: 16.0, bottom: 30.0 + MediaQuery.of(context).viewInsets.bottom),
          shrinkWrap: true,
          children: [
            SizedBox(height: 32.0),
            TextFormField(
              controller: _reviewTitleController,
              keyboardType: TextInputType.text,
              maxLength: 120,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: Locale.get("Title"),
              ),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: _reviewController,
              keyboardType: TextInputType.multiline,
              maxLines: 5,
              maxLength: 500,
              style: TextStyle(fontSize: 16.0),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: Locale.get("Review (Optional)"),
              ),
            ),
            Container(margin: EdgeInsets.only(top: 20.0, left: 30.0, right: 30.0), child: RaisedButton.icon(onPressed: _postReview, color: Colors.blueAccent, shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))), icon: Icon(Icons.send, color: Colors.white), label: Text(Locale.get("Submit"), style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)))),
          ],
        ),
      ),
    );
  }

  void _postReview() async {
    final reviewTitle = _reviewTitleController.text.toString();
    final review = _reviewController.text.toString();
    bool isSuccess = await grpcSubmitEmployeeReview(AppUser.sessionKey, _businessPageId, _employeeId, review);
    if (isSuccess) {
      await toast(Locale.get("Submitted"));
      Navigator.of(context).pop();
    } else {
      await toast(Locale.get("Try again later"));
    }
  }
}
