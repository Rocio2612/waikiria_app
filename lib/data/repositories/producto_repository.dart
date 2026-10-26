import '../../models/producto.dart';

class ProductoRepository {
  // Simula una llamada a una API (con delay de 500ms)
  Future<List<Producto>> getProductos() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return productosMock;
  }

  // Filtra por categoría
  Future<List<Producto>> getProductosPorCategoria(String categoria) async {
    await Future.delayed(const Duration(milliseconds: 300));
    return productosMock.where((p) => p.categoria == categoria).toList();
  }

  // Filtra por categoría y subcategoría
  Future<List<Producto>> getProductosPorSubcategoria(
      String categoria, String subcategoria) async {
    await Future.delayed(const Duration(milliseconds: 300));
    return productosMock
        .where((p) =>
    p.categoria == categoria && p.subcategoria == subcategoria)
        .toList();
  }

  // Obtiene un producto por ID
  Future<Producto?> getProductoPorId(String id) async {
    await Future.delayed(const Duration(milliseconds: 300));
    try {
      return productosMock.firstWhere((p) => p.id == id);
    } catch (_) {
      return null;
    }
  }
}

// Datos mock (los datos de prueba)
const List<Producto> productosMock = [
  Producto(
    id: '1',
    nombre: 'Jean wide beige',
    precio: 45000,
    imagen: 'img/images/jean_beige.jpg',
    categoria: 'PANTALONES',
    subcategoria: 'Jean',
    talles: ['36', '38', '40', '42'],
  ),
  Producto(
    id: '2',
    nombre: 'Jean wide blanco',
    precio: 45000,
    imagen: 'img/images/jean_blanco.jpg',
    categoria: 'PANTALONES',
    subcategoria: 'Jean',
    talles: ['36', '38', '40', '42'],
  ),
  Producto(
    id: '3',
    nombre: 'Jean oxford azul',
    precio: 48000,
    imagen: 'img/images/jean_oxford.jpg',
    categoria: 'PANTALONES',
    subcategoria: 'Jean',
    talles: ['36', '38', '40', '42'],
  ),
  Producto(
    id: '4',
    nombre: 'Jean oxford negro',
    precio: 48000,
    imagen: 'img/images/jean_oxford_negro.jpg',
    categoria: 'PANTALONES',
    subcategoria: 'Jean',
    talles: ['36', '38', '40', '42'],
  ),
  Producto(
    id: '5',
    nombre: 'Jean wide marrón',
    precio: 42000,
    imagen: 'img/images/jean_tienda_marron.jpg',
    categoria: 'PANTALONES',
    subcategoria: 'Jean',
    talles: ['36', '38', '40'],
  ),
  Producto(
    id: '6',
    nombre: 'Jean wide negro',
    precio: 42000,
    imagen: 'img/images/jean_tienda_negro.jpg',
    categoria: 'PANTALONES',
    subcategoria: 'Jean',
    talles: ['36', '38', '40'],
  ),
  Producto(
    id: '7',
    nombre: 'Baggy jean',
    precio: 52000,
    imagen: 'img/images/baggie.jpg',
    categoria: 'PANTALONES',
    subcategoria: 'Baggy',
    talles: ['36', '38', '40', '42'],
  ),
  Producto(
    id: '8',
    nombre: 'Falda',
    precio: 35000,
    imagen: 'img/images/faldas.jpg',
    categoria: 'PANTALONES',
    subcategoria: 'Falda',
    talles: ['S', 'M', 'L'],
  ),
  Producto(
    id: '9',
    nombre: 'Camisa clásica',
    precio: 35000,
    imagen: 'img/images/camisa.jpg',
    categoria: 'REMERAS Y BLUSAS',
    subcategoria: 'Camisa',
    talles: ['S', 'M', 'L'],
  ),
  Producto(
    id: '10',
    nombre: 'Blusa jean estampada',
    precio: 38000,
    imagen: 'img/images/blusa_jean_estampado.jpg',
    categoria: 'REMERAS Y BLUSAS',
    subcategoria: 'Blusa',
    talles: ['S', 'M', 'L'],
  ),
  Producto(
    id: '11',
    nombre: 'Musculosa básica',
    precio: 18000,
    imagen: 'img/images/musculosa.jpg',
    categoria: 'REMERAS Y BLUSAS',
    subcategoria: 'Musculosa',
    talles: ['S', 'M', 'L'],
  ),
  Producto(
    id: '12',
    nombre: 'Top',
    precio: 22000,
    imagen: 'img/images/tops.jpg',
    categoria: 'REMERAS Y BLUSAS',
    subcategoria: 'Top',
    talles: ['S', 'M', 'L'],
  ),
  Producto(
    id: '13',
    nombre: 'Buzo gris oversize',
    precio: 32000,
    imagen: 'img/images/buzo_gris.jpg',
    categoria: 'ABRIGOS',
    subcategoria: 'Buzo',
    talles: ['S', 'M', 'L', 'XL'],
  ),
  Producto(
    id: '14',
    nombre: 'Morley marrón',
    precio: 28000,
    imagen: 'img/images/morley_marron.jpg',
    categoria: 'ABRIGOS',
    subcategoria: 'Morley',
    talles: ['S', 'M', 'L', 'XL'],
  ),
  Producto(
    id: '15',
    nombre: 'Morley negro',
    precio: 28000,
    imagen: 'img/images/morley_negro.jpg',
    categoria: 'ABRIGOS',
    subcategoria: 'Morley',
    talles: ['S', 'M', 'L', 'XL'],
  ),
  Producto(
    id: '16',
    nombre: 'Cartera de cuero',
    precio: 38000,
    imagen: 'img/images/cartera_cuero.jpg',
    categoria: 'ACCESORIOS',
    subcategoria: 'Cartera',
    talles: ['Único'],
  ),
  Producto(
    id: '17',
    nombre: 'Cinturón',
    precio: 15000,
    imagen: 'img/images/cinturones.jpg',
    categoria: 'ACCESORIOS',
    subcategoria: 'Cinturón',
    talles: ['Único'],
  ),
  Producto(
    id: '18',
    nombre: 'Aros',
    precio: 8000,
    imagen: 'img/images/aros.jpg',
    categoria: 'ACCESORIOS',
    subcategoria: 'Aros',
    talles: ['Único'],
  ),
  Producto(
    id: '19',
    nombre: 'Bolso',
    precio: 42000,
    imagen: 'img/images/bolsos.jpg',
    categoria: 'ACCESORIOS',
    subcategoria: 'Bolso',
    talles: ['Único'],
  ),
];