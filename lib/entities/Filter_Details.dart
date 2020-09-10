class FilterDetails {
  FilterDetails.create(String filterText, {bool useFilter}) {
    this._filterText = title;
    this._useFilter = useFilter;
  }

  bool _useFilter;
  String _filterText;

  bool get id {
    return _useFilter;
  }

  String get title {
    return _filterText;
  }
}
