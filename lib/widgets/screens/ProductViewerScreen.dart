import 'package:globens_flutter_client/widgets/modal_views/SingleTimePickerModalView.dart';
import 'package:globens_flutter_client/widgets/modal_views/WeeklyTimePickerModalView.dart';
import 'package:globens_flutter_client/widgets/screens/ProductPurchaseScreen.dart';
import 'package:globens_flutter_client/widgets/screens/ProductReviewScreen.dart';
import 'package:globens_flutter_client/generated_protos/gb_service.pb.dart';
import 'package:globens_flutter_client/widgets/screens/ReviewsScreen.dart';
import 'package:globens_flutter_client/entities/Product.dart';
import 'package:globens_flutter_client/utils/Locale.dart';
import 'package:globens_flutter_client/utils/Utils.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:globens_flutter_client/widgets/screens/ViewProductContentScreen.dart';

class ProductViewerScreen extends StatefulWidget {
  static const String route_name = '/product_viewer_screen';

  ProductViewerScreen();

  @override
  _ProductViewerScreenState createState() => _ProductViewerScreenState();
}

class _ProductViewerScreenState extends State<ProductViewerScreen> {
  Product _product;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _product = ModalRoute.of(context).settings.arguments as Product;
  }

  @override
  Widget build(BuildContext context) {
    bool isFile = _product.productType == ProductDeliveryType.FILE_DOWNLOADABLE || _product.productType == ProductDeliveryType.FILE_STREAMED;
    bool isSchedule = _product.productType == ProductDeliveryType.SCHEDULED_FACE_TO_FACE || _product.productType == ProductDeliveryType.SCHEDULED_ONLINE_CALL;

    return Scaffold(
        backgroundColor: Color.fromRGBO(240, 242, 245, 1),
        body: SafeArea(
          child: ListView(
            padding: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 30.0 + MediaQuery.of(context).viewInsets.bottom),
            shrinkWrap: true,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    onPressed: _onBackButtonPressed,
                  ),
                  getTitleWidget(Locale.get('Product details'), textColor: Colors.black, margin: EdgeInsets.all(0))
                ],
              ),
              getSectionSplitter(Locale.get("Basic information")),
              Card(
                  color: Colors.white,
                  margin: EdgeInsets.zero,
                  elevation: 1.0,
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                              child: AspectRatio(aspectRatio: 1, child: Image.memory(_product.pictureBlob, fit: BoxFit.cover)),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 10.0, top: 10.0),
                              padding: EdgeInsets.only(left: 5.0, right: 5.0),
                              color: Colors.white,
                              child: Text(
                                _product.priceStr,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0, color: Colors.deepOrange),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10.0, top: 10.0),
                          color: Colors.white,
                          child: Row(
                            children: [
                              RatingBarIndicator(
                                rating: _product.stars,
                                direction: Axis.horizontal,
                                itemCount: 5,
                                itemSize: 15.0,
                                itemBuilder: (context, _) => Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                              ),
                              Text("(${_product.reviewsCount})"),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Container(
                            height: 20.0,
                            margin: EdgeInsets.only(top: 10, bottom: 10),
                            child: Text(_product.name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0, color: Colors.blueAccent)),
                          ),
                        )
                      ],
                    ),
                  )),
              Card(
                  margin: EdgeInsets.only(top: 10.0),
                  child: Container(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        _product.description,
                        maxLines: 10,
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0, color: Colors.blueAccent),
                      ))),
              if (isSchedule)
                Container(
                    margin: EdgeInsets.only(top: 20.0, left: 30.0, right: 30.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        RaisedButton.icon(onPressed: _openTryTimeSlotSelector, color: Colors.blueAccent, shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))), icon: Icon(Icons.checkroom, color: Colors.white), label: Text(Locale.get("Try"), style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
                        RaisedButton.icon(onPressed: _openSignUpTimeSlotSelector, color: Colors.blueAccent, shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))), icon: Icon(Icons.app_registration, color: Colors.white), label: Text(Locale.get("Sign up"), style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
                      ],
                    )),
              if (isFile) Container(margin: EdgeInsets.only(top: 20.0, left: 30.0, right: 30.0), child: RaisedButton.icon(onPressed: _purchaseProduct, color: Colors.blueAccent, shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))), icon: Icon(Icons.shopping_bag, color: Colors.white), label: Text(Locale.get("Purchase"), style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)))),
              if (isFile) Container(margin: EdgeInsets.only(top: 20.0, left: 30.0, right: 30.0), child: RaisedButton.icon(onPressed: _viewProductPressed, color: Colors.blueAccent, shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))), icon: Icon(Icons.play_circle_fill, color: Colors.white), label: Text("VIEW/DOWNLOAD  PRODUCT", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)))),
              Container(margin: EdgeInsets.only(top: 20.0, left: 30.0, right: 30.0), child: RaisedButton.icon(onPressed: _openProductReview, color: Colors.blueAccent, shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))), icon: Icon(Icons.rate_review, color: Colors.white), label: Text(Locale.get("Review"), style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)))),
              Container(margin: EdgeInsets.only(top: 20.0, left: 30.0, right: 30.0), child: RaisedButton.icon(onPressed: _openProductReviews, color: Colors.blueAccent, shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))), icon: Icon(Icons.rate_review, color: Colors.white), label: Text(Locale.get("Ratings and Reviews"), style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)))),
            ],
          ),
        ));
  }

  void _onBackButtonPressed() {
    Navigator.of(context).pop();
  }

  void _openTryTimeSlotSelector() async {
    var timeSlot = TimeSlot();
    await showModalBottomSheet(context: context, builder: (context) => SingleTimePickerModalView(_product, timeSlot));
  }

  void _openSignUpTimeSlotSelector() async {
    var timeSlots = <TimeSlot>[];
    await showModalBottomSheet(context: context, builder: (context) => WeeklyTimePickerModalView(_product, timeSlots));
    // todo purchase here
  }

  void _purchaseProduct() async {
    await Navigator.of(context).pushNamed(ProductPurchaseScreen.route_name, arguments: _product);
  }

  void _viewProductPressed() async {
    // todo show product.contents
    Navigator.push(context, MaterialPageRoute(builder: (context) => ViewProductContentScreen(_product)));
  }

  void _openProductReview() async {
    await Navigator.of(context).pushNamed(ProductReviewScreen.route_name, arguments: _product);
  }

  void _openProductReviews() async {
    await Navigator.of(context).pushNamed(ReviewsScreen.route_name, arguments: {'product_id': _product.id});
  }
}
