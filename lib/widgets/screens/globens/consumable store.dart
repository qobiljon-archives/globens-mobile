import 'package:flutter/material.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Future<void> purchaseProduct() async{
    const Set<String> _kIds = {'globens_subscription'};
    final ProductDetailsResponse response = await InAppPurchaseConnection.instance.queryProductDetails(_kIds);
    if (response.notFoundIDs.isNotEmpty) {
       print("Item not found...");
       print(response.notFoundIDs);
       print(response.productDetails);

    } else {
      List<ProductDetails> products = response.productDetails;
      for (ProductDetails product in products) {
        print('${product.title}: ${product.description} (cost is ${product.price})');
      }
      // Example: purchasing the first available item.
      final PurchaseParam purchaseParam = PurchaseParam(productDetails: products[0]);
      InAppPurchaseConnection.instance.buyNonConsumable(purchaseParam: purchaseParam);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: () {
            purchaseProduct();
          },
          child: Text("Purchase a Product"),
        ),
      ),
    );
  }
}
