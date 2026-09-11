import 'producto.dart';

/// CartItem: representa un producto dentro del carrito.
/// Tiene un Producto + talle + cantidad.
class CartItem {
  final Producto producto;
  final String talle;
  int cantidad;

  CartItem({
    required this.producto,
    required this.talle,
    this.cantidad = 1,
  });

  /// Precio total del item (precio × cantidad)
  double get subtotal => producto.precio * cantidad;
}