import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../widgets/custom_header.dart';
import '../widgets/app_drawer.dart';
import '../widgets/product_card.dart';
import '../models/producto.dart';

class CatalogScreen extends StatefulWidget {
  const CatalogScreen({super.key});

  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  String _categoriaSeleccionada = 'TODOS';

  final List<String> _categorias = [
    'TODOS',
    'JEANS',
    'ABRIGOS',
    'REMERAS',
    'ACCESORIOS',
  ];

  List<Producto> get _productosFiltrados {
    if (_categoriaSeleccionada == 'TODOS') {
      return productosDemo;
    }
    return productosDemo
        .where((p) => p.categoria == _categoriaSeleccionada)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.fondo,
      drawer: const AppDrawer(),
      body: SafeArea(
        child: Column(
          children: [
            const CustomHeader(title: 'CATÁLOGO'),

            // Chips de categorías
            SizedBox(
              height: 60,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: _categorias.length,
                itemBuilder: (context, index) {
                  final cat = _categorias[index];
                  final seleccionada = cat == _categoriaSeleccionada;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _categoriaSeleccionada = cat;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 8, top: 12, bottom: 12),
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: seleccionada
                            ? AppColors.marron
                            : Colors.transparent,
                        border: Border.all(color: AppColors.marron),
                      ),
                      child: Center(
                        child: Text(
                          cat,
                          style: TextStyle(
                            fontSize: 11,
                            letterSpacing: 1.5,
                            color: seleccionada
                                ? AppColors.blanco
                                : AppColors.marronOscuro,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            // Grid de productos
            Expanded(
              child: _productosFiltrados.isEmpty
                  ? const Center(
                child: Text(
                  'No hay productos en esta categoría',
                  style: TextStyle(color: AppColors.marronOscuro),
                ),
              )
                  : GridView.builder(
                padding: const EdgeInsets.all(16),
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.58,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
                itemCount: _productosFiltrados.length,
                itemBuilder: (context, index) {
                  return ProductCard(producto: _productosFiltrados[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}