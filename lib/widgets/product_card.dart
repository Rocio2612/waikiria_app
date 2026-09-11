import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../models/producto.dart';
import '../screens/product_detail_screen.dart';

/// ProductCard: tarjeta reutilizable que muestra un producto.
/// Se usa en el Catálogo, Categoría y otras pantallas.
class ProductCard extends StatelessWidget {
  final Producto producto;

  const ProductCard({super.key, required this.producto});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // Al tocar la tarjeta, navega al detalle del producto
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ProductDetailScreen(producto: producto),
          ),
        );
      },
      child: Container(
        color: AppColors.blanco,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Imagen del producto
            Expanded(
              child: Image.network(
                producto.imagen,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, progress) {
                  if (progress == null) return child;
                  return const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.marron,
                    ),
                  );
                },
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: AppColors.cremaOscuro,
                    child: const Center(
                      child: Icon(
                        Icons.image_not_supported,
                        color: AppColors.marronClaro,
                      ),
                    ),
                  );
                },
              ),
            ),

            // Información del producto
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    producto.nombre.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 11,
                      color: AppColors.marronOscuro,
                      letterSpacing: 1,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 6),
                  Text(
                    '\$${producto.precio.toStringAsFixed(0)}',
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: AppColors.marron,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    color: AppColors.marron,
                    child: const Center(
                      child: Text(
                        'VER PRODUCTO',
                        style: TextStyle(
                          color: AppColors.blanco,
                          fontSize: 10,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}