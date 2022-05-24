abstract class FService {
  Future<void> startUp();

  Future<void> onStartUp();

  void onShutDown();
}
