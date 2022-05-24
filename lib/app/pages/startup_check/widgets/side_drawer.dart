part of '../view.dart';

class SideDrawer extends ConsumerWidget {
  const SideDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(_vsProvider.notifier);

    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('displayName'),
            accountEmail: Text('currentUser.email'),
            currentAccountPicture: ClipOval(
              child: Image.network('https://www.fillmurray.com/640/360'),
            ),
          ),
          const ListTile(
            title: Text(
              'loginAsStudent',
            ),
          ),
          ListTile(
            title: const Text('Sign out'),
            trailing: const Icon(Icons.logout),
            onTap: controller.onSignOutButtonPressed,
          ),
        ],
      ),
    );
  }
}
