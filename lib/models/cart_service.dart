import 'package:flutter/material.dart';
import 'cart_item.dart';
import 'producto.dart';

/// CartService: guarda los items del carrito en memoria.
/// Es un singleton: hay una sola instancia en toda la app.
/// Así cualquier pantalla puede agregar o leer items del carrito.
class CartService extends ChangeNotifier {
  // Singleton: instancia única
  static final CartService _instance = CartService._internal();
  factory CartService() => _instance;
  CartService._internal();

  final List<CartItem> _items = [];

  /// Lista de items (solo lectura desde afuera)
  List<CartItem> get items => List.unmodifiable(_items);

  /// Total de items (contando cantidades)
  int get totalItems =>
      _items.fold(0, (sum, item) => sum + item.cantidad);

  /// Total en pesos
  double get total =>
      _items.fold(0, (sum, item) => sum + item.subtotal);

  /// Agrega un producto al carrito.
  /// Si ya existe con el mismo talle, le suma cantidad.
  void agregar(Producto producto, String talle, int cantidad) {
    final index = _items.indexWhere(
          (item) => item.producto.id == producto.id && item.talle == talle,
    );

    if (index >= 0) {
      _items[index].cantidad += cantidad;
    } else {
      _items.add(
        CartItem(producto: producto, talle: talle, cantidad: cantidad),
      );
    }

    notifyListeners(); // avisa a las pantallas que se actualicen
  }

  /// Quita un item del carrito
  void quitar(CartItem item) {
    _items.remove(item);
    notifyListeners();
  }

  /// Vacía el carrito (después de la compra)
  void vaciar() {
    _items.clear();
    notifyListeners();
  }
}