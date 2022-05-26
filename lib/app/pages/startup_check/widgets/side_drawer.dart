part of '../view.dart';

class SideDrawer extends ConsumerWidget {
  const SideDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(_vsProvider.notifier);

    final displayName = AuthUsecase.instance.getCurrentUser?.displayName ?? 'User';
    final email = AuthUsecase.instance.getCurrentUser?.email ?? '';

    final photoUrl = AuthUsecase.instance.getCurrentUser?.photoURL ?? _generatePhotoUrlFromName(displayName);

    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(displayName),
            accountEmail: Text(email),
            currentAccountPicture: ClipOval(
              child: Image.network(photoUrl),
            ),
          ),
          const ListTile(
            title: Text(
              'loginAsStudent', // TODO get actual status from BE
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
