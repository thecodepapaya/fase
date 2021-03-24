package in.ac.iiitvadodara.fase;

import android.bluetooth.BluetoothAdapter;
import android.bluetooth.BluetoothDevice;
import android.bluetooth.le.BluetoothLeScanner;
import android.bluetooth.le.ScanCallback;
import android.bluetooth.le.ScanResult;
import android.bluetooth.le.ScanSettings;
import android.content.Context;
import android.os.ParcelUuid;
import android.util.Log;

import androidx.annotation.NonNull;
import androidx.work.Worker;
import androidx.work.WorkerParameters;

import java.util.List;
import java.util.UUID;


public class ScanWorker extends Worker {
    private static final long SCAN_PERIOD = 10000;
    private final ScanCallback leScanCallback = new ScanCallback() {
        @Override
        public void onScanResult(int callbackType, ScanResult result) {
            BluetoothDevice device = result.getDevice();
            Log.d("device-found", "Found a BLE device: " + result);
        }

        @Override
        public void onBatchScanResults(List<ScanResult> results) {
            // Ignore for now
            Log.d("device-found", "Found a BLE batch scan result device");

        }

        @Override
        public void onScanFailed(int errorCode) {
            // Ignore for now
            Log.e("device-found", "Scan failed for BLE: " + errorCode);

        }
    };

    public ScanWorker(
            @NonNull Context context,
            @NonNull WorkerParameters params) {
        super(context, params);
    }

    @NonNull
    @Override
    public Result doWork() {
        ParcelUuid pUuid = new ParcelUuid(UUID.fromString("2d2c1391-8609-4c5b-9767-b6bb845a425b"));
//        List<ScanFilter> filters = new ArrayList<ScanFilter>();
//        filters.add(new ScanFilter.Builder().setServiceUuid(pUuid).build());
        ScanSettings scanSettings = new ScanSettings.Builder()
                .setScanMode(ScanSettings.SCAN_MODE_LOW_POWER)
//                .setCallbackType(ScanSettings.CALLBACK_TYPE_FIRST_MATCH)
//                .setMatchMode(ScanSettings.MATCH_MODE_AGGRESSIVE)
//                .setNumOfMatches(ScanSettings.MATCH_NUM_ONE_ADVERTISEMENT)
                .setReportDelay(0L)
                .build();

        BluetoothAdapter adapter = BluetoothAdapter.getDefaultAdapter();
        BluetoothLeScanner scanner = adapter.getBluetoothLeScanner();

        if (scanner != null) {
//            scanner.startScan(filters, scanSettings, leScanCallback);
            scanner.startScan(null, scanSettings, leScanCallback);
            Log.d("TAG", "scan started");
        } else {
            Log.e("TAG", "could not get scanner object");
        }

//        final BluetoothManager bluetoothManager = ContextCompat.getSystemService(BluetoothManager.class);
//        BluetoothAdapter bluetoothAdapter = null;
//        if (bluetoothManager != null) {
//            bluetoothAdapter = bluetoothManager.getAdapter();
//        }
//
//
//        if (bluetoothAdapter != null && !bluetoothAdapter.isEnabled()) {
//            Intent enableBtIntent = new Intent(BluetoothAdapter.ACTION_REQUEST_ENABLE);
//            startActivityForResult(enableBtIntent, REQUEST_ENABLE_BT);
//        }


        // Indicate whether the work finished successfully with the Result
        return Result.success();
    }
}
