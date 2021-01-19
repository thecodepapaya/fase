package in.ac.iiitvadodara.fase;

import androidx.annotation.NonNull;
import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodChannel;

import com.scottyab.rootbeer.RootBeer;
import com.scottyab.rootbeer.util.Utils;

public class MainActivity extends FlutterActivity {
  private static final String CHANNEL = "com.iiitvadodara.fase/rooted";

  @Override
  public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
    super.configureFlutterEngine(flutterEngine);
    new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), CHANNEL)
        .setMethodCallHandler((call, result) -> {
          // Note: this method is invoked on the main thread.
          if (call.method.equals("getRootStatus")) {
            boolean rootStatus = getRootStatus();

            // if (rootStatus != -1) {
            result.success(rootStatus);
            // } else {
            // result.error("UNAVAILABLE", "Battery level not available.", null);
            // }
          } else {
            result.notImplemented();
          }
        });
  }

  private boolean getRootStatus() {
    RootBeer rootBeer = new RootBeer(this);
    if (rootBeer.isRooted()) {
      return true;
    } else {
      return false;
    }
  }
}
