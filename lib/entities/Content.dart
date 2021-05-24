class Content {
  // region Variables
  int _id;
  String _title;
  String _fileId;
  String _url;

  // endregion

  Content.create(String title, String fileId, String url, {int id}) {
    this._id = id;
    this._title = title;
    this._fileId = fileId;
    this._url = url;
  }

  // region Getters

  int get id => _id;

  String get title => _title;

  String get fileId => _fileId;

  String get url => _url;
// endregion
}
