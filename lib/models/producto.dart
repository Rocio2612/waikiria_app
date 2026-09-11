/// Modelo Producto: representa los datos de un producto de Waikiria.
/// Por ahora usamos imágenes de internet (placeholders).
/// Más adelante las reemplazamos por las imágenes reales de Figma.

class Producto {
  final String id;
  final String nombre;
  final double precio;
  final String imagen;      // URL de la imagen
  final String categoria;   // JEANS, ABRIGOS, REMERAS, ACCESORIOS
  final List<String> talles; // ['S', 'M', 'L', 'XL']

  const Producto({
    required this.id,
    required this.nombre,
    required this.precio,
    required this.imagen,
    required this.categoria,
    required this.talles,
  });
}

/// Lista de productos de prueba (datos estáticos, porque no usamos base de datos).
/// Estos son los productos que se van a mostrar en el catálogo.
const List<Producto> productosDemo = [
  Producto(
    id: '1',
    nombre: 'Remera con cuello rojo',
    precio: 25000,
    imagen: 'https://picsum.photos/id/1011/400/500',
    categoria: 'REMERAS',
    talles: ['S', 'M', 'L', 'XL'],
  ),
  Producto(
    id: '2',
    nombre: 'Remera cuello bordado',
    precio: 25000,
    imagen: 'https://picsum.photos/id/1027/400/500',
    categoria: 'REMERAS',
    talles: ['S', 'M', 'L'],
  ),
  Producto(
    id: '3',
    nombre: 'Remera cuello verde',
    precio: 25000,
    imagen: 'https://picsum.photos/id/1015/400/500',
    categoria: 'REMERAS',
    talles: ['M', 'L', 'XL'],
  ),
  Producto(
    id: '4',
    nombre: 'Jean mom fit',
    precio: 45000,
    imagen: 'https://picsum.photos/id/1035/400/500',
    categoria: 'JEANS',
    talles: ['36', '38', '40', '42'],
  ),
  Producto(
    id: '5',
    nombre: 'Abrigo largo beige',
    precio: 65000,
    imagen: 'https://picsum.photos/id/1062/400/500',
    categoria: 'ABRIGOS',
    talles: ['S', 'M', 'L'],
  ),
  Producto(
    id: '6',
    nombre: 'Abrigo de paño marrón',
    precio: 72000,
    imagen: 'https://picsum.photos/id/1074/400/500',
    categoria: 'ABRIGOS',
    talles: ['M', 'L'],
  ),
  Producto(
    id: '7',
    nombre: 'Cartera de cuero',
    precio: 38000,
    imagen: 'https://picsum.photos/id/1080/400/500',
    categoria: 'ACCESORIOS',
    talles: ['Único'],
  ),
  Producto(
    id: '8',
    nombre: 'Bufanda de lana',
    precio: 15000,
    imagen: 'https://picsum.photos/id/1084/400/500',
    categoria: 'ACCESORIOS',
    talles: ['Único'],
  ),
];