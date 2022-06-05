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
    final isUserLoggedIn = ref.watch(_vsProvider.select((state) => state.isUserLoggedIn));
    final isRegistrationValid = ref.watch(_vsProvider.select((state) => state.isRegistrationValid));

    return Table(
      children: <TableRow>[
        _tableRow(
          'Physical Device',
          CheckIcon(state: isPhysicalDevice),
        ),
        _tableRow(
          'Un-Rooted',
          CheckIcon(state: isDeviceUnRooted),
        ),
        _tableRow(
          'Location Permission',
          CheckIcon(state: isLocationGranted),
        ),
        _tableRow(
          'Location Enabled',
          CheckIcon(state: isLocationEnabled),
        ),
        _tableRow(
          'WIFI Connected',
          CheckIcon(state: isWifiConnected),
        ),
        _tableRow(
          'IIITV WIFI connected',
          CheckIcon(state: isIIITVConnected),
        ),
        _tableRow(
          'Server Found',
          CheckIcon(state: canPingServer),
        ),
        _tableRow(
          'Up-to date Version',
          CheckIcon(state: isMinVersion),
        ),
        _tableRow(
          'User logged in',
          CheckIcon(state: isUserLoggedIn),
        ),
        _tableRow(
          'Registration Valid',
          CheckIcon(state: isRegistrationValid),
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
