import 'package:globens_flutter_client/entities/AppUser.dart';
import 'package:globens_flutter_client/generated_protos/gb_service.pbgrpc.dart';
import 'package:globens_flutter_client/utils/settings.dart';
import 'package:grpc/grpc.dart';

Future<int> runTestSumRpc() async {
  final channel = ClientChannel(grpc_host, port: grpc_port, options: const ChannelOptions(credentials: ChannelCredentials.insecure()));
  final stub = GlobensServiceClient(channel);

  int result;
  try {
    final response = await stub.testSum(TestSum_Request()
      ..a = 4
      ..b = 5);
    result = response.c;
  } catch (e) {
    result = null;
  }
  await channel.shutdown();
  return result;
}

Future<bool> gprcAuthenticateUser(AuthenticateUser_AuthMethod method, String accessToken) async {
  final channel = ClientChannel(grpc_host, port: grpc_port, options: const ChannelOptions(credentials: ChannelCredentials.insecure()));
  final stub = GlobensServiceClient(channel);

  try {
    final response = await stub.authenticateUser(AuthenticateUser_Request()
      ..accessToken = accessToken
      ..method = method);
    await channel.shutdown();
    return response.success;
  } catch (e) {
    await channel.shutdown();
    return false;
  }
}
