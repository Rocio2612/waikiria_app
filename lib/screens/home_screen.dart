import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../widgets/custom_header.dart';
import '../widgets/app_drawer.dart';
import '../models/categoria.dart';
import 'category_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.fondo,
      drawer: const AppDrawer(),
      body: SafeArea(
        child: Column(
          children: [
            const CustomHeader(title: 'WAIKIRIA'),
            Expanded(
              child: ListView(
                children: [
                  _buildBarraPromos(),
                  _buildBuscador(),
                  _buildBanner(),
                  const SizedBox(height: 40),
                  _buildCatalogoSection(context),
                  const SizedBox(height: 40),
                  _buildLookbookSection(context),
                  const SizedBox(height: 40),
                  _buildContactoSection(),
                  const SizedBox(height: 40),
                  _buildFooter(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBarraPromos() {
    return Container(
      color: AppColors.marron,
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          Text(
            '10% OFF TRANSFERENCIA / 15% OFF EFECTIVO',
            style: TextStyle(
              color: AppColors.blanco,
              fontSize: 9,
              letterSpacing: 0.5,
            ),
          ),
          Text(
            'GIFT CARD',
            style: TextStyle(
              color: AppColors.blanco,
              fontSize: 9,
              letterSpacing: 0.5,
            ),
          ),
          Text(
            'ENVÍOS',
            style: TextStyle(
              color: AppColors.blanco,
              fontSize: 9,
              letterSpacing: 0.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBuscador() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.blanco,
          border: Border.all(color: AppColors.marron, width: 0.5),
        ),
        child: const TextField(
          decoration: InputDecoration(
            hintText: 'Buscar productos...',
            hintStyle: TextStyle(
              color: AppColors.marron,
              fontSize: 13,
              letterSpacing: 0.5,
            ),
            prefixIcon: Icon(
              Icons.search,
              color: AppColors.marron,
              size: 20,
            ),
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(vertical: 14),
          ),
        ),
      ),
    );
  }

  Widget _buildBanner() {
    return SizedBox(
      height: 400,
      child: Image.asset(
        'img/images/modelo.jpg',
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) => Container(
          color: AppColors.cremaOscuro,
          child: const Center(
            child: Icon(
              Icons.image,
              size: 80,
              color: AppColors.marronClaro,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCatalogoSection(BuildContext context) {
    return Column(
      children: [
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
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.75,
              crossAxisSpacing: 12,
              mainAxisSpacing: 20,
            ),
            itemCount: categorias.length,
            itemBuilder: (context, index) {
              final cat = categorias[index];
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
                          border: Border.all(
                            color: AppColors.marron,
                            width: 0.5,
                          ),
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
            },
          ),
        ),
      ],
    );
  }

  Widget _buildLookbookSection(BuildContext context) {
    final estilos = [
      {'nombre': 'URBANO', 'imagen': 'img/images/conjRayado.jpeg'},
      {'nombre': 'CLÁSICO', 'imagen': 'img/images/conj_chalecoMarronJean.jpeg'},
      {'nombre': 'ELEGANTE', 'imagen': 'img/images/conjElegSi.jpeg'},
      {'nombre': 'CASUAL', 'imagen': 'img/images/conjChica.jpeg'},
    ];

    return Column(
      children: [
        const Text(
          'LOOKBOOK',
          style: TextStyle(
            fontSize: 22,
            letterSpacing: 4,
            fontWeight: FontWeight.w500,
            color: AppColors.marronOscuro,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          '"Una visión de nuestra última colección"',
          style: TextStyle(
            fontSize: 12,
            fontStyle: FontStyle.italic,
            color: AppColors.marron,
          ),
        ),
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.8,
              crossAxisSpacing: 12,
              mainAxisSpacing: 16,
            ),
            itemCount: estilos.length,
            itemBuilder: (context, index) {
              final estilo = estilos[index];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => _mostrarFoto(context, estilo['imagen']!),
                      child: Image.asset(
                        estilo['imagen']!,
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
                    estilo['nombre']!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 11,
                      letterSpacing: 2,
                      color: AppColors.marronOscuro,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }

  void _mostrarFoto(BuildContext context, String imagen) {
    showDialog(
      context: context,
      builder: (_) => Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.all(16),
        child: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Image.asset(
            imagen,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }

  Widget _buildContactoSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
            child: Text(
              'CONTACTANOS',
              style: TextStyle(
                fontSize: 22,
                letterSpacing: 4,
                fontWeight: FontWeight.w500,
                color: AppColors.marronOscuro,
              ),
            ),
          ),
          const SizedBox(height: 8),
          const Center(
            child: Text(
              'Escribinos y en breve nos pondremos en contacto',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                fontStyle: FontStyle.italic,
                color: AppColors.marron,
              ),
            ),
          ),
          const SizedBox(height: 24),
          _campoFormulario('NOMBRE'),
          const SizedBox(height: 16),
          _campoFormulario('EMAIL'),
          const SizedBox(height: 16),
          _campoMensaje('MENSAJE'),
          const SizedBox(height: 20),
          Center(
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 40,
                vertical: 12,
              ),
              color: AppColors.marron,
              child: const Text(
                'ENVIAR',
                style: TextStyle(
                  color: AppColors.blanco,
                  fontSize: 12,
                  letterSpacing: 3,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _campoFormulario(String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 10,
            letterSpacing: 2,
            color: AppColors.marronOscuro,
          ),
        ),
        const SizedBox(height: 6),
        Container(height: 40, color: AppColors.cremaOscuro),
      ],
    );
  }

  Widget _campoMensaje(String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 10,
            letterSpacing: 2,
            color: AppColors.marronOscuro,
          ),
        ),
        const SizedBox(height: 6),
        Container(height: 80, color: AppColors.cremaOscuro),
      ],
    );
  }

  Widget _buildFooter() {
    return Container(
      color: AppColors.cremaOscuro,
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'WAIKIRIA',
            style: TextStyle(
              fontSize: 18,
              letterSpacing: 4,
              color: AppColors.marronOscuro,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            '"Tu estilo, tu identidad."',
            style: TextStyle(
              fontSize: 11,
              fontStyle: FontStyle.italic,
              color: AppColors.marron,
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'ENLACES',
            style: TextStyle(
              fontSize: 10,
              letterSpacing: 2,
              color: AppColors.marronOscuro,
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            'INICIO  ·  CATÁLOGO  ·  LOOKBOOK',
            style: TextStyle(fontSize: 10, color: AppColors.marron),
          ),
          const SizedBox(height: 20),
          const Text(
            'CONTÁCTANOS',
            style: TextStyle(
              fontSize: 10,
              letterSpacing: 2,
              color: AppColors.marronOscuro,
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            'Teléfono  ·  TikTok',
            style: TextStyle(fontSize: 10, color: AppColors.marron),
          ),
          const SizedBox(height: 20),
          const Text(
            '© 2026 WAIKIRIA. Todos los derechos reservados.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 9, color: AppColors.marron),
          ),
        ],
      ),
    );
  }
}