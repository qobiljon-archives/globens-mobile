import 'package:globens_flutter_client/generated_protos/gb_service.pbgrpc.dart';
import 'package:grpc/grpc.dart';

const String GRPC_HOST = '54.180.83.68';
const int GRPC_PORT = 50051;

ClientChannel _channel;
GlobensServiceClient _stub;

GlobensServiceClient getStub() {
  if (_stub == null) {
    _channel = ClientChannel(GRPC_HOST, port: GRPC_PORT, options: const ChannelOptions(credentials: ChannelCredentials.insecure()));
    _stub = GlobensServiceClient(_channel);
  }
  return _stub;
}
