lib/
├── main.dart
├── models/
│   ├── producto.dart
│   ├── categoria.dart
│   ├── cart_item.dart
│   └── cart_service.dart
├── screens/
│   ├── login_screen.dart
│   ├── register_screen.dart
│   ├── home_screen.dart
│   ├── catalog_screen.dart
│   ├── category_screen.dart
│   ├── product_detail_screen.dart
│   ├── cart_screen.dart
│   ├── checkout_screen.dart
│   ├── success_screen.dart
│   ├── profile_screen.dart
│   ├── lookbook_screen.dart
│   └── contact_screen.dart
├── theme/
│   ├── app_colors.dart
│   └── app_theme.dartWaikiria 👗
App mobile de indumentaria femenina desarrollada en Flutter y Dart.

"Tu estilo, tu identidad."

📱 Sobre el proyecto
Waikiria es una aplicación mobile de maquetado y navegación, desarrollada como proyecto académico para la materia de Desarrollo de Aplicaciones Mobile.

La app permite recorrer un catálogo de indumentaria femenina (jeans, faldas, camisas, buzos, accesorios), consultar productos por WhatsApp, agregar al carrito y completar una compra simulada.

Este proyecto toma como base el prototipo de alta fidelidad realizado en Figma y lo traslada al código real usando Flutter.

👥 Integrantes
Rocío Correa

Nuria

🛠️ Tecnologías utilizadas
Tecnología	Uso
Flutter	Framework principal de la app
Dart	Lenguaje de programación
Android Studio	IDE de desarrollo
Figma	Diseño del prototipo
GitHub	Control de versiones
url_launcher	Abrir WhatsApp, Instagram, email y mapas
📂 Estructura del proyecto
text
lib/
├── main.dart
├── models/
│   ├── producto.dart
│   ├── categoria.dart
│   ├── cart_item.dart
│   └── cart_service.dart
├── screens/
│   ├── login_screen.dart
│   ├── register_screen.dart
│   ├── home_screen.dart
│   ├── catalog_screen.dart
│   ├── category_screen.dart
│   ├── product_detail_screen.dart
│   ├── cart_screen.dart
│   ├── checkout_screen.dart
│   ├── success_screen.dart
│   ├── profile_screen.dart
│   ├── lookbook_screen.dart
│   └── contact_screen.dart
├── theme/
│   ├── app_colors.dart
│   └── app_theme.dart
└── widgets/
├── custom_header.dart
├── app_drawer.dart
└── product_card.dart

assets/
└── images/
🎨 Sistema de diseño
Paleta de colores
Color	Hex	Uso
Marrón principal	#8B6F47	Botones, énfasis
Marrón oscuro	#5D4A2E	Textos
Marrón claro	#B89B72	Detalles
Fondo crema	#F5F5F0	Fondo general
Crema oscuro	#EBE9E0	Fondos secundarios
Blanco	#FFFFFF	Textos sobre marrón
📲 Pantallas implementadas (13)
Login — Ingreso con email y contraseña

Registro — Creación de cuenta

Home — Banner + Catálogo + Lookbook + Contacto + Footer

Catálogo — 4 categorías principales

Categoría — Chips de subcategorías + grilla de productos

Detalle de Producto — Imagen, precio, talles, cantidad y WhatsApp

Carrito — Productos, cantidades, subtotal, envío y total

Checkout — Formulario de datos de envío

Confirmación — Compra realizada exitosamente

Mi Cuenta — Datos del usuario y opciones

Lookbook — Fotos de outfits con estilos

Contacto — Email, WhatsApp, Instagram y ubicación

Menú lateral (Drawer) — Navegación entre secciones

🚀 Cómo ejecutar el proyecto
Requisitos previos
Flutter SDK instalado

Android Studio instalado

Git instalado

Pasos
Clonar el repositorio

bash
git clone https://github.com/Rocio2612/waikiria_app.git
cd waikiria_app
Instalar dependencias

bash
flutter pub get
Ejecutar la app en Chrome

bash
flutter run -d chrome
O en un dispositivo/emulador Android:

bash
flutter run
🎯 Flujo principal de la app
text
Login → Home
↓
Catálogo (4 categorías)
↓
Categoría (subcategorías)
↓
Detalle de producto
↓
Carrito → Checkout → Confirmación
Desde el menú lateral (☰):

Catálogo

Lookbook

Contacto

Mi Cuenta

✅ Alcance del proyecto
✅ Incluye:

Diseño fiel al prototipo de Figma

Navegación completa entre pantallas

Componentes reutilizables

Datos estáticos

Carrito funcional en memoria

❌ NO incluye:

Base de datos real

Autenticación real
Waikiria 👗

App mobile de indumentaria femenina desarrollada en **Flutter** y **Dart**.

> *"Tu estilo, tu identidad."*

---

## 📱 Sobre el proyecto

