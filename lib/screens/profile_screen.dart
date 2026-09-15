import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../widgets/custom_header.dart';
import '../widgets/app_drawer.dart';
import 'login_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.fondo,
      drawer: const AppDrawer(),
      body: SafeArea(
        child: Column(
          children: [
            const CustomHeader(title: 'MI CUENTA', mostrarVolver: true),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Avatar + nombre (datos ficticios)
                    const CircleAvatar(
                      radius: 50,
                      backgroundColor: AppColors.cremaOscuro,
                      child: Icon(
                        Icons.person,
                        size: 60,
                        color: AppColors.marron,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Center(
                      child: Text(
                        'Rocío Correa',
                        style: TextStyle(
                          fontSize: 18,
                          letterSpacing: 1,
                          color: AppColors.marronOscuro,
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Center(
                      child: Text(
                        'rocio@waikiria.com',
                        style: TextStyle(
                          fontSize: 13,
                          color: AppColors.marron,
                        ),
                      ),
                    ),

                    const SizedBox(height: 40),

                    _menuItem(
                      icon: Icons.shopping_bag_outlined,
                      label: 'MIS PEDIDOS',
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Mis pedidos (próximamente)'),
                          ),
                        );
                      },
                    ),
                    _menuItem(
                      icon: Icons.favorite_border,
                      label: 'FAVORITOS',
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Favoritos (próximamente)'),
                          ),
                        );
                      },
                    ),
                    _menuItem(
                      icon: Icons.location_on_outlined,
                      label: 'MIS DIRECCIONES',
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Direcciones (próximamente)'),
                          ),
                        );
                      },
                    ),
                    _menuItem(
                      icon: Icons.settings_outlined,
                      label: 'CONFIGURACIÓN',
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Configuración (próximamente)'),
                          ),
                        );
                      },
                    ),

                    const SizedBox(height: 40),

                    // Botón cerrar sesión (vuelve al login)
                    OutlinedButton(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const LoginScreen(),
                          ),
                              (route) => false,
                        );
                      },
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: AppColors.marron),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                      child: const Text(
                        'CERRAR SESIÓN',
                        style: TextStyle(
                          color: AppColors.marron,
                          letterSpacing: 1.5,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _menuItem({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: AppColors.marronOscuro),
      title: Text(
        label,
        style: const TextStyle(
          letterSpacing: 2,
          fontSize: 13,
          color: AppColors.marronOscuro,
        ),
      ),
      trailing: const Icon(
        Icons.chevron_right,
        color: AppColors.marronClaro,
      ),
      onTap: onTap,
    );
  }
}