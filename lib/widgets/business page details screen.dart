import 'package:globens_flutter_client/entities/Vacancy.dart';
import 'package:globens_flutter_client/utils/settings.dart';
import 'package:globens_flutter_client/widgets/product%20editor%20modal%20view.dart';
import 'package:globens_flutter_client/entities/BusinessPage.dart';
import 'package:globens_flutter_client/entities/AppUser.dart';
import 'package:globens_flutter_client/entities/Product.dart';
import 'package:globens_flutter_client/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'job details screen.dart';
import 'job editor modal view.dart';

class BusinessPageDetailsScreen extends StatefulWidget {
  final BusinessPage _businessPage;

  BusinessPageDetailsScreen(this._businessPage);

  @override
  _BusinessPageDetailsScreenState createState() => _BusinessPageDetailsScreenState();
}

class _BusinessPageDetailsScreenState extends State<BusinessPageDetailsScreen> {
  List<Widget> _header = [];
  List<Product> _products = [];
  List<Vacancy> _vacancies = [];
  List<Widget> _footer = [];

  @override
  void initState() {
    super.initState();

    // 1. static part : set up common part of header and footer
    _header = [
      Row(
        children: [
          IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () => _onBackButtonPressed(context),
          ),
          Text(
            "${widget._businessPage.title}",
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.blue),
          ),
        ],
      ),
    ];
    _footer = [
      Container(
        width: double.maxFinite,
        child: RaisedButton(
          onPressed: () => _onCreateProductPressed(context),
          child: Text("Create your product"),
        ),
      ),
    ];

    // 2. dynamic part : change footer according to user's role in business page
    if (widget._businessPage.role == VacancyRole.BUSINESS_OWNER)
      _footer.add(Container(
        width: double.maxFinite,
        child: RaisedButton(
          onPressed: () => _onCreateVacancyPressed(context),
          child: Text("Create a new vacancy"),
        ),
      ));

    // 3. dynamic part : change body (i.e., products, vacancies, employees) according to user's role in business page
    grpcFetchProducts(AppUser.sessionKey, widget._businessPage.id).then((tuple) {
      bool success = tuple.item1;
      List<Product> products = tuple.item2;
      if (success)
        setState(() {
          _products = products;
        });
      else {
        AppUser.signOut();
        Navigator.pushReplacementNamed(context, 'root');
      }
    });
    grpcFetchVacancies(AppUser.sessionKey, widget._businessPage.id).then((tuple) {
      bool success = tuple.item1;
      List<Vacancy> vacancies = tuple.item2;
      if (success)
        setState(() {
          _vacancies = vacancies;
        });
      else {
        AppUser.signOut();
        Navigator.pushReplacementNamed(context, 'root');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView.builder(
          itemCount: _header.length + _products.length + _vacancies.length + _footer.length,
          itemBuilder: (BuildContext context, int index) => getListViewItem(context, index),
        ),
      ),
    );
  }

  Widget getListViewItem(BuildContext context, int index) {
    if (index >= _header.length + _products.length + _vacancies.length) {
      // footer section
      index -= _header.length + _products.length + _vacancies.length;
      return _footer[index];
    } else if (index >= _header.length + _products.length) {
      // vacancies section
      index -= _header.length + _products.length;
      return buildVacancyItem(context, index);
    } else if (index >= _header.length) {
      // products section
      index -= _header.length;
      return buildProductItem(context, index);
    } else {
      // header section
      return _header[index];
    }
  }

  Widget buildProductItem(BuildContext context, int index) {
    Row productRow = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () => _onProductPressed(context),
          child: Container(
            margin: EdgeInsets.only(top: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 10.0),
                  child: CircleAvatar(
                    radius: 20.0,
                    backgroundImage: MemoryImage(_products[index].pictureBlob),
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(left: 10.0),
                    child: Text(
                      "${_products[index].name}",
                      overflow: TextOverflow.clip,
                      style: TextStyle(fontSize: 20.0),
                    )),
              ],
            ),
          ),
        ),
      ],
    );

    if (index == 0)
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [getTitleWidget("Products", textColor: Colors.black), productRow],
      );
    else
      return productRow;
  }

  Widget buildVacancyItem(BuildContext context, int index) {
    Row vacancyRow = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () => _onVacancyPressed(context, _vacancies[index], widget._businessPage),
          child: Text(
            "${_vacancies[index].title}",
            overflow: TextOverflow.clip,
            style: TextStyle(fontSize: 20.0),
          ),
        ),
      ],
    );

    if (index == 0)
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [getTitleWidget("Vacancies", textColor: Colors.black), vacancyRow],
      );
    else
      return vacancyRow;
  }

  void _onCreateProductPressed(BuildContext context) async {
    await showModalBottomSheet(context: context, builder: (_context) => ProductPageEditorScreen(widget._businessPage));
    grpcFetchProducts(AppUser.sessionKey, widget._businessPage.id).then((tuple) {
      bool success = tuple.item1;
      List<Product> products = tuple.item2;
      if (success)
        setState(() {
          _products = products;
        });
      else {
        AppUser.signOut();
        Navigator.pushReplacementNamed(context, 'root');
      }
    });
  }

  void _onBackButtonPressed(BuildContext context) {
    Navigator.pop(context);
  }

  void _onCreateVacancyPressed(BuildContext context) async {
    await showModalBottomSheet(context: context, builder: (_context) => JobPageEditorModalView(widget._businessPage));
    grpcFetchVacancies(AppUser.sessionKey, widget._businessPage.id).then((tuple) {
      bool success = tuple.item1;
      List<Vacancy> vacancies = tuple.item2;
      if (success)
        setState(() {
          _vacancies = vacancies;
        });
      else {
        AppUser.signOut();
        Navigator.pushReplacementNamed(context, 'root');
      }
    });
  }

  void _onProductPressed(BuildContext context) {
    // todo open product details modal view
  }

  void _onVacancyPressed(BuildContext context, Vacancy vacancy, BusinessPage businessPage) {
    Navigator.push(context, MaterialPageRoute(builder: (_context) => JobApplicationScreen(vacancy, businessPage)));
  }
}