**Waikiria** es una aplicación mobile de maquetado y navegación, desarrollada como proyecto académico para la materia de Desarrollo de Aplicaciones Mobile.

La app permite recorrer un catálogo de indumentaria femenina (jeans, faldas, camisas, buzos, accesorios), consultar productos por WhatsApp, agregar al carrito y completar una compra simulada.

Este proyecto toma como base el prototipo de alta fidelidad realizado en **Figma** y lo traslada al código real usando Flutter.

---

## 👥 Integrantes

- **Rocío Correa**
- **Nuria**

---

## 🛠️ Tecnologías utilizadas

| Tecnología | Uso |
|---|---|
| **Flutter** | Framework principal de la app |
| **Dart** | Lenguaje de programación |
| **Android Studio** | IDE de desarrollo |
| **Figma** | Diseño del prototipo |
| **GitHub** | Control de versiones |
| **url_launcher** | Abrir WhatsApp, Instagram, email y mapas desde la app |

---

## 📂 Estructura del proyecto
lib/
├── main.dart # Punto de entrada de la app
├── models/ # Modelos de datos
│ ├── producto.dart # Modelo de producto (con categoría y subcategoría)
│ ├── categoria.dart # Modelo de categoría (con subcategorías)
│ ├── cart_item.dart # Modelo de item del carrito
│ └── cart_service.dart # Servicio global del carrito (Singleton)
├── screens/ # Pantallas de la app
│ ├── login_screen.dart # Login
│ ├── register_screen.dart # Registro
│ ├── home_screen.dart # Inicio con scroll
│ ├── catalog_screen.dart # Catálogo con 4 categorías
│ ├── category_screen.dart # Subcategorías + productos
│ ├── product_detail_screen.dart # Detalle de producto
│ ├── cart_screen.dart # Carrito
│ ├── checkout_screen.dart # Finalizar compra
│ ├── success_screen.dart # Confirmación
│ ├── profile_screen.dart # Mi cuenta
│ ├── lookbook_screen.dart # Lookbook
│ └── contact_screen.dart # Contacto
├── theme/ # Sistema de diseño
│ ├── app_colors.dart # Paleta de colores
│ └── app_theme.dart # Tema global de la app
└── widgets/ # Componentes reutilizables
├── custom_header.dart # Header con menú y carrito
├── app_drawer.dart # Menú lateral
└── product_card.dart # Tarjeta de producto

assets/
└── images/ # Imágenes de productos, banner y lookbook

text

---

## 🎨 Sistema de diseño

### Paleta de colores

| Color | Hex | Uso |
|---|---|---|
| Marrón principal | `#8B6F47` | Botones, énfasis |
| Marrón oscuro | `#5D4A2E` | Textos |
| Marrón claro | `#B89B72` | Detalles |
| Fondo crema | `#F5F5F0` | Fondo general |
| Crema oscuro | `#EBE9E0` | Fondos secundarios |
| Blanco | `#FFFFFF` | Textos sobre marrón |

---

## 📲 Pantallas implementadas (13)

1. **Login** — Ingreso con email y contraseña
2. **Registro** — Creación de cuenta
3. **Home** — Banner + Catálogo + Lookbook + Contacto + Footer (con scroll)
4. **Catálogo** — 4 categorías principales (PANTALONES, REMERAS Y BLUSAS, ABRIGOS, ACCESORIOS)
5. **Categoría** — Chips de subcategorías + grilla de productos filtrados
6. **Detalle de Producto** — Imagen, precio, selector de talle, cantidad, agregar al carrito y consultar por WhatsApp
7. **Carrito** — Productos, cantidades editables, subtotal, envío y total
8. **Checkout** — Formulario de datos de envío
9. **Confirmación** — Compra realizada exitosamente
10. **Mi Cuenta** — Datos del usuario y opciones
11. **Lookbook** — Fotos de outfits con estilos (Urbano, Clásico, Elegante, Casual)
12. **Contacto** — Email, WhatsApp, Instagram y ubicación (con links externos)
13. **Menú lateral (Drawer)** — Navegación entre secciones

---

## 🚀 Cómo ejecutar el proyecto

