part of '../view.dart';

class SideDrawer extends ConsumerWidget {
  const SideDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(_vsProvider.notifier);

    final displayName = FirebaseAuthUsecase.instance.getCurrentFirebaseUser?.displayName ?? 'User';
    final email = FirebaseAuthUsecase.instance.getCurrentFirebaseUser?.email ?? '';

    final photoUrl =
        FirebaseAuthUsecase.instance.getCurrentFirebaseUser?.photoURL ?? _generatePhotoUrlFromName(displayName);

    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(displayName),
            accountEmail: Text(email),
            currentAccountPicture: ClipOval(
              child: CachedNetworkImage(
                imageUrl: photoUrl,
                placeholder: (context, url) => Image.asset('assets/placeholder_image.png'),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
          ListTile(
            title: Text(getRoleText),
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

  String get getRoleText {
    late final String role;

    final isFaculty = Globals.profile.isFaculty;

    role = isFaculty ? 'Logged in as Faculty' : 'Logged in as Student';

    return role;
  }
}
