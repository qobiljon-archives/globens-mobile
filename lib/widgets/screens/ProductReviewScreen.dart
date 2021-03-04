import 'package:flutter/material.dart';
import 'package:globens_flutter_client/entities/AppUser.dart';
import 'package:globens_flutter_client/generated_protos/gb_service.pb.dart';
import 'package:globens_flutter_client/utils/Locale.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:globens_flutter_client/utils/Utils.dart';
import 'package:globens_flutter_client/entities/Product.dart';
import 'package:tuple/tuple.dart';

class ProductReviewScreen extends StatefulWidget {
  static const String route_name = '/product_review_screen';

  @override
  State<StatefulWidget> createState() => _ProductReviewState();
}

class _ProductReviewState extends State<ProductReviewScreen> {
  var _stars = 0;
  final _reviewTitleController = TextEditingController();
  final _reviewController = TextEditingController();

  Product _product;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _product = ModalRoute.of(context).settings.arguments as Product;
  }

  @override
  void initState() {
    super.initState();
    _stars = 0;
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
            Center(
              child: RatingBar.builder(
                direction: Axis.horizontal,
                allowHalfRating: false,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  _stars = rating.toInt();
                },
              ),
            ),
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
    bool isSuccess = await grpcSubmitProductReview(AppUser.sessionKey, _product, _stars, review);
    if (isSuccess) {
      await toast(Locale.get("Submitted"));
      Navigator.of(context).pop();
    } else {
      await toast(Locale.get("Try again later"));
    }
  }
}
