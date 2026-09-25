import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../screens/home_screen.dart';
import '../screens/catalog_screen.dart';
import '../screens/lookbook_screen.dart';
import '../screens/contact_screen.dart';
import '../screens/profile_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.fondo,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                'WAIKIRIA',
                style: TextStyle(
                  fontSize: 24,
                  letterSpacing: 6,
                  fontWeight: FontWeight.w300,
                  color: AppColors.marronOscuro,
                ),
              ),
            ),
            const SizedBox(height: 40),

            // INICIO
            _DrawerItem(
              label: 'INICIO',
              onTap: () {
                Navigator.pop(context);
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => const HomeScreen()),
                      (route) => false,
                );
              },
            ),

            // CATÁLOGO → pantalla separada
            _DrawerItem(
              label: 'CATÁLOGO',
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const CatalogScreen()),
                );
              },
            ),

            // LOOKBOOK → pantalla separada (igual al Lookbook del Home)
            _DrawerItem(
              label: 'LOOKBOOK',
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const LookbookScreen()),
                );
              },
            ),

            // CONTACTO → pantalla separada
            _DrawerItem(
              label: 'CONTACTO',
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const ContactScreen()),
                );
              },
            ),

            // MI CUENTA → pantalla separada
            _DrawerItem(
              label: 'MI CUENTA',
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const ProfileScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _DrawerItem extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const _DrawerItem({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        label,
        style: const TextStyle(
          letterSpacing: 3,
          fontSize: 15,
          color: AppColors.marronOscuro,
        ),
      ),
      onTap: onTap,
    );
  }
}