import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../models/cart_service.dart';
import '../screens/cart_screen.dart';

/// CustomHeader: barra superior reutilizable.
/// - Si [mostrarVolver] es true, muestra flecha ← (volver atrás)
/// - Si es false, muestra ☰ (abrir menú lateral)
class CustomHeader extends StatelessWidget {
  final String title;
  final bool mostrarVolver;

  const CustomHeader({
    super.key,
    required this.title,
    this.mostrarVolver = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.fondo,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Ícono izquierdo: ☰ o ←
          IconButton(
            icon: Icon(
              mostrarVolver ? Icons.arrow_back : Icons.menu,
              color: AppColors.marronOscuro,
            ),
            onPressed: () {
              if (mostrarVolver) {
                Navigator.pop(context);
              } else {
                Scaffold.of(context).openDrawer();
              }
            },
          ),

          // Título
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              letterSpacing: 4,
              fontWeight: FontWeight.w500,
              color: AppColors.marronOscuro,
            ),
          ),

          // Ícono de carrito con badge + texto CARRITO
          ListenableBuilder(
            listenable: CartService(),
            builder: (context, _) {
              final cantidad = CartService().totalItems;
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const CartScreen(),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          const Icon(
                            Icons.shopping_bag_outlined,
                            color: AppColors.marronOscuro,
                            size: 26,
                          ),
                          if (cantidad > 0)
                            Positioned(
                              right: -8,
                              top: -6,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 5,
                                  vertical: 2,
                                ),
                                constraints:
                                const BoxConstraints(minWidth: 18),
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: AppColors.fondo,
                                    width: 2,
                                  ),
                                ),
                                child: Text(
                                  '$cantidad',
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(height: 2),
                      const Text(
                        'CARRITO',
                        style: TextStyle(
                          fontSize: 8,
                          letterSpacing: 1,
                          color: AppColors.marronOscuro,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}