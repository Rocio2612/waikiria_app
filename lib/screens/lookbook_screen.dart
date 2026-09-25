import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../widgets/custom_header.dart';
import '../widgets/app_drawer.dart';

class LookbookScreen extends StatefulWidget {
  const LookbookScreen({super.key});

  @override
  State<LookbookScreen> createState() => _LookbookScreenState();
}

class _LookbookScreenState extends State<LookbookScreen> {
  final estilos = [
    {
      'nombre': 'URBANO',
      'imagen': 'assets/images/conjRayado.jpeg',
    },
    {
      'nombre': 'CLÁSICO',
      'imagen': 'assets/images/conj_chalecoMarronJean.jpeg',
    },
    {
      'nombre': 'ELEGANTE',
      'imagen': 'assets/images/conjElegSi.jpeg',
    },
    {
      'nombre': 'CASUAL',
      'imagen': 'assets/images/conjChica.jpeg',
    },
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
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 24,
                  ),
                  child: Column(
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
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
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
                                  onTap: () => _mostrarFoto(
                                    context,
                                    estilo['imagen']!,
                                  ),
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
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
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
          child: Image.asset(imagen, fit: BoxFit.contain),
        ),
      ),
    );
  }
}