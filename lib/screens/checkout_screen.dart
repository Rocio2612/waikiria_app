import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme/app_colors.dart';
import '../widgets/custom_header.dart';
import '../models/cart_service.dart';
import 'success_screen.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final _nombreController = TextEditingController();
  final _emailController = TextEditingController();
  final _telefonoController = TextEditingController();
  final _direccionController = TextEditingController();
  final _ciudadController = TextEditingController();
  final _cpController = TextEditingController();

  @override
  void dispose() {
    _nombreController.dispose();
    _emailController.dispose();
    _telefonoController.dispose();
    _direccionController.dispose();
    _ciudadController.dispose();
    _cpController.dispose();
    super.dispose();
  }

  /// Envía el pedido por WhatsApp
  Future<void> _finalizarCompra() async {
    // Validar que todos los campos estén completos
    if (_nombreController.text.trim().isEmpty ||
        _emailController.text.trim().isEmpty ||
        _telefonoController.text.trim().isEmpty ||
        _direccionController.text.trim().isEmpty ||
        _ciudadController.text.trim().isEmpty ||
        _cpController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Completá todos los datos'),
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }

    // Armar el mensaje con los datos del pedido
    final items = CartService().items;
    final total = CartService().total;

    final StringBuffer mensaje = StringBuffer();
    mensaje.writeln('¡Hola Waikiria! Quiero hacer un pedido:');
    mensaje.writeln('');
    mensaje.writeln('👤 *MIS DATOS*');
    mensaje.writeln('Nombre: ${_nombreController.text}');
    mensaje.writeln('Email: ${_emailController.text}');
    mensaje.writeln('Teléfono: ${_telefonoController.text}');
    mensaje.writeln('Dirección: ${_direccionController.text}');
    mensaje.writeln('Ciudad: ${_ciudadController.text}');
    mensaje.writeln('CP: ${_cpController.text}');
    mensaje.writeln('');
    mensaje.writeln('🛍️ *MI PEDIDO*');
    for (final item in items) {
      mensaje.writeln(
        '• ${item.producto.nombre} (Talle ${item.talle}) x${item.cantidad} - \$${item.subtotal.toStringAsFixed(0)}',
      );
    }
    mensaje.writeln('');
    mensaje.writeln('💰 *TOTAL: \$${total.toStringAsFixed(0)}*');
    mensaje.writeln('');
    mensaje.writeln('¿Cómo coordinamos el pago y el envío?');

    final mensajeCodificado = Uri.encodeComponent(mensaje.toString());

    // Reemplazá este número por el de Waikiria
    final url = Uri.parse(
      'https://wa.me/5491112345678?text=$mensajeCodificado',
    );

    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);

      // Vaciar el carrito después de enviar
      CartService().vaciar();

      // Ir a la pantalla de confirmación
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const SuccessScreen()),
        );
      }
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('No se pudo abrir WhatsApp')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.fondo,
      body: SafeArea(
        child: Column(
          children: [
            const CustomHeader(title: 'CHECKOUT', mostrarVolver: true),

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

                    _campo('Nombre completo', _nombreController),
                    _campo('Email', _emailController,
                        keyboard: TextInputType.emailAddress),
                    _campo('Teléfono', _telefonoController,
                        keyboard: TextInputType.phone),
                    _campo('Dirección', _direccionController),
                    _campo('Ciudad', _ciudadController),
                    _campo('Código postal', _cpController,
                        keyboard: TextInputType.number),

                    const SizedBox(height: 32),

                    const Text(
                      'PRÓXIMO PASO',
                      style: TextStyle(
                        fontSize: 14,
                        letterSpacing: 2,
                        color: AppColors.marronOscuro,
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'Al confirmar, te vamos a redirigir a WhatsApp para coordinar el pago y el envío de tu pedido.',
                      style: TextStyle(
                        fontSize: 13,
                        color: AppColors.marron,
                      ),
                    ),

                    const SizedBox(height: 40),

                    ElevatedButton(
                      onPressed: _finalizarCompra,
                      child: const Text(
                        'ENVIAR PEDIDO POR WHATSAPP',
                        style: TextStyle(
                          letterSpacing: 1.5,
                          fontSize: 12,
                        ),
                      ),
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

  Widget _campo(
      String label,
      TextEditingController controller, {
        TextInputType keyboard = TextInputType.text,
      }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextField(
        controller: controller,
        keyboardType: keyboard,
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