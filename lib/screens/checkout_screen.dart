import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../widgets/custom_header.dart';
import '../models/cart_service.dart';
import 'success_screen.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.fondo,
      body: SafeArea(
        child: Column(
          children: [
            const CustomHeader(title: 'CHECKOUT'),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'DATOS DE ENVÍO',
                      style: TextStyle(
                        fontSize: 14,
                        letterSpacing: 2,
                        color: AppColors.marronOscuro,
                      ),
                    ),
                    const SizedBox(height: 20),

                    _campo('Nombre completo'),
                    _campo('Email'),
                    _campo('Teléfono'),
                    _campo('Dirección'),
                    _campo('Ciudad'),
                    _campo('Código postal'),

                    const SizedBox(height: 32),

                    const Text(
                      'MÉTODO DE PAGO',
                      style: TextStyle(
                        fontSize: 14,
                        letterSpacing: 2,
                        color: AppColors.marronOscuro,
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'Transferencia bancaria / Coordinar por WhatsApp',
                      style: TextStyle(
                        fontSize: 13,
                        color: AppColors.marron,
                      ),
                    ),

                    const SizedBox(height: 40),

                    ElevatedButton(
                      onPressed: () {
                        // Vacía el carrito (simulamos compra exitosa)
                        CartService().vaciar();
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const SuccessScreen(),
                          ),
                        );
                      },
                      child: const Text('FINALIZAR COMPRA'),
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

  Widget _campo(String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextField(
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: AppColors.marronOscuro),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.marronClaro),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.marron),
          ),
        ),
      ),
    );
  }
}