import 'dart:io';
import 'package:globens_flutter_client/entities/AppUser.dart';
import 'package:googleapis/drive/v3.dart' as ga;
import 'package:googleapis_auth/auth_io.dart' as ga;
import 'package:tuple/tuple.dart';

class DriveHelper {
  static final _credentials = ga.ServiceAccountCredentials.fromJson({
    "type": "service_account",
    "project_id": "globens-uzbekistan",
    "private_key_id": "5597d0f483a16a5cd20bcdb2e0290f4762fa68b1",
    "private_key":
        "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQCU6546/mQrBwuO\nVSqG/nCx2mEF9/i5cUZzKTT2QFch42UkTp5WpPAXPsTO3bAv3giPVwvyqY6FiGiR\niU3JPgpj030zvetxWEHSmzJCUf7m8ov9fzROWOg2CDZYyc+HtBvZ1WjmvKQcmB6K\nAIDWxeC0xbhOVQ2CeevScLEUFWsLmT7oPtTXF8SVnuRfRE28NjtgOpV9wtv5CvUk\nbCnh0HF4A3EY9cCJMCPwltBldI9OonSeUp1UClD/ddnX7niL6OEms+5qO5tGVB3L\nNOvcQQg+r3gEAh0T9da1WcICxpt8F9b84e1Zp4uycu5574Qg5SpjBKYDUZ5Pie/8\nPR4Y50PrAgMBAAECggEAQrseKUNLMXiztfD14I3tg9TeeyU14CshLYN+hwYnxTi3\nXsCX9S1tpIzs9eGjDKAK5+hSo0dVZQLOEMEdCRty3m6rgN8OvLiWrj/7EnrZpTV0\ng4BXuO/gBi5B5CFyjFWp0T/vBM3tIB8OODqngRYkbfzXbMpyBlCJ2r/CqcQ7NnOj\nGq8xCbmPAdeqdyW/RaSyWvrwKpsO3am3Z7+LArsISwPROXQLlv1KW9MTZZRbCXxs\nslsASOnpq+eVQ87E1Q1+jqWmhWmuhFf6mhwHT5Ud+lZ6CHKgDo4MNBc57PjDJko0\nEty4Ky9KmJr3utOvZM7VB1tAXjgOVIUqm1hPJxKrQQKBgQDF+kc80p+KdJwuynDp\njaKLAXOY6BxnKGFQr/IIl7K6/iYPaXtM32aZSmF5unG8VMAcENihpXnqHd+YQLd5\neqkJDpC5MlJmr2l/AkLCGScNgACgVhwtmCs5jlVXhvzq2NXj+FEuqR/gwWvSgcfp\n1E/gqlv7q49B5GYhJys1kF55SwKBgQDAkLUOrXmN7upQ0fDO9w6RS8VmGjP6Hznw\nUTvNvaeD4W8E1eJetyAwLjGmMtq4JU8/x7Omp4cLC99Hf2Grp0VN9ZAjLFCyi4t6\n//JIERUaBLjmJFNDV5Q6nHhP14N/W8pWJC0QCjoEJ6mmBI5F1U/AcujYJeAVBOHK\nfJTqcqNb4QKBgQCp8nioi52MuyE/QWS/+GdpsCtNPSL0osM3AnJgUeiJgJWncUL4\n8GUgfatDVXtA0fe/n+52hJgtEsvX5OYbD+J+9dPiRoJZx4ZmEsi/2dueSR1AherW\ncOPaGobEBgqihtTFR2pZBbFpvGAUanf0D98p2tPvLIxjYe8R0o/TAUU4FQKBgFER\n2xgF0qH9jqpd6HrJqlljRATbTTylPtg86ueQS+EK3Jl1jmr/v85o9EAbMtfJ5VZd\ntfWYnBL7eZH5P95repL6qicUthilBSDQdmj+wBqHGGzTqDY2vdH7I+/BNLw+oa2o\nZ0xUcd5j8FlTm64swvmrpvmw4GkY+BIuZudZQgshAoGBAKMi0WiKtWMekynu/6dF\nXlzpuq98oje1iQwG/ZBlS57q5BYVsfZ6if2yagD5qyNP3NItMLY9OnNaD0mS3dGg\nRP5a9b5f2YtMYr5vXFk7/GsW622IF92mdsI94rbpLrKk2kNDZSB11kuP/zVCf53r\noRrFs3MAWdki9SDr/oT2nlS/\n-----END PRIVATE KEY-----\n",
    "client_email": "globens-drive-admin-bot@globens-uzbekistan.iam.gserviceaccount.com",
    "client_id": "114067220802738575598",
    "auth_uri": "https://accounts.google.com/o/oauth2/auth",
    "token_uri": "https://oauth2.googleapis.com/token",
    "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
    "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/globens-drive-admin-bot%40globens-uzbekistan.iam.gserviceaccount.com"
  });
  static final _scopes = ['https://www.googleapis.com/auth/drive'];

