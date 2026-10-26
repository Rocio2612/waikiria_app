import '../../models/categoria.dart';

class CategoriaRepository {
  Future<List<Categoria>> getCategorias() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return categoriasMock;
  }
}

const List<Categoria> categoriasMock = [
  Categoria(
    nombre: 'PANTALONES',
    imagen: 'img/images/jean_beige.jpg',
    subcategorias: ['Jean', 'Falda', 'Calza', 'Sastre', 'Baggy'],
  ),
  Categoria(
    nombre: 'REMERAS Y BLUSAS',
    imagen: 'img/images/camisa.jpg',
    subcategorias: ['Remera', 'Camisa', 'Blusa', 'Musculosa', 'Top'],
  ),
  Categoria(
    nombre: 'ABRIGOS',
    imagen: 'img/images/buzo_gris.jpg',
    subcategorias: ['Buzo', 'Campera', 'Morley', 'Tejido'],
  ),
  Categoria(
    nombre: 'ACCESORIOS',
    imagen: 'img/images/cartera_cuero.jpg',
    subcategorias: ['Cartera', 'Cinturón', 'Aros', 'Bolso'],
  ),
];