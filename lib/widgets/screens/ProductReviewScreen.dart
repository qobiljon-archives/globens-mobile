import 'package:flutter/material.dart';
import 'package:globens_flutter_client/utils/Locale.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:globens_flutter_client/utils/Utils.dart';

class ProductReviewScreen extends StatefulWidget {
  static const String route_name = '/product_review_screen';

  @override
  State<StatefulWidget> createState() => _ProductReviewState();
}

class _ProductReviewState extends State<ProductReviewScreen> {
  var _rating = 0.0;
  final _reviewTitleController = TextEditingController();
  final _reviewController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _rating = 0.0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Locale.get("Review")),
        actions: [IconButton(icon: Icon(Icons.done), onPressed: _postReview)],
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
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  _rating = rating;
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
          ],
        ),
      ),
    );
  }

  void _postReview() {
    final reviewTitle = _reviewTitleController.text.toString();
    final review = _reviewController.text.toString();
    toast("Rating: $_rating, \ntitle: $reviewTitle, \nreview: $review");
  }
}
