

class ProductType{

  int _id;
  String _name;

  ProductType.create(int  id,  String name){
    this._id = id;
    this._name  = name;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  int get id => _id;

  set id(int value) {
    _id = value;
  }
}