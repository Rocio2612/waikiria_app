import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../widgets/custom_header.dart';
import '../widgets/bottom_nav_bar.dart';
import '../../models/categoria.dart';
import '../../data/repositories/categoria_repository.dart';
import 'category_screen.dart';

class CatalogScreen extends StatefulWidget {
  const CatalogScreen({super.key});

  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  final CategoriaRepository _repository = CategoriaRepository();
  List<Categoria> _categorias = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _cargarCategorias();
  }

  Future<void> _cargarCategorias() async {
    setState(() => _loading = true);
    final categorias = await _repository.getCategorias();
    if (mounted) {
      setState(() {
        _categorias = categorias;
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
            const CustomHeader(title: 'CATÁLOGO'),
            Expanded(
              child: _loading
                  ? const Center(
                child: CircularProgressIndicator(
                  color: AppColors.marron,
                ),
              )
                  : SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 32),
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
                    const Text(
                      '"Explora nuestra esencia"',
                      style: TextStyle(
                        fontSize: 12,
                        fontStyle: FontStyle.italic,
                        color: AppColors.marron,
                      ),
                    ),
                    const SizedBox(height: 32),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.75,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 20,
                        ),
                        itemCount: _categorias.length,
                        itemBuilder: (context, index) {
                          final cat = _categorias[index];
                          return _buildCategoriaCard(context, cat);
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
      bottomNavigationBar: const BottomNavBar(selectedIndex: 1),
    );
  }

  Widget _buildCategoriaCard(BuildContext context, Categoria cat) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => CategoryScreen(categoria: cat),
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.marron, width: 0.5),
              ),
              child: Image.asset(
                cat.imagen,
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
          Text(
            cat.nombre,
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