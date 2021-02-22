import 'package:globens_flutter_client/entities/AppUser.dart';
import 'package:globens_flutter_client/entities/Product.dart';
import 'package:iamport_flutter/model/payment_data.dart';
import 'package:iamport_flutter/iamport_payment.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductPurchaseScreen extends StatefulWidget {
  static const String route_name = '/product_purchase';

  @override
  _ProductPurchaseScreenState createState() => _ProductPurchaseScreenState();
}

class _ProductPurchaseScreenState extends State<ProductPurchaseScreen> {
  Product _product;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _product = ModalRoute.of(context).settings.arguments as Product;
  }

  @override
  Widget build(BuildContext context) {
    if (_product == null)
      return Container();
    else
      return IamportPayment(
        appBar: new AppBar(
          title: new Text("Purchase ${_product.name} (${_product.priceStr})"),
        ),
        /* 웹뷰 로딩 컴포넌트 */
        initialChild: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/globens_icon.png'),
                Container(
                  padding: EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 0.0),
                  child: Text('Please wait...', style: TextStyle(fontSize: 20.0)),
                ),
              ],
            ),
          ),
        ),
        /* [필수입력] 가맹점 식별코드 */
        userCode: 'iamport',
        /* [필수입력] 결제 데이터 */
        data: PaymentData.fromJson({
          'pg': 'html5_inicis',
          'payMethod': 'card',
          'name': _product.name,
          'merchantUid': 'mid_${DateTime.now().millisecondsSinceEpoch}',
          'amount': _product.price.toInt(),
          'buyerName': AppUser.displayName,
          'buyerTel': '01012345678',
          'buyerEmail': AppUser.email,
          'buyerAddr': '서울시 강남구 신사동 661-16',
          'buyerPostcode': '06018',
          'appScheme': 'example',
          'display': {
            'cardQuota': [2, 3] //결제창 UI 내 할부개월수 제한
          }
        }),
        callback: purchaseResultReceived,
      );
  }

  void purchaseResultReceived(Map<String, String> result) {
    Navigator.of(context).pop();
  }
}
