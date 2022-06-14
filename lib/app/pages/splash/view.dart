import 'dart:collection';

import 'package:fase/app/app.dart';
import 'package:fase/app/core_widgets/scaffold.dart';
import 'package:fase/domain/services/dio/dio_service.dart';
import 'package:fase/domain/services/remote_database/remote_database_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/services/connectivity/connectivity_service.dart';
import '../../../domain/services/device_info/device_info_service.dart';
import '../../../domain/services/package_info/package_info_service.dart';
import '../../../domain/services/permission/permission_service.dart';
import '../../../domain/services/safe_device/safe_device_service.dart';
import '../../../domain/services/secure_storage/secure_storage_service.dart';
import '../../../domain/services/services.dart';
import '../../../domain/services/wifi_info/wifi_info_service.dart';
import '../../../firebase_options.dart';
import '../../utils/router/app_router.dart';

part 'controller.dart';

class SplashScreenView extends ConsumerWidget {
  const SplashScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FScaffold(
      body: Column(
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
    );
  }
}
