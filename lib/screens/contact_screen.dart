import 'package:flutter/material.dart';
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
            const CustomHeader(title: 'CATÁLOGO'),
            Expanded(
              child: Center(
                child: Text(
                  'Contacto (próximamente)',
                  style: TextStyle(fontSize: 18, color: AppColors.marronOscuro),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}