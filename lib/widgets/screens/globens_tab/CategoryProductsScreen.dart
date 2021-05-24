import 'package:globens_flutter_client/widgets/screens/JobApplicationCreatorScreen.dart';
import 'package:globens_flutter_client/widgets/screens/ProductViewerScreen.dart';
import 'package:globens_flutter_client/generated_protos/gb_service.pb.dart';
import 'package:globens_flutter_client/entities/ProductCategory.dart';
import 'package:globens_flutter_client/entities/JobApplication.dart';
import 'package:globens_flutter_client/entities/AppUser.dart';
import 'package:globens_flutter_client/entities/Product.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:globens_flutter_client/entities/Job.dart';
import 'package:globens_flutter_client/utils/Locale.dart';
import 'package:globens_flutter_client/utils/Utils.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';

class CategoryProductsScreen extends StatefulWidget {
  static const String route_name = '/category_products';

  @override
  _CategoryProductsScreenState createState() => _CategoryProductsScreenState();
}

class _CategoryProductsScreenState extends State<CategoryProductsScreen> {
  ProductCategory _category;
  List<Product> _products;
  List<Job> _vacantJobs;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _category = ModalRoute.of(context).settings.arguments as ProductCategory;

    grpcFetchNextKProducts(
            filterDetails: FilterDetails()
              ..publishedProductsOnly = true
              ..categoryId = _category.id
              ..businessPageId = -1)
        .then((tp) {
      bool success = tp.item1;
      List<Product> products = tp.item2;

      if (success) {
        setState(() {
          this._products = products;
        });
      }
    });

    grpcFetchVacantPositions(AppUser.sessionKey).then((tp) {
      bool success = tp.item1;
      List<Job> jobs = tp.item2;

      if (success) {
        setState(() {
          this._vacantJobs = jobs;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    int productRows = _products == null ? 1 : (_products.length / 2).ceil();
    int jobRows = _vacantJobs == null ? 1 : _vacantJobs.length;
    int rows = _category.isVacancyCategory ? jobRows : productRows;

    return Scaffold(
      backgroundColor: Color.fromRGBO(240, 242, 245, 1),
      appBar: AppBar(leading: IconButton(icon: Icon(Icons.arrow_back_ios, color: Colors.white), onPressed: () => Navigator.of(context).pop()), backgroundColor: Colors.blue, title: Text(Locale.get("Product category: ${Locale.REPLACE}", _category.name), overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.white))),
      body: Container(
        margin: EdgeInsets.only(top: 10),
        child: ListView.builder(
          itemCount: rows,
          itemBuilder: (BuildContext context, int index) => _getListViewItem(context, index),
        ),
      ),
    );
  }

  Widget _getListViewItem(BuildContext context, int index) {
    Size screenSize = MediaQuery.of(context).size;
    // products section
    if (_category.isVacancyCategory) {
      // products = vacancies
      if (_vacantJobs == null)
        return SpinKitFoldingCube(color: Colors.blue, size: 50.0);
      else if (_vacantJobs.length > 0)
        return _buildVacancyRow(context, _vacantJobs[index], screenSize);
      else
        return Container(); // empty vacancies
    } else {
      // products == products
      if (_products == null)
        return SpinKitFoldingCube(color: Colors.blue, size: 50.0);
      else if (_products.length > 0)
        return _buildProductRow(context, index, screenSize);
      else
        return Container(); // empty products
    }
  }

  InkWell _buildProductItem(BuildContext context, Product product, Size screenSize) {
    double iconWH = screenSize.width * 0.45;

    return InkWell(
      onTap: () => _onProductTap(context, product),
      child: Card(
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.white70, width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          color: Colors.white,
          elevation: 1.0,
          child: new Container(
            width: iconWH,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      topRight: Radius.circular(10.0),
                    ),
                    child: Image.memory(
                      product.pictureBlob,
                      fit: BoxFit.cover,
                      height: iconWH,
                    )),
                Container(
                  padding: EdgeInsets.all(5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 20.0,
                        child: Text(
                          product.name,
                          maxLines: 2,
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                        ),
                      ),
                      Text(
                        Locale.get("by ${Locale.REPLACE}", product.businessPage.title),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 12.0, color: Colors.blueGrey),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 5.0),
                        color: Colors.white,
                        child: Row(
                          children: [
                            RatingBarIndicator(
                              rating: product.stars,
                              direction: Axis.horizontal,
                              itemCount: 5,
                              itemSize: 15.0,
                              itemBuilder: (context, _) => Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                            ),
                            Text("(${product.reviewsCount})"),
                          ],
                        ),
                      ),
                      Text(
                        "${product.priceStr}",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0, color: Colors.deepOrange),
                      )
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }

  Row _buildProductRow(BuildContext context, int index, Size screenSize) {
    int productIndex = index * 2;

    Row row = Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [_buildProductItem(context, _products[productIndex], screenSize)]);
    if (productIndex < _products.length - 1) // two elements in one row
      row.children.add(_buildProductItem(context, _products[productIndex + 1], screenSize));

    return row;
  }

  Widget _buildVacancyRow(BuildContext context, Job job, Size screenSize) {
    return InkWell(
        onTap: () => _vacantPositionItemPressed(context, job),
        child: Card(
          margin: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.all(10.0),
                child: CircleAvatar(
                  radius: 20.0,
                  backgroundImage: AssetImage("assets/placeholder_vacancy.png"),
                ),
              ),
              Expanded(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(
                    shorten(job.title, 28, ellipsize: true),
                    style: TextStyle(fontSize: 20.0),
                  ),
                  Text(
                    'Posted by "${job.businessPage.title}"',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 12.0, fontStyle: FontStyle.italic),
                  )
                ]),
              )
            ],
          ),
        ));
  }

  void _vacantPositionItemPressed(BuildContext context, Job job) async {
    Tuple2<bool, List<JobApplication>> res = await grpcFetchJobApplications(AppUser.sessionKey, job);
    bool success = res.item1;
    List<JobApplication> jobApplications = res.item2;

    if (success) {
      bool alreadyApplied = false;
      for (JobApplication jobApplication in jobApplications)
        if (jobApplication.applicant.isMe) {
          alreadyApplied = true;
          break;
        }

      if (alreadyApplied)
        toast(Locale.get("You have already applied for this position!"));
      else {
        await Navigator.of(context).pushNamed(JobApplicationCreatorScreen.route_name, arguments: job);
        _updateDynamicPart();
      }
    } else {
      await AppUser.signOut();
      await Navigator.of(context).pushReplacementNamed('/');
    }
  }

  void _updateDynamicPart() async {}

  void _onBackButtonPressed() {
    Navigator.of(context).pop();
  }

  void _onProductTap(BuildContext context, Product product) async {
    await Navigator.of(context).pushNamed(ProductViewerScreen.route_name, arguments: product);
  }
}
