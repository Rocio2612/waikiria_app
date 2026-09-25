import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme/app_colors.dart';
import '../widgets/custom_header.dart';
import '../widgets/app_drawer.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.fondo,
      drawer: const AppDrawer(),
      body: SafeArea(
        child: Column(
          children: [
            const CustomHeader(title: 'CONTACTO'),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
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
                    const SizedBox(height: 24),

                    _contactoItem(
                      context: context,
                      icon: Icons.email_outlined,
                      label: 'EMAIL',
                      sublabel: 'hola@waikiria.com',
                      onTap: () => _abrirEmail(),
                    ),
                    _contactoItem(
                      context: context,
                      icon: Icons.chat_bubble_outline,
                      label: 'WHATSAPP',
                      sublabel: '+54 9 11 1234-5678',
                      onTap: () => _abrirWhatsApp(),
                    ),
                    _contactoItem(
                      context: context,
                      icon: Icons.camera_alt_outlined,
                      label: 'INSTAGRAM',
                      sublabel: '@waikiria',
                      onTap: () => _abrirInstagram(),
                    ),
                    _contactoItem(
                      context: context,
                      icon: Icons.location_on_outlined,
                      label: 'UBICACIÓN',
                      sublabel: 'Buenos Aires, Argentina',
                      onTap: () => _abrirMapa(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _contactoItem({
    required BuildContext context,
    required IconData icon,
    required String label,
    required String sublabel,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        color: AppColors.blanco,
        child: Row(
          children: [
            Icon(icon, color: AppColors.marronOscuro, size: 28),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: const TextStyle(
                      fontSize: 13,
                      letterSpacing: 2,
                      color: AppColors.marronOscuro,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    sublabel,
                    style: const TextStyle(
                      fontSize: 11,
                      color: AppColors.marron,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: AppColors.marronClaro,
              size: 14,
            ),
          ],
        ),
      ),
    );
  }

  // 🔻 Funciones que abren apps externas
  Future<void> _abrirEmail() async {
    final uri = Uri.parse('mailto:hola@waikiria.com');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  Future<void> _abrirWhatsApp() async {
    final uri = Uri.parse('https://wa.me/5491112345678?text=Hola!%20Quiero%20consultar%20por%20un%20producto%20de%20Waikiria.');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  Future<void> _abrirInstagram() async {
    final uri = Uri.parse('https://instagram.com/waikiria');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  Future<void> _abrirMapa() async {
    final uri = Uri.parse('https://maps.google.com/?q=Buenos+Aires+Argentina');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }
}