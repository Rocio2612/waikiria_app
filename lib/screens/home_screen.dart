import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../widgets/custom_header.dart';
import '../widgets/app_drawer.dart';
import 'catalog_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.fondo,
      drawer: const AppDrawer(), // 👈 activa el menú lateral
      body: SafeArea(
        child: Column(
          children: [
            // 1. Header fijo arriba (no se mueve al scrollear)
            const CustomHeader(title: 'WAIKIRIA'),

            // 2. Resto de la pantalla con scroll
            Expanded(
              child: ListView(
                children: [
                  _buildBanner(),
                  const SizedBox(height: 24),
                  _buildColeccionSection(context),
                  const SizedBox(height: 40),
                  _buildLookbookSection(),
                  const SizedBox(height: 40),
                  _buildContactoSection(),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 🔻 Banner principal con imagen + texto encima
  Widget _buildBanner() {
    return SizedBox(
      height: 350,
      child: Stack(
        children: [
          // Fondo: imagen placeholder (por ahora un color)
          Container(
            color: AppColors.cremaOscuro,
            child: const Center(
              child: Icon(Icons.image, size: 80, color: AppColors.marronClaro),
            ),
          ),

          // Texto encima
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Center(
              child: Column(
                children: [
                  const Text(
                    'VER COLECCIÓN',
                    style: TextStyle(
                      color: AppColors.blanco,
                      fontSize: 14,
                      letterSpacing: 4,
                      backgroundColor: AppColors.marron,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 🔻 Sección de colección con tarjetas de categoría
  Widget _buildColeccionSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            'COLECCIÓN',
            style: TextStyle(
              fontSize: 18,
              letterSpacing: 4,
              color: AppColors.marronOscuro,
            ),
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 60,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 24),
            children: const [
              _CategoryChip(label: 'JEANS'),
              _CategoryChip(label: 'ABRIGOS'),
              _CategoryChip(label: 'REMERAS'),
              _CategoryChip(label: 'ACCESORIOS'),
            ],
          ),
        ),
      ],
    );
  }

  // 🔻 Lookbook con 2 imágenes
  Widget _buildLookbookSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            'LOOKBOOK',
            style: TextStyle(
              fontSize: 18,
              letterSpacing: 4,
              color: AppColors.marronOscuro,
            ),
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 260,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 24),
            children: [
              _buildLookbookCard(),
              const SizedBox(width: 16),
              _buildLookbookCard(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildLookbookCard() {
    return Container(
      width: 180,
      color: AppColors.cremaOscuro,
      child: const Center(
        child: Icon(Icons.checkroom, size: 60, color: AppColors.marronClaro),
      ),
    );
  }

  // 🔻 Sección de contacto al final del scroll
  Widget _buildContactoSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'CONTACTANOS',
            style: TextStyle(
              fontSize: 18,
              letterSpacing: 4,
              color: AppColors.marronOscuro,
            ),
          ),
          const SizedBox(height: 16),
          _buildContactoItem(Icons.email_outlined, 'EMAIL'),
          _buildContactoItem(Icons.chat_bubble_outline, 'WHATSAPP'),
          _buildContactoItem(Icons.camera_alt_outlined, 'INSTAGRAM'),
          _buildContactoItem(Icons.location_on_outlined, 'UBICACIÓN'),
        ],
      ),
    );
  }

  Widget _buildContactoItem(IconData icon, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(icon, color: AppColors.marronOscuro, size: 22),
          const SizedBox(width: 16),
          Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              letterSpacing: 2,
              color: AppColors.marronOscuro,
            ),
          ),
        ],
      ),
    );
  }
}

/// Widget privado para los "chips" de categoría (JEANS, ABRIGOS, etc.)
class _CategoryChip extends StatelessWidget {
  final String label;

  const _CategoryChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.marron,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Center(
        child: Text(
          label,
          style: const TextStyle(
            color: AppColors.blanco,
            fontSize: 12,
            letterSpacing: 2,
          ),
        ),
      ),
    );
  }
}