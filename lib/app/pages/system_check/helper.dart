part of 'view.dart';

String _generatePhotoUrlFromName(String displayName) {
  late final String url;
  late final String nameEncoding;

  final displayNameTokens = displayName.split(' ');

  if (displayNameTokens.length == 1) {
    nameEncoding = displayNameTokens.first;
  } else {
    nameEncoding = '${displayNameTokens[0]}+${displayNameTokens[1]}';
  }

  url = 'https://eu.ui-avatars.com/api/?name=$nameEncoding&size=100';

  return url;
}

enum CheckState {
  valid,
  invalid,
  checking,
}

enum ActionButtonState {
  checkingStatus,
  allChecksPass,
  registrationInvalid,
  someCheckFailed,
}
