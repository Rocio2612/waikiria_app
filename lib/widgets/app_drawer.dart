import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../screens/home_screen.dart';
import '../screens/catalog_screen.dart';
import '../screens/lookbook_screen.dart';
import '../screens/contact_screen.dart';
import '../screens/profile_screen.dart';
/// AppDrawer: menú lateral que aparece al tocar el ícono ☰.
/// Se reutiliza en varias pantallas.
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

            // Logo / Nombre de la marca
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

            // Opciones del menú
            _DrawerItem(
              label: 'INICIO',
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const HomeScreen()),
                );
              },
            ),
            _DrawerItem(
              label: 'CATÁLOGO',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const CatalogScreen()),
                );
              },
            ),
            _DrawerItem(
              label: 'LOOKBOOK',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const LookbookScreen()),
                );
              },
            ),
            _DrawerItem(
              label: 'CONTACTO',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const ContactScreen()),
                );
              },
            ),
            _DrawerItem(
              label: 'MI CUENTA',
              onTap: () {
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

/// _DrawerItem: widget privado para cada opción del menú.
/// Lo hacemos aparte para no repetir código 4 veces.
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