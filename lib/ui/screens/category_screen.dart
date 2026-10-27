import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../widgets/custom_header.dart';
import '../../models/categoria.dart';
import '../../models/producto.dart';
import '../../data/repositories/producto_repository.dart';
import '../widgets/product_card.dart';

class CategoryScreen extends StatefulWidget {
  final Categoria categoria;

  const CategoryScreen({super.key, required this.categoria});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final ProductoRepository _repository = ProductoRepository();
  late String _subcategoriaSeleccionada;
  List<Producto> _productos = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _subcategoriaSeleccionada = widget.categoria.subcategorias.first;
    _cargarProductos();
  }

  Future<void> _cargarProductos() async {
    setState(() => _loading = true);
    final productos = await _repository.getProductosPorSubcategoria(
      widget.categoria.nombre,
      _subcategoriaSeleccionada,
    );
    if (mounted) {
      setState(() {
        _productos = productos;
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.fondo,
      body: SafeArea(
        child: Column(
          children: [
            CustomHeader(
              title: widget.categoria.nombre,
              mostrarVolver: true,
            ),
            SizedBox(
              height: 60,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: widget.categoria.subcategorias.length,
                itemBuilder: (context, index) {
                  final sub = widget.categoria.subcategorias[index];
                  final seleccionada = sub == _subcategoriaSeleccionada;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _subcategoriaSeleccionada = sub;
                      });
                      _cargarProductos();
                    },
                    child: Container(
                      margin: const EdgeInsets.only(
                          right: 8, top: 12, bottom: 12),
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: seleccionada
                            ? AppColors.marron
                            : Colors.transparent,
                        border: Border.all(color: AppColors.marron),
                      ),
                      child: Center(
                        child: Text(
                          sub.toUpperCase(),
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
            Expanded(
              child: _loading
                  ? const Center(
                child: CircularProgressIndicator(
                  color: AppColors.marron,
                ),
              )
                  : _productos.isEmpty
                  ? const Center(
                child: Padding(
                  padding: EdgeInsets.all(24),
                  child: Text(
                    'Todavía no hay productos en esta subcategoría.\nPronto vas a ver novedades.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.marron,
                    ),
                  ),
                ),
              )
                  : GridView.builder(
                padding: const EdgeInsets.all(16),
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
                itemCount: _productos.length,
                itemBuilder: (context, index) {
                  return ProductCard(
                    producto: _productos[index],
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: OutlinedButton(
                onPressed: () => Navigator.pop(context),
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: AppColors.marron),
                  padding: const EdgeInsets.symmetric(
                      vertical: 12, horizontal: 32),
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
            ),
          ],
        ),
      ),
    );
  }
}