### Requisitos previos
- Flutter SDK instalado ([guía oficial](https://docs.flutter.dev/get-started/install))
- Android Studio instalado
- Git instalado

### Pasos

1. **Clonar el repositorio**
   ```bash
   git clone https://github.com/Rocio2612/waikiria_app.git
   cd waikiria_app
Instalar dependencias

bash
flutter pub get
Ejecutar la app en Chrome (recomendado para pruebas)

bash
flutter run -d chrome
O en un dispositivo/emulador Android:

bash
flutter run
🎯 Flujo principal de la app
text
Login → Registro → Home
↓
Catálogo (4 categorías)
↓
Categoría (subcategorías + productos)
↓
Detalle de producto
↓
Carrito
↓
Checkout
↓
Confirmación
También desde el menú lateral (☰):

Catálogo

Lookbook

Contacto

Mi Cuenta

✅ Alcance del proyecto
Este proyecto corresponde a una entrega de maquetado y navegación. Por lo tanto:

✅ Incluye:

Diseño fiel al prototipo de Figma

Navegación completa entre pantallas

Componentes reutilizables (widgets personalizados)

Datos estáticos (productos hardcodeados)

Carrito funcional en memoria

❌ NO incluye:

Base de datos real

Autenticación real

Sistema de pagos

Backend o API

Gestión de stock

📸 Capturas
(Próximamente: agregar capturas de las pantallas funcionando)

📝 Licencia
Proyecto académico. Todos los derechos reservados © 2026 Waikiria.


Sistema de pagos

Backend o API

Gestión de stock

📸 Capturas
(Próximamente)

📝 LicenciaWaikiria 👗
App mobile de indumentaria femenina desarrollada en Flutter y Dart.

"Tu estilo, tu identidad."

📱 Sobre el proyecto
Waikiria es una aplicación mobile de maquetado y navegación, desarrollada como proyecto académico para la materia de Desarrollo de Aplicaciones Mobile.

La app permite recorrer un catálogo de indumentaria femenina (jeans, faldas, camisas, buzos, accesorios), consultar productos por WhatsApp, agregar al carrito y completar una compra simulada.

Este proyecto toma como base el prototipo de alta fidelidad realizado en Figma y lo traslada al código real usando Flutter.

👥 Integrantes
Rocío Correa

Nuria

🛠️ Tecnologías utilizadas
Tecnología	Uso
Flutter	Framework principal de la app
Dart	Lenguaje de programación
Android Studio	IDE de desarrollo
Figma	Diseño del prototipo
GitHub	Control de versiones
url_launcher	Abrir WhatsApp, Instagram, email y mapas
📂 Estructura del proyecto
text
lib/
├── main.dart
├── models/
│   ├── producto.dart
│   ├── categoria.dart
│   ├── cart_item.dart
│   └── cart_service.dart
├── screens/
│   ├── login_screen.dart
│   ├── register_screen.dart
│   ├── home_screen.dart
│   ├── catalog_screen.dart
│   ├── category_screen.dart
│   ├── product_detail_screen.dart
│   ├── cart_screen.dart
│   ├── checkout_screen.dart
│   ├── success_screen.dart
│   ├── profile_screen.dart
│   ├── lookbook_screen.dart
│   └── contact_screen.dart
├── theme/
│   ├── app_colors.dart
│   └── app_theme.dart
└── widgets/
├── custom_header.dart
├── app_drawer.dart
└── product_card.dart

assets/
└── images/
🎨 Sistema de diseño
Paleta de colores
Color	Hex	Uso
Marrón principal	#8B6F47	Botones, énfasis
Marrón oscuro	#5D4A2E	Textos
Marrón claro	#B89B72	Detalles
Fondo crema	#F5F5F0	Fondo general
Crema oscuro	#EBE9E0	Fondos secundarios
Blanco	#FFFFFF	Textos sobre marrón
📲 Pantallas implementadas (13)
Login — Ingreso con email y contraseña

Registro — Creación de cuenta

Home — Banner + Catálogo + Lookbook + Contacto + Footer

Catálogo — 4 categorías principales

Categoría — Chips de subcategorías + grilla de productos

Detalle de Producto — Imagen, precio, talles, cantidad y WhatsApp

Carrito — Productos, cantidades, subtotal, envío y total

Checkout — Formulario de datos de envío

Confirmación — Compra realizada exitosamente

Mi Cuenta — Datos del usuario y opciones

Lookbook — Fotos de outfits con estilos

Contacto — Email, WhatsApp, Instagram y ubicación

Menú lateral (Drawer) — Navegación entre secciones

🚀 Cómo ejecutar el proyecto
Requisitos previos
Flutter SDK instalado

Android Studio instalado

Git instalado

Pasos
Clonar el repositorio

bash
git clone https://github.com/Rocio2612/waikiria_app.git
cd waikiria_app
Instalar dependencias

bash
flutter pub get
Ejecutar la app en Chrome

bash
flutter run -d chrome
O en un dispositivo/emulador Android:

bash
flutter run
🎯 Flujo principal de la app
text
Login → Home
↓
Catálogo (4 categorías)
↓
Categoría (subcategorías)
↓
Detalle de producto
↓
Carrito → Checkout → Confirmación
Desde el menú lateral (☰):

Catálogo

Lookbook

Contacto

Mi Cuenta

✅ Alcance del proyecto
✅ Incluye:

Diseño fiel al prototipo de Figma

Navegación completa entre pantallas

Componentes reutilizables

Datos estáticos

Carrito funcional en memoria

❌ NO incluye:

Base de datos real

Autenticación real

Sistema de pagos

Backend o API

Gestión de stock

📸 Capturas
(Próximamente)

📝 Licencia
Proyecto académico. Todos los derechos reservados © 2026 Waikiria.

