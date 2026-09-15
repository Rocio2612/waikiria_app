import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../widgets/custom_header.dart';
import '../models/cart_service.dart';
import '../models/cart_item.dart';
import 'checkout_screen.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.fondo,
      body: SafeArea(
        child: Column(
          children: [
            const CustomHeader(title: 'CARRITO', mostrarVolver: true),

            Expanded(
              // ListenableBuilder escucha cambios del carrito
              child: ListenableBuilder(
                listenable: CartService(),
                builder: (context, _) {
                  final items = CartService().items;

                  if (items.isEmpty) {
                    return const Center(
                      child: Text(
                        'Tu carrito está vacío',
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColors.marronOscuro,
                        ),
                      ),
                    );
                  }

                  return Column(
                    children: [
                      // Lista de items con scroll
                      Expanded(
                        child: ListView.builder(
                          padding: const EdgeInsets.all(16),
                          itemCount: items.length,
                          itemBuilder: (context, index) {
                            return _CartItemTile(item: items[index]);
                          },
                        ),
                      ),

                      // Resumen al pie (subtotal, envío, total, botón)
                      _buildResumen(context),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildResumen(BuildContext context) {
    final subtotal = CartService().total;
    const envio = 5000.0;
    final total = subtotal + envio;

    return Container(
      padding: const EdgeInsets.all(20),
      color: AppColors.cremaOscuro,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _resumenRow('SUBTOTAL', subtotal),
          _resumenRow('ENVÍO', envio),
          const Divider(color: AppColors.marronClaro),
          _resumenRow('TOTAL', total, bold: true),

          const SizedBox(height: 16),
          // Botón VOLVER
          OutlinedButton(
            onPressed: () => Navigator.pop(context),
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: AppColors.marron),
              padding: const EdgeInsets.symmetric(vertical: 10),
            ),
            child: const Text(
              'VOLVER',
              style: TextStyle(
                color: AppColors.marron,
                letterSpacing: 2,
                fontSize: 12,
              ),
            ),
          ),

          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const CheckoutScreen()),
              );
            },
            child: const Text('CONTINUAR COMPRA'),
          ),
        ],
      ),
    );
  }

  Widget _resumenRow(String label, double valor, {bool bold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: bold ? 14 : 12,
              letterSpacing: 1.5,
              fontWeight: bold ? FontWeight.bold : FontWeight.normal,
              color: AppColors.marronOscuro,
            ),
          ),
          Text(
            '\$${valor.toStringAsFixed(0)}',
            style: TextStyle(
              fontSize: bold ? 16 : 13,
              fontWeight: bold ? FontWeight.bold : FontWeight.normal,
              color: AppColors.marronOscuro,
            ),
          ),
        ],
      ),
    );
  }
}

/// _CartItemTile: widget privado para cada item del carrito
class _CartItemTile extends StatelessWidget {
  final CartItem item;

  const _CartItemTile({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      color: AppColors.blanco,
      child: Row(
        children: [
          // Imagen chica
          SizedBox(
            width: 80,
            height: 100,
            child: Image.network(
              item.producto.imagen,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(
                color: AppColors.cremaOscuro,
                child: const Icon(Icons.image, color: AppColors.marronClaro),
              ),
            ),
          ),
          const SizedBox(width: 12),

          // Info del producto
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.producto.nombre.toUpperCase(),
                  style: const TextStyle(
                    fontSize: 12,
                    letterSpacing: 1,
                    color: AppColors.marronOscuro,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Talle: ${item.talle}',
                  style: const TextStyle(
                    fontSize: 11,
                    color: AppColors.marron,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '\$${item.producto.precio.toStringAsFixed(0)}',
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: AppColors.marronOscuro,
                  ),
                ),
                const SizedBox(height: 8),

                // Cantidad + / -
                Row(
                  children: [
                    _miniButton(
                      icon: Icons.remove,
                      onTap: () {
                        if (item.cantidad > 1) {
                          CartService().quitar(item);
                          CartService().agregar(
                            item.producto,
                            item.talle,
                            item.cantidad - 1,
                          );
                        }
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        '${item.cantidad}',
                        style: const TextStyle(
                          color: AppColors.marronOscuro,
                        ),
                      ),
                    ),
                    _miniButton(
                      icon: Icons.add,
                      onTap: () {
                        CartService().agregar(item.producto, item.talle, 1);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Botón borrar
          IconButton(
            icon: const Icon(Icons.delete_outline,
                color: AppColors.marron, size: 20),
            onPressed: () {
              CartService().quitar(item);
            },
          ),
        ],
      ),
    );
  }

  Widget _miniButton({required IconData icon, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 26,
        height: 26,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.marron),
        ),
        child: Icon(icon, color: AppColors.marron, size: 14),
      ),
    );
  }
}