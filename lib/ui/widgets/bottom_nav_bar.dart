import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../screens/home_screen.dart';
import '../screens/catalog_screen.dart';
import '../screens/lookbook_screen.dart';
import '../screens/contact_screen.dart';
import '../screens/profile_screen.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;

  const BottomNavBar({super.key, required this.selectedIndex});

  /// 0 = Inicio, 1 = Catálogo, 2 = Lookbook, 3 = Contacto, 4 = Mi Cuenta
  void _onItemTapped(BuildContext context, int index) {
    // Si ya estás en esa pantalla, no hagas nada
    if (index == selectedIndex) return;

    Widget screen;
    switch (index) {
      case 0:
        screen = const HomeScreen();
        break;
      case 1:
        screen = const CatalogScreen();
        break;
      case 2:
        screen = const LookbookScreen();
        break;
      case 3:
        screen = const ContactScreen();
        break;
      case 4:
        screen = const ProfileScreen();
        break;
      default:
        screen = const HomeScreen();
    }

    // Navega reemplazando para no acumular pantallas
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => screen),
          (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.blanco,
        border: Border(
          top: BorderSide(color: AppColors.marronClaro, width: 0.5),
        ),
      ),
      child: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) => _onItemTapped(context, index),
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.blanco,
        selectedItemColor: AppColors.marron,
        unselectedItemColor: AppColors.marronClaro,
        selectedFontSize: 10,
        unselectedFontSize: 10,
        selectedLabelStyle: const TextStyle(
          letterSpacing: 1,
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelStyle: const TextStyle(letterSpacing: 1),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'INICIO',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_view_outlined),
            activeIcon: Icon(Icons.grid_view),
            label: 'CATÁLOGO',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.photo_library_outlined),
            activeIcon: Icon(Icons.photo_library),
            label: 'LOOKBOOK',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mail_outline),
            activeIcon: Icon(Icons.mail),
            label: 'CONTACTO',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: 'MI CUENTA',
          ),
        ],
      ),
    );
  }
}