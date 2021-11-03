import 'package:chopper/chopper.dart';
import 'package:demo_dependency_injection/services/video_service.dart';
import 'package:injectable/injectable.dart';

import 'model_converter.dart';

@singleton
class ApiClient {
  final ChopperClient chopperClient;

  ApiClient()
      : chopperClient = ChopperClient(
          baseUrl: 'https://storage.googleapis.com',
          interceptors: [HttpLoggingInterceptor()],
          converter: ModelConverter(),
          errorConverter: JsonConverter(),
          services: [
            VideoService.create(),
          ],
        );

  @disposeMethod
  void dispose() {
    chopperClient.dispose();
  }
}
