part of '../view.dart';

class StartupCheckTable extends ConsumerWidget {
  const StartupCheckTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isPhysicalDevice = ref.watch(_vsProvider.select((state) => state.isPhysicalDevice));
    final isDeviceUnRooted = ref.watch(_vsProvider.select((state) => state.isDeviceUnRooted));
    final isLocationGranted = ref.watch(_vsProvider.select((state) => state.isLocationGranted));
    final isLocationEnabled = ref.watch(_vsProvider.select((state) => state.isLocationEnabled));
    final isWifiConnected = ref.watch(_vsProvider.select((state) => state.isWifiConnected));
    final isIIITVConnected = ref.watch(_vsProvider.select((state) => state.isIIITVConnected));
    final canPingServer = ref.watch(_vsProvider.select((state) => state.canPingServer));
    final isMinVersion = ref.watch(_vsProvider.select((state) => state.isMinVersion));
    final isRegistrationValid = ref.watch(_vsProvider.select((state) => state.isRegistrationValid));

    return Table(
      children: <TableRow>[
        _tableRow(
          'Physical Device',
          CheckIcon(isValid: isPhysicalDevice),
        ),
        _tableRow(
          'Un-Rooted',
          CheckIcon(isValid: isDeviceUnRooted),
        ),
        _tableRow(
          'Location Permission',
          CheckIcon(isValid: isLocationGranted),
        ),
        _tableRow(
          'Location Enabled',
          CheckIcon(isValid: isLocationEnabled),
        ),
        _tableRow(
          'WIFI Connected',
          CheckIcon(isValid: isWifiConnected),
        ),
        _tableRow(
          'IIITV WIFI connected',
          CheckIcon(isValid: isIIITVConnected),
        ),
        _tableRow(
          'Server Found',
          CheckIcon(isValid: canPingServer),
        ),
        _tableRow(
          'Up-to date Version',
          CheckIcon(isValid: isMinVersion),
        ),
        _tableRow(
          'Registration Valid',
          CheckIcon(isValid: isRegistrationValid),
        ),
      ],
    );
  }

  TableRow _tableRow(String key, Widget icon) {
    return TableRow(
      children: <Widget>[
        Text(key, style: FTextStyle.heading4),
        Container(
          alignment: Alignment.centerRight,
          child: icon,
        ),
      ],
    );
  }
}
