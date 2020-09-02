import 'package:globens_flutter_client/generated_protos/gb_service.pbgrpc.dart';
import 'package:globens_flutter_client/entities/BusinessPage.dart';
import 'package:globens_flutter_client/entities/Product.dart';
import 'package:globens_flutter_client/utils/settings.dart';
import 'package:tuple/tuple.dart';
import 'package:grpc/grpc.dart';

Future<Tuple2<bool, String>> gprcAuthenticateUser(AuthenticateUser_AuthMethod method, String tokensJson) async {
  final channel = ClientChannel(grpc_host, port: grpc_port, options: const ChannelOptions(credentials: ChannelCredentials.insecure()));
  final stub = GlobensServiceClient(channel);

  Tuple2<bool, String> res;
  try {
    final response = await stub.authenticateUser(AuthenticateUser_Request()
      ..method = method
      ..tokensJson = tokensJson);
    res = Tuple2(response.success, response.sessionKey);
  } catch (e) {
    res = Tuple2(false, null);
    print(e);
  } finally {
    await channel.shutdown();
  }
  return res;
}

Future<List<BusinessPage>> grpcFetchBusinessPages(String sessionKey) async {
  final channel = ClientChannel(grpc_host, port: grpc_port, options: const ChannelOptions(credentials: ChannelCredentials.insecure()));
  final stub = GlobensServiceClient(channel);

  List<BusinessPage> res = List<BusinessPage>();
  try {
    final response = await stub.fetchBusinessPages(FetchBusinessPages_Request()..sessionKey = sessionKey);
    if (response.success)
      response.id.asMap().forEach((i, id) {
        res.add(BusinessPage.create(response.title[i], response.pictureBlob[i], id: response.id[i], type: response.type[i], role: response.role[i]));
      });
  } catch (e) {
    print(e);
  } finally {
    await channel.shutdown();
  }

  return res;
}

Future<bool> grpcCreateBusinessPage(String sessionKey, BusinessPage businessPage) async {
  final channel = ClientChannel(grpc_host, port: grpc_port, options: const ChannelOptions(credentials: ChannelCredentials.insecure()));
  final stub = GlobensServiceClient(channel);

  bool res = false;
  try {
    final response = await stub.createBusinessPage(CreateBusinessPage_Request()
      ..sessionKey = sessionKey
      ..title = businessPage.title
      ..pictureBlob = businessPage.pictureBlob);
    res = response.success;
  } catch (e) {
    print(e);
  } finally {
    await channel.shutdown();
  }

  return res;
}

Future<bool> grpcCreateProduct(String sessionKey, int businessPageId, Product product) async {
  final channel = ClientChannel(grpc_host, port: grpc_port, options: const ChannelOptions(credentials: ChannelCredentials.insecure()));
  final stub = GlobensServiceClient(channel);

  bool res = false;
  try {
    final response = await stub.createProduct(CreateProduct_Request()
      ..sessionKey = sessionKey
      ..businessPageId = businessPageId
      ..name = product.name
      ..pictureBlob = product.imgUri);
    res = response.success;
  } catch (e) {
    print(e);
  } finally {
    await channel.shutdown();
  }
  return res;
}

Future<List<Product>> grpcFetchProducts(String sessionKey, int businessPageId) async {
  final channel = ClientChannel(grpc_host, port: grpc_port, options: const ChannelOptions(credentials: ChannelCredentials.insecure()));
  final stub = GlobensServiceClient(channel);

  List<Product> res = List<Product>();

  try {
    final response = await stub.fetchProducts(FetchProducts_Request()
      ..sessionKey = sessionKey
      ..businessPageId = businessPageId);
    if (response.success)
      response.id.asMap().forEach((i, id) {
        res.add(Product.create(response.name[i], response.pictureBlob[i]));
      });
  } catch (e) {
    print(e);
  } finally {
    await channel.shutdown();
  }
  return res;
}
