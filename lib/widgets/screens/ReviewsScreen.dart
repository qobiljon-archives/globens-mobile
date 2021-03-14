import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:globens_flutter_client/entities/AppUser.dart';
import 'package:globens_flutter_client/entities/Review.dart';
import 'package:globens_flutter_client/utils/Locale.dart';
import 'package:globens_flutter_client/utils/Utils.dart';

class ReviewsScreen extends StatefulWidget {
  static const String route_name = '/reviews_screen';

  @override
  State<StatefulWidget> createState() => _ReviewsScreenState();
}

class _ReviewsScreenState extends State<ReviewsScreen> {
  var _reviews = <Review>[];
  int _productId;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context).settings.arguments as Map<String, int>;
    _productId = args['product_id'];

    grpcFetchProductReviews(AppUser.sessionKey, _productId).then((tp) {
      bool isSuccess = tp.item1;
      if (isSuccess) {
        setState(() {
          _reviews = tp.item2;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Locale.get("Review")),
      ),
      body: _buildReviews(),
    );
  }

  Widget _buildReviews() {
    return ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          return _buildRow(_reviews[i]);
        });
  }

  Widget _buildRow(Review review) {
    return ListTile(
      title: Text(review.review),
    );
  }
}
