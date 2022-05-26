abstract class FService {
  Future<dynamic> startUp();

  Future<void> onStartUp(dynamic data);

  void onShutDown();
}
