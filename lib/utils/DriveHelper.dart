import 'package:globens_flutter_client/entities/AppUser.dart';
import 'package:googleapis/drive/v3.dart' as ga;
import 'package:googleapis_auth/auth_io.dart' as ga;
import 'package:tuple/tuple.dart';
import 'dart:io';

class DriveHelper {
  static final _credentials = ga.ServiceAccountCredentials.fromJson({
    "type": "service_account",
    "project_id": "globens",
    "private_key_id": "74d4b0f357db2fa1fe16ddaae4d106d616e130eb",
    "private_key":
        "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQCvZIOHzylu/9vS\noRqbQO5z9TQ3S8f5NaRV8YDdVuwZnLj/CMKdwUIc7S6VeU/JAusXCJZ4hs5Ju8qa\n3T59PKZ6qPrXKbvX59DHB9KJAyT9ApTpB9yGeYUWnHTWDfANUzyTU8aRffsIH1Hf\n0JGZxYl+PbihEjkYZc61zW+2dh0NYv84k/79gEKfLcC6vS/Ibmr3N5QEC4oPP15f\n5zX4MWEdu8o26xrprIdLBxRDzWqAt6MUCxr18vKYbhFLAkVF6Wu4DNf9jCb7HatA\nxGQjdzrSNhTDZ1xoNq8hb22hLhyVw79miLPk3Ukma9T9PNr+OFHtXCllargk9D91\nd3VeJmApAgMBAAECggEADPCgXB4Sd14g1pW8d+kW1p8H+M7qXGZi3xTb3iieL2cO\nxoEb06X5FdeBXPWH54ODuu2vJUoD0PCOCnYpeLWnbiwGoqZxdYTEtFRtSd69pT2C\nJT2nXVP8l84X+B1r4R3Lna57+0q1QTSHVrkFbvgCFHpjA14r8HL9aNAU7nwhGVY9\ny1JM0rtMGO+hW6Ii8qmkOU4Y7VN10VNWyWx9bZ6SXgn6WAekgNt7Ylke5q3qilu6\nmKfEaJtQT7szodeb7thvK2U0n9Dcjye8T97hwAexXJ6RXaH/zYxyrnxONc+z6yL8\nPkotE8WmaRdlo992hh6Kkmzej4l9PKuRL5ZpvAig0QKBgQDW6WdzBMvsB/GrCcgC\ntQhecPCuWiK3jGkB0WEV8EpZ6D5O4naN72lIetUzxRLOiTKst/KY7FRVzUjJhfsn\nMK+qcKdvcbcSWmI6GeV2VaeF+HqowHXcC/UZz956IsPLbwcjLejralAtblTgSVJx\nOmoW/UDsCfOTh2upcfY1scBksQKBgQDQ7OUTTK1HbeRKn4g+Al17/C1TQKVQuA2L\nifZpTVxgdpa1xm9tKeotdm5yc3Kp+6XsbpFd5u2hxlH7BAAzOweFlAP0LTgCjXUf\n/k+EweG2ug+bTtrlnDitGflFSf2AQwWF6Oe3l3sQXNdLyNSZKQqSYTwqiIohJUVM\npHEhJydw+QKBgQDEjszS4bwwsENUD6oi77gryFgY3s+J2J3hz8Jf8lnOSR9TvsR3\npFRCujVtF/3PcKQsXEFBpESuBQdhaWz/twOzez1oLDUoUAou4aiAxm5llZF57izd\niQIvDXOJeWpiEbYRctfpGF8kbhiq2eTRMn/9bruGJsPkVqMdYuGw0lYIwQKBgCh/\nw2gaVPyjsL1Gb4KVssl1+NNKlMEw7G9ALyP6ew237z8NWEww89QcQQyulGue/Gr4\ng/VP7oCNkRa3j9JefvbF2n5axaC5CxtIkOGLM9XX+25/uq8HuXTUtB1aWmmilE+A\n9moAUzq4xINMSunlqsb1UlRsY1pJf0V8GvHyRRMBAoGBAI3Tcl2b2IVFFoSDFBU7\nKMje/rWThCTrKVL0pdekDvZ21f2L1Yn7zavA1+j3C55buGRr/fW9zdefiXQa88FP\nquYWXeY+iOprdrv/U7v016tMSikvM5tx2qzPceSa3I+4gMalzsjtn9tQCw//E+yR\nXKvTPqAepUTh1wJPzkKWv051\n-----END PRIVATE KEY-----\n",
    "client_email": "globens-admin-bot@globens.iam.gserviceaccount.com",
    "client_id": "103327753411229143205",
    "auth_uri": "https://accounts.google.com/o/oauth2/auth",
    "token_uri": "https://oauth2.googleapis.com/token",
    "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
    "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/globens-admin-bot%40globens.iam.gserviceaccount.com"
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

  static Future<bool> downloadFile(String fileId, String filePath) async {
    var httpClient = await ga.clientViaServiceAccount(_credentials, _scopes);
    try {
      final api = ga.DriveApi(httpClient);
      try {
        var media = await api.files.get(fileId, downloadOptions: ga.DownloadOptions.FullMedia) as ga.Media;
        List<int> dataStore = [];
        await for (var part in media.stream) {
          dataStore.insertAll(dataStore.length, part);
        }
        var file = new File(filePath);
        await file.writeAsBytes(dataStore);
        // assert(media.length == file.lengthSync());
        return true;
      } catch (e) {
        print(e);
        return false;
      }
    } catch (e) {
      print(e);
      return false;
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
