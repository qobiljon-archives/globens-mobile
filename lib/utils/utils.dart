import 'package:globens_flutter_client/entities/AppUser.dart';
import 'package:globens_flutter_client/generated_protos/gb_service.pbgrpc.dart';
import 'package:globens_flutter_client/utils/settings.dart';
import 'package:grpc/grpc.dart';
import 'package:tuple/tuple.dart';


Future<Tuple2<bool, String>> gprcAuthenticateUser(AuthenticateUser_AuthMethod method, String tokensJson) async {
  final channel = ClientChannel(grpc_host, port: grpc_port, options: const ChannelOptions(credentials: ChannelCredentials.insecure()));
  final stub = GlobensServiceClient(channel);

  try {
    final response = await stub.authenticateUser(AuthenticateUser_Request()
      ..method = method
      ..tokensJson = tokensJson);
    await channel.shutdown();
    return response.success;
  } catch (e) {
    await channel.shutdown();
    return false;
  }
}
