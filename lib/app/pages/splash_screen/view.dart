import 'dart:collection';

import 'package:fase/app/app.dart';
import 'package:fase/app/core_widgets/scaffold.dart';
import 'package:fase/device/repositories/connectivity/connectivity.dart';
import 'package:fase/device/repositories/device_info/device_info.dart';
import 'package:fase/device/repositories/package_info/package_info.dart';
import 'package:fase/device/repositories/safe_device/safe_device.dart';
import 'package:fase/device/repositories/secure_storage/secure_storage.dart';
import 'package:fase/device/repositories/wifi_info/wifi_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../utils/router/app_router.dart';

part 'controller.dart';

class SplashScreenView extends ConsumerWidget {
  const SplashScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(startUpProvider);

    return FScaffold(
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset('assets/iiitv.png'),
            // const SizedBox(height: 30),
            // const Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 50),
            //   child: LinearProgressIndicator(),
            // ),
          ],
        ),
      ),
    );
  }
}
