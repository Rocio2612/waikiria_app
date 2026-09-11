import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme/app_colors.dart';
import '../widgets/custom_header.dart';
import '../models/producto.dart';
import '../models/cart_service.dart';

class ProductDetailScreen extends StatefulWidget {
  final Producto producto;

  const ProductDetailScreen({super.key, required this.producto});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  String? _talleSeleccionado;
  int _cantidad = 1;

  @override
  Widget build(BuildContext context) {
    final producto = widget.producto;

    return Scaffold(
      backgroundColor: AppColors.fondo,
      body: SafeArea(
        child: Column(
          children: [
            const CustomHeader(title: 'PRODUCTO'),

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Imagen principal
                    SizedBox(
                      height: 400,
                      width: double.infinity,
                      child: Image.network(
                        producto.imagen,
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
                    ),

                    Padding(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Nombre
                          Text(
                            producto.nombre.toUpperCase(),
                            style: const TextStyle(
                              fontSize: 16,
                              letterSpacing: 2,
                              color: AppColors.marronOscuro,
                            ),
                          ),
                          const SizedBox(height: 8),

                          // Precio
                          Text(
                            '\$${producto.precio.toStringAsFixed(0)}',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: AppColors.marron,
                            ),
                          ),

                          const SizedBox(height: 24),

                          // Selector de talle
                          const Text(
                            'TALLES:',
                            style: TextStyle(
                              fontSize: 12,
                              letterSpacing: 2,
                              color: AppColors.marronOscuro,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Wrap(
                            spacing: 8,
                            children: producto.talles.map((talle) {
                              final seleccionado = talle == _talleSeleccionado;
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _talleSeleccionado = talle;
                                  });
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 8,
                                  ),
                                  decoration: BoxDecoration(
                                    color: seleccionado
                                        ? AppColors.marron
                                        : Colors.transparent,
                                    border: Border.all(
                                      color: AppColors.marron,
                                    ),
                                  ),
                                  child: Text(
                                    talle,
                                    style: TextStyle(
                                      color: seleccionado
                                          ? AppColors.blanco
                                          : AppColors.marronOscuro,
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),

                          const SizedBox(height: 24),

                          // Selector de cantidad
                          const Text(
                            'CANTIDAD:',
                            style: TextStyle(
                              fontSize: 12,
                              letterSpacing: 2,
                              color: AppColors.marronOscuro,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              _cantidadButton(
                                icon: Icons.remove,
                                onTap: () {
                                  if (_cantidad > 1) {
                                    setState(() => _cantidad--);
                                  }
                                },
                              ),
                              const SizedBox(width: 16),
                              Text(
                                '$_cantidad',
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: AppColors.marronOscuro,
                                ),
                              ),
                              const SizedBox(width: 16),
                              _cantidadButton(
                                icon: Icons.add,
                                onTap: () {
                                  setState(() => _cantidad++);
                                },
                              ),
                            ],
                          ),

                          const SizedBox(height: 32),

                          // Botón agregar al carrito
                          ElevatedButton(
                            onPressed: () {
                              if (_talleSeleccionado == null) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Elegí un talle primero'),
                                  ),
                                );
                                return;
                              }
                              CartService().agregar(
                                widget.producto,
                                _talleSeleccionado!,
                                _cantidad,
                              );
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Agregado: ${widget.producto.nombre} ($_talleSeleccionado) x$_cantidad',
                                  ),
                                  duration: const Duration(seconds: 2),
                                ),
                              );
                            },
                            child: const Text('AGREGAR AL CARRITO'),
                          ),

                          const SizedBox(height: 12),

                          // Botón WhatsApp
                          OutlinedButton(
                            onPressed: () =>
                                _consultarPorWhatsApp(widget.producto),
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(color: AppColors.marron),
                              padding: const EdgeInsets.symmetric(vertical: 14),
                            ),
                            child: const Text(
                              'CONSULTAR POR WHATSAPP',
                              style: TextStyle(color: AppColors.marron),
                            ),
                          ),
                        ],
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

  /// Abre WhatsApp con un mensaje prearmado del producto.
  /// Reemplazá el número 5491112345678 por el de Waikiria.
  Future<void> _consultarPorWhatsApp(Producto producto) async {
    final mensaje = 'Hola! Me interesa este producto de Waikiria:\n\n'
        '📦 ${producto.nombre}\n'
        '💰 \$${producto.precio.toStringAsFixed(0)}\n'
        '${_talleSeleccionado != null ? '📏 Talle: $_talleSeleccionado\n' : ''}'
        '🔢 Cantidad: $_cantidad\n\n'
        '¿Está disponible?';

    final mensajeCodificado = Uri.encodeComponent(mensaje);

    final url = Uri.parse(
      'https://wa.me/2615034506?text=$mensajeCodificado',
    );

    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('No se pudo abrir WhatsApp')),
        );
      }
    }
  }

  Widget _cantidadButton({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.marron),
        ),
        child: Icon(icon, color: AppColors.marron, size: 18),
      ),
    );
  }
}