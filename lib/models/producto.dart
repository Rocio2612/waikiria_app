/// Modelo Producto: cada uno tiene categoria (principal) y subcategoria.

class Producto {
  final String id;
  final String nombre;
  final double precio;
  final String imagen;
  final String categoria;
  final String subcategoria;
  final List<String> talles;

  const Producto({
    required this.id,
    required this.nombre,
    required this.precio,
    required this.imagen,
    required this.categoria,
    required this.subcategoria,
    required this.talles,
  });
}

/// Productos de Waikiria.
/// Las subcategorías coinciden con las de categoria.dart.
const List<Producto> productosDemo = [
  // ============ PANTALONES / Jeans ============
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
    imagen: 'img/images/jean_beigee.jpg',
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

  // ============ PANTALONES / Baggy ============
  Producto(
    id: '7',
    nombre: 'Baggy jean',
    precio: 52000,
    imagen: 'img/images/baggie.jpg',
    categoria: 'PANTALONES',
    subcategoria: 'Baggy',
    talles: ['36', '38', '40', '42'],
  ),

  // ============ PANTALONES / Faldas ============
  Producto(
    id: '8',
    nombre: 'Falda',
    precio: 35000,
    imagen: 'img/images/faldas.jpg',
    categoria: 'PANTALONES',
    subcategoria: 'Falda',
    talles: ['S', 'M', 'L'],
  ),

  // ============ REMERAS Y BLUSAS / Camisas ============
  Producto(
    id: '9',
    nombre: 'Camisa clásica',
    precio: 35000,
    imagen: 'img/images/camisa.jpg',
    categoria: 'REMERAS Y BLUSAS',
    subcategoria: 'Camisa',
    talles: ['S', 'M', 'L'],
  ),

  // ============ REMERAS Y BLUSAS / Blusas ============
  Producto(
    id: '10',
    nombre: 'Blusa jean estampada',
    precio: 38000,
    imagen: 'img/images/blusa_jean_estampado.jpg',
    categoria: 'REMERAS Y BLUSAS',
    subcategoria: 'Blusa',
    talles: ['S', 'M', 'L'],
  ),

  // ============ REMERAS Y BLUSAS / Musculosas ============
  Producto(
    id: '11',
    nombre: 'Musculosa básica',
    precio: 18000,
    imagen: 'img/images/musculosa.jpg',
    categoria: 'REMERAS Y BLUSAS',
    subcategoria: 'Musculosa',
    talles: ['S', 'M', 'L'],
  ),

  // ============ REMERAS Y BLUSAS / Tops ============
  Producto(
    id: '12',
    nombre: 'Top',
    precio: 22000,
    imagen: 'img/images/tops.jpg',
    categoria: 'REMERAS Y BLUSAS',
    subcategoria: 'Top',
    talles: ['S', 'M', 'L'],
  ),

  // ============ ABRIGOS / Buzos ============
  Producto(
    id: '13',
    nombre: 'Buzo gris oversize',
    precio: 32000,
    imagen: 'img/images/buzo_gris.jpg',
    categoria: 'ABRIGOS',
    subcategoria: 'Buzo',
    talles: ['S', 'M', 'L', 'XL'],
  ),

  // ============ ABRIGOS / Morleys ============
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

  // ============ ACCESORIOS / Carteras ============
  Producto(
    id: '16',
    nombre: 'Cartera de cuero',
    precio: 38000,
    imagen: 'img/images/cartera_cuero.jpg',
    categoria: 'ACCESORIOS',
    subcategoria: 'Cartera',
    talles: ['Único'],
  ),

  // ============ ACCESORIOS / Cinturones ============
  Producto(
    id: '17',
    nombre: 'Cinturón',
    precio: 15000,
    imagen: 'img/images/cinturones.jpg',
    categoria: 'ACCESORIOS',
    subcategoria: 'Cinturón',
    talles: ['Único'],
  ),

  // ============ ACCESORIOS / Aros ============
  Producto(
    id: '18',
    nombre: 'Aros',
    precio: 8000,
    imagen: 'img/images/aros.jpg',
    categoria: 'ACCESORIOS',
    subcategoria: 'Aros',
    talles: ['Único'],
  ),

  // ============ ACCESORIOS / Bolsos ============
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