  static Future<ga.FileList> listFiles() async {
    final httpClient = await ga.clientViaServiceAccount(_credentials, _scopes);
    try {
      final api = ga.DriveApi(httpClient);
      return await api.files.list();
    } catch (e) {
      print(e.toString());
    } finally {
      httpClient.close();
    }
    return null;
  }

  static Future<void> downloadFile(String fileId) async {
    final httpClient = await ga.clientViaServiceAccount(_credentials, _scopes);
    try {
      final api = ga.DriveApi(httpClient);
      var response = await api.files.get(fileId, downloadOptions: ga.DownloadOptions.FullMedia) as ga.Media;
      List<int> dataStore = [];
      response.stream.listen((data) {
        print("DataReceived: ${data.length}");
        dataStore.insertAll(dataStore.length, data);
      }, onDone: () async {
        print(dataStore);
        print("Task Done");
      }, onError: (error) {
        print("Some Error");
      });
    } catch (e) {
      print(e.toString());
    } finally {
      httpClient.close();
    }
  }

  static Future<Tuple2<String, String>> uploadFile(String fileName, File file) async {
    final httpClient = await ga.clientViaServiceAccount(_credentials, _scopes);
    try {
      final api = ga.DriveApi(httpClient);
      var newFile = await api.files.create(
        ga.File()
          ..name = fileName
          ..writersCanShare = false
          ..viewersCanCopyContent = false,
        uploadMedia: ga.Media(file.openRead(), file.lengthSync()),
      );
      _shareFileWithGlobens(newFile.id);
      newFile = await api.files.get(
        newFile.id,
        $fields: 'id, webViewLink',
      );

      return Tuple2(newFile.id, newFile.webViewLink);
    } catch (e) {
      print(e.toString());
    } finally {
      httpClient.close();
    }
    return null;
  }

  static void _shareFileWithGlobens(String fileId) async {
    final httpClient = await ga.clientViaServiceAccount(_credentials, _scopes);
    try {
      final api = ga.DriveApi(httpClient);
      await api.permissions.create(ga.Permission.fromJson({"emailAddress": "globenssoft@gmail.com", "type": "user", "role": "writer"}), fileId);
    } catch (e) {
      print(e.toString());
    } finally {
      httpClient.close();
    }
  }

  static void shareFileWithThisUser(String fileId) async {
    final httpClient = await ga.clientViaServiceAccount(_credentials, _scopes);
    try {
      final api = ga.DriveApi(httpClient);
      await api.permissions.create(ga.Permission.fromJson({"emailAddress": AppUser.email, "type": "user", "role": "reader"}), fileId);
    } catch (e) {
      print(e.toString());
    } finally {
      httpClient.close();
    }
  }

  static Future<void> setDownloadable(String fileId, bool downloadable) async {
    final httpClient = await ga.clientViaServiceAccount(_credentials, _scopes);
    try {
      final api = ga.DriveApi(httpClient);
      await api.files.update(
        ga.File()..writersCanShare = downloadable,
        fileId,
      );
    } catch (e) {
      print(e.toString());
    } finally {
      httpClient.close();
    }
  }
}
