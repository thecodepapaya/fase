import 'dart:collection';

class AccessPoints {
  AccessPoints._();

  static const _apList = [
    '24:c9:a1:09:9f:00',
    'f0:3e:90:0c:22:00',
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
    '1c:18:4a:7c:92:c0', // my own AP, added for testing purposes TODO: remove before shipping
  ];

  static final list = UnmodifiableListView(_apList);
}
