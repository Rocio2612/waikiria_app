import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../widgets/custom_header.dart';
import '../widgets/app_drawer.dart';

class LookbookScreen extends StatelessWidget {
  const LookbookScreen({super.key});

  // Imágenes de prueba (picsum). Después las reemplazamos por las de Figma.
  final List<String> _outfits = const [
    'https://picsum.photos/id/1011/400/600',
    'https://picsum.photos/id/1027/400/600',
    'https://picsum.photos/id/1035/400/600',
    'https://picsum.photos/id/1062/400/600',
    'https://picsum.photos/id/1074/400/600',
    'https://picsum.photos/id/1080/400/600',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.fondo,
      drawer: const AppDrawer(),
      body: SafeArea(
        child: Column(
          children: [
            const CustomHeader(title: 'LOOKBOOK'),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.65,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemCount: _outfits.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => _mostrarFoto(context, _outfits[index]),
                    child: Image.network(
                      _outfits[index],
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, progress) {
                        if (progress == null) return child;
                        return Container(
                          color: AppColors.cremaOscuro,
                          child: const Center(
                            child: CircularProgressIndicator(
                              color: AppColors.marron,
                            ),
                          ),
                        );
                      },
                      errorBuilder: (_, __, ___) => Container(
                        color: AppColors.cremaOscuro,
                        child: const Icon(
                          Icons.image,
                          color: AppColors.marronClaro,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Al tocar una foto, la muestra en pantalla completa (modal)
  void _mostrarFoto(BuildContext context, String url) {
    showDialog(
      context: context,
      builder: (_) => Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.all(16),
        child: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Image.network(url, fit: BoxFit.contain),
        ),
      ),
    );
  }
}