package in.ac.iiitvadodara.fase;

import android.bluetooth.BluetoothAdapter;
import android.bluetooth.le.AdvertiseCallback;
import android.bluetooth.le.AdvertiseData;
import android.bluetooth.le.AdvertiseSettings;
import android.bluetooth.le.BluetoothLeAdvertiser;
import android.os.ParcelUuid;

import androidx.annotation.NonNull;
import androidx.work.Constraints;
import androidx.work.NetworkType;
import androidx.work.OneTimeWorkRequest;
import androidx.work.WorkManager;
import androidx.work.WorkRequest;

import com.scottyab.rootbeer.RootBeer;

import java.util.UUID;

import io.flutter.Log;
import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodChannel;

import android.content.Context;

public class MainActivity extends FlutterActivity {
    private static final String CHANNEL = "in.ac.iiitvadodara.fase/rooted";
    AdvertiseCallback advertisingCallback = new AdvertiseCallback() {
        @Override
        public void onStartSuccess(AdvertiseSettings settingsInEffect) {
            Log.e("BLE", "Advertising onStartSuccess");
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
                    switch (call.method) {
                        case "getRootStatus":
                            boolean rootStatus = getRootStatus();
                            result.success(rootStatus);
                            break;
                        case "bleAd":
                            String data = call.argument("data");
                            startBleAdvertisement(data);
                            result.success(true);
                            break;
                        case "bleScan":
                            Integer attendanceID = call.argument("data");
                            startBleScan(attendanceID);
                            result.success(true);
                            break;
                        default:
                            result.notImplemented();
                            break;
                    }
                });
    }

    private boolean getRootStatus() {
        RootBeer rootBeer = new RootBeer(this);
        return rootBeer.isRooted();
    }

    private void startBleAdvertisement(String adData) {
        BluetoothLeAdvertiser advertiser = BluetoothAdapter.getDefaultAdapter().getBluetoothLeAdvertiser();
        AdvertiseSettings settings = new AdvertiseSettings.Builder()
                .setAdvertiseMode(AdvertiseSettings.ADVERTISE_MODE_LOW_LATENCY)
                .setTxPowerLevel(AdvertiseSettings.ADVERTISE_TX_POWER_HIGH).setConnectable(false).build();
        ParcelUuid pUuid = new ParcelUuid(UUID.fromString("2d2c1391-8609-4c5b-9767-b6bb845a425b"));
        AdvertiseData data = new AdvertiseData.Builder().setIncludeDeviceName(false)
                .addServiceData(pUuid, adData.getBytes()).build();
        advertiser.startAdvertising(settings, data, advertisingCallback);
    }

    private void startBleScan(Integer attendanceID) {
        Constraints constraints = new Constraints.Builder()
                .setRequiresBatteryNotLow(false)
                .setRequiredNetworkType(NetworkType.NOT_REQUIRED)
                .setRequiresCharging(false)
                .setRequiresStorageNotLow(false)
                .setRequiresDeviceIdle(false)
                .build();

        WorkRequest scanWorkRequest = new OneTimeWorkRequest.Builder(ScanWorker.class).setConstraints(constraints).build();

        WorkManager.getInstance(this).enqueue(scanWorkRequest);
    }
}

