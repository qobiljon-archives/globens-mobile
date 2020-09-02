import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/services.dart';
import 'package:globens_flutter_client/utils/utils.dart';
import 'package:globens_flutter_client/utils/settings.dart';
import 'package:globens_flutter_client/widgets/individual%20businesspage%20detail%20screen.dart';
import 'business page editor modal view.dart';
import 'package:globens_flutter_client/entities/AppUser.dart';
import 'package:globens_flutter_client/entities/Product.dart';

//region productpageeditor widget
class ProductPageEditorWidget extends StatefulWidget {
  final businessPageId;

  const ProductPageEditorWidget(this.businessPageId);

  @override
  _ProductPageEditorWidgetState createState() => _ProductPageEditorWidgetState();
}

class _ProductPageEditorWidgetState extends State<ProductPageEditorWidget> {
  //region vars
  TextEditingController _titleTextController = TextEditingController();
  Uint8List _businessPageImageBytes;
  BuildContext _context;

  //endregion
  //region overrides
  @override
  Widget build(BuildContext context) {
    _context = this.context;
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          getTitleWidget("Create a new Product", textColor: Colors.black),
          Row(
            children: [
              Container(
                margin: EdgeInsets.all(10.0),
                child: GestureDetector(
                  onTap: showPhotoUploadOptions,
                  child: CircleAvatar(radius: 30.0, backgroundImage: _businessPageImageBytes != null ? MemoryImage(_businessPageImageBytes) : AssetImage('assets/business_page_placeholder.png')),
                ),
              ),
              Flexible(
                  child: TextField(
                controller: _titleTextController,
                decoration: InputDecoration(
                  labelText: "Title",
                  hintText: "Enter your title",
                ),
              )),
            ],
          ),
          RaisedButton(
            onPressed: createProductPressed,
            child: Text("Create"),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Spacer(),
          )
        ],
      ),
    );
  }

  //endregion

  //region utility method(s)
  void showPhotoUploadOptions() async {
    showModalBottomSheet(context: _context, builder: (_context) => PhotoSelectorWidget());
    Uint8List resultImageBytes = PhotoSelectorWidget.resultImageBytes == null ? (await rootBundle.load('assets/business_page_placeholder.png')) as Uint8List : PhotoSelectorWidget.resultImageBytes;
    setState(() {
      _businessPageImageBytes = resultImageBytes;
    });
  }

  //endregion

  //region onPressed method(s)
  void createProductPressed() async {
    bool success = await grpcCreateProduct(AppUser.sessionKey, widget.businessPageId, Product.create(_titleTextController.text, _businessPageImageBytes));

    if (success)
      Navigator.of(_context).pop();
    else
      Fluttertoast.showToast(msg: "Check your Internet connectivity!", toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.BOTTOM, timeInSecForIosWeb: 1, backgroundColor: Colors.grey, textColor: Colors.white, fontSize: 16.0);
  }

//endregion
}
//endregion
