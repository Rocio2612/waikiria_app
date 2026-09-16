import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../widgets/custom_header.dart';
import '../widgets/app_drawer.dart';
import '../models/categoria.dart';
import 'category_screen.dart';

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.fondo,
      drawer: const AppDrawer(),
      body: SafeArea(
        child: Column(
          children: [
            const CustomHeader(title: 'CATÁLOGO'),

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 32),

                    // Título "CATÁLOGO" centrado
                    const Text(
                      'CATÁLOGO',
                      style: TextStyle(
                        fontSize: 22,
                        letterSpacing: 4,
                        fontWeight: FontWeight.w500,
                        color: AppColors.marronOscuro,
                      ),
                    ),
                    const SizedBox(height: 8),

                    // Subtítulo "Explora nuestra esencia"
                    const Text(
                      '"Explora nuestra esencia"',
                      style: TextStyle(
                        fontSize: 12,
                        fontStyle: FontStyle.italic,
                        color: AppColors.marron,
                      ),
                    ),

                    const SizedBox(height: 32),

                    // Grilla 2x2 con las 4 categorías grandes
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1.0,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 20,
                        ),
                        itemCount: categorias.length,
                        itemBuilder: (context, index) {
                          return _CategoriaCard(categoria: categorias[index]);
                        },
                      ),
                    ),

                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Tarjeta grande de categoría: imagen + nombre debajo.
class _CategoriaCard extends StatelessWidget {
  final Categoria categoria;

  const _CategoriaCard({required this.categoria});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => CategoryScreen(categoria: categoria),
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Imagen de la categoría
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.marron,
                  width: 0.5,
                ),
              ),
              child: Image.asset(
                categoria.imagen,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(
                  color: AppColors.cremaOscuro,
                  child: const Center(
                    child: Icon(
                      Icons.image,
                      color: AppColors.marronClaro,
                      size: 40,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),

          // Nombre de la categoría debajo
          Text(
            categoria.nombre,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 11,
              letterSpacing: 2,
              color: AppColors.marronOscuro,
            ),
          ),
        ],
      ),
    );
  }
}