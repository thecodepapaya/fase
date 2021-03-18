package in.ac.iiitvadodara.fase;

import android.bluetooth.BluetoothAdapter;
import android.bluetooth.le.AdvertiseCallback;
import android.bluetooth.le.AdvertiseData;
import android.bluetooth.le.AdvertiseSettings;
import android.bluetooth.le.BluetoothLeAdvertiser;
import android.os.ParcelUuid;

import androidx.annotation.NonNull;

import com.scottyab.rootbeer.RootBeer;

import java.nio.charset.StandardCharsets;
import java.util.UUID;

import io.flutter.Log;
import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodChannel;

public class MainActivity extends FlutterActivity {
    private static final String CHANNEL = "in.ac.iiitvadodara.fase/rooted";
    AdvertiseCallback advertisingCallback = new AdvertiseCallback() {
        @Override
        public void onStartSuccess(AdvertiseSettings settingsInEffect) {
            Log.e("BLE", "Advertising onStartSuccess: ");
            super.onStartSuccess(settingsInEffect);
        }

        @Override
        public void onStartFailure(int errorCode) {
            Log.e("BLE", "Advertising onStartFailure: " + errorCode);
            super.onStartFailure(errorCode);
        }
    };

    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        super.configureFlutterEngine(flutterEngine);
        new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), CHANNEL)
                .setMethodCallHandler((call, result) -> {
                    // Note: this method is invoked on the main thread.
                    if (call.method.equals("getRootStatus")) {
                        boolean rootStatus = getRootStatus();
                        result.success(rootStatus);
                    } else if (call.method.equals("bleAd")) {
                        startBleAdvertisement();
                        result.success(true);
                    } else {
                        result.notImplemented();
                    }
                });
    }

    private boolean getRootStatus() {
        RootBeer rootBeer = new RootBeer(this);
        return rootBeer.isRooted();
    }

    private void startBleAdvertisement() {
        BluetoothLeAdvertiser advertiser = BluetoothAdapter.getDefaultAdapter().getBluetoothLeAdvertiser();

        AdvertiseSettings settings = new AdvertiseSettings.Builder()
                .setAdvertiseMode(AdvertiseSettings.ADVERTISE_MODE_LOW_LATENCY)
                .setTxPowerLevel(AdvertiseSettings.ADVERTISE_TX_POWER_HIGH)
                .setConnectable(false)
                .build();

        ParcelUuid pUuid = new ParcelUuid(UUID.fromString("CDB7950D-73F1-4D4D-8E47-C090502DBD63"));

        AdvertiseData data = new AdvertiseData.Builder()
                .setIncludeDeviceName(false)
//                .addServiceUuid(pUuid)
                .addServiceData(pUuid, "201851029".getBytes())
                .build();

        advertiser.startAdvertising(settings, data, advertisingCallback);
    }

}
