import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

/// CustomHeader: barra superior reutilizable.
/// La usamos en Home, Catálogo, Producto, etc.
/// Recibe un título y muestra íconos de menú (izquierda) y carrito (derecha).
class CustomHeader extends StatelessWidget {
  final String title;

  const CustomHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.fondo,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Ícono de menú (☰) - abre el Drawer
          IconButton(
            icon: const Icon(Icons.menu, color: AppColors.marronOscuro),
            onPressed: () {
              // Abre el menú lateral (Drawer) del Scaffold
              Scaffold.of(context).openDrawer();
            },
          ),

          // Título centrado
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              letterSpacing: 4,
              fontWeight: FontWeight.w500,
              color: AppColors.marronOscuro,
            ),
          ),

          // Ícono de carrito
          IconButton(
            icon: const Icon(Icons.shopping_bag_outlined,
                color: AppColors.marronOscuro),
            onPressed: () {
              // TODO: navegar a la pantalla del carrito
            },
          ),
        ],
      ),
    );
  }
}