import 'generated_protos/gb_service.pbgrpc.dart';
import 'package:grpc/grpc.dart';

Future<int> runTestSumRpc() async {
  final channel = ClientChannel('165.246.42.172', port: 50052, options: const ChannelOptions(credentials: ChannelCredentials.insecure()));
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
