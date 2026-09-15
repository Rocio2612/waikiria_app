/// Modelo Categoria: representa una categoría principal del catálogo.
class Categoria {
  final String nombre;
  final String imagen;
  final List<String> subcategorias;

  const Categoria({
    required this.nombre,
    required this.imagen,
    required this.subcategorias,
  });
}

/// Las 4 categorías principales del catálogo de Waikiria.
const List<Categoria> categorias = [
  Categoria(
    nombre: 'PANTALONES',
    imagen: 'assets/images/jean_beige.jpg',
    subcategorias: ['Jean', 'Falda', 'Calza', 'Sastre', 'Baggy'],
  ),
  Categoria(
    nombre: 'REMERAS Y BLUSAS',
    imagen: 'assets/images/camisa.jpg',
    subcategorias: ['Remera', 'Camisa', 'Blusa', 'Musculosa', 'Top'],
  ),
  Categoria(
    nombre: 'ABRIGOS',
    imagen: 'assets/images/buzo_gris.jpg',
    subcategorias: ['Buzo', 'Campera', 'Morley', 'Tejido'],
  ),
  Categoria(
    nombre: 'ACCESORIOS',
    imagen: 'assets/images/cartera_cuero.jpg',
    subcategorias: ['Cartera', 'Cinturón', 'Aros', 'Bolso'],
  ),
];