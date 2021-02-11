import 'package:fase/string_resource.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';

class LocationPermission {
  BuildContext context;
  LocationPermission(BuildContext context) {
    this.context = context;
  }

  Future<void> requestPermisson() async {
    PermissionStatus status = await Permission.location.status;
    print(status.toString());
    switch (status) {
      case PermissionStatus.granted:
        break;
      case PermissionStatus.undetermined:
        status = await Permission.location.request();
        break;
      case PermissionStatus.denied:
        if (await Permission.location.shouldShowRequestRationale) {
          await showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return WillPopScope(
                onWillPop: () {
                  print("Cannot pop dialog, kyuki permission important hai!");
                  return Future.value(false);
                },
                child: AlertDialog(
                  title: Text(StringResources.permissionRationaleTitle),
                  content: Text(StringResources.permissionRationaleBody),
                  actions: [
                    TextButton(
                      child: Text(StringResources.quit),
                      onPressed: () {
                        SystemNavigator.pop();
                      },
                    ),
                    TextButton(
                      child: Text(StringResources.grant),
                      onPressed: () async {
                        status = await Permission.location.request();
                        if (Navigator.of(context).canPop()) {
                          Navigator.of(context).pop();
                        }
                      },
                    ),
                  ],
                ),
              );
            },
          );
        }
        break;
      case PermissionStatus.restricted:
        await showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return WillPopScope(
              onWillPop: () {
                print("Cannot pop dialog, kyuki permission important hai!");
                return Future.value(false);
              },
              child: AlertDialog(
                title: Text(StringResources.permissionRestrictedTitle),
                content: Text(StringResources.permissionRestrictedBody),
                actions: [
                  TextButton(
                    onPressed: () {
                      SystemNavigator.pop();
                    },
                    child: Text(StringResources.quit),
                  ),
                ],
              ),
            );
          },
        );
        break;
      case PermissionStatus.permanentlyDenied:
        await showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return WillPopScope(
              onWillPop: () {
                print("Cannot pop dialog, kyuki permission important hai!");
                return Future.value(false);
              },
              child: AlertDialog(
                title: Text(StringResources.permissionPermanentDeniedTitle),
                content: Text(StringResources.permissionPermanentDeniedBody),
                actions: [
                  TextButton(
                    onPressed: () async {
                      if (await Permission.location.request().isGranted) {
                        Navigator.of(context).pop();
                      } else {
                        await openAppSettings();
                        Navigator.of(context).pop();
                      }
                    },
                    child: Text(StringResources.ok),
                  ),
                ],
              ),
            );
          },
        );
        break;
    }
    if (!await Permission.location.isGranted) {
      await requestPermisson();
    }
    print("End of Permission function");
  }
}
