import 'dart:collection';

@Deprecated('Use dynamically fetched AP list from Cloud Firestore document path /meta_data/ap_data')
class AccessPoints {
  AccessPoints._();

  static const _apListPrefix = [
    'f0:3e:90',
    '24:c9:a1',
    '6c:aa:b3',
    '58:b6:33',
    '1c:18:4a',
    '18:fd:cb',
    '70:3a:cb',
    '00:e2:69',
  ];

  static const _apList = [
    '24:c9:a1:09:9f:00',
    'f0:3e:90:0c:22:00',
    'f0:3e:90:4c:02:f8',
    'f0:3e:90:8c:02:f8',
    'f0:3e:90:0c:02:f8',
    '24:c9:a1:09:a1:50',
    '6c:aa:b3:12:49:c0',
    '24:c9:a1:07:29:50',
    'f0:3e:90:0c:24:70',
    'f0:3e:90:0c:11:60',
    '24:c9:a1:07:2f:30',
    'f0:3e:90:0c:02:f0',
    '58:b6:33:26:56:c0',
    'f0:3e:90:0b:fa:d0',
    'f0:3e:90:0c:02:e0',
    'f0:3e:90:0c:29:d0',
    'f0:3e:90:0c:19:90',
    'f0:3e:90:0c:1f:80',
    '24:c9:a1:09:a7:20',
    'f0:3e:90:0c:38:20',
    'f0:3e:90:0c:08:90',
    '24:c9:a1:09:9a:c0',
    '6c:aa:b3:08:ad:b0',
    '58:b6:33:26:51:40',
    '58:b6:33:26:53:20',
    'f0:3e:90:0c:59:b0',
    '1c:18:4a:7c:92:c0', // my own AP, added for testing purposes
    '18:fd:cb:ad:9c:c0', // Tanmay AP, added for testing purposes
    '70:3a:cb:e4:6f:da', // Tanmay AP, added for testing purposes
    '70:3a:cb:e4:72:16', // Tanmay AP, added for testing purposes
    '00:e2:69:11:3c:48', // Firewall AP,
    '00:e2:69:11:3c:49', // Firewall AP,
  ];

  static final list = UnmodifiableListView(_apList);
  static final listPrefix = UnmodifiableListView(_apListPrefix);
}
