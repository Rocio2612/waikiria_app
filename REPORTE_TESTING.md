REPORTE DE SINGLE-USER TESTING — Waikiria

Proyecto: Waikiria — App mobile de indumentaria femenina
Materia: Desarrollo de Aplicaciones Mobile

Integrantes:Rocío Correa y Nuria Moreno

Fecha del test: 16 de Septiembre del 2026

Testeadora: Rocío Correa y Nuria Moreno

Objetivo del test

Validar la interfaz y navegación de la aplicación Waikiria en una primera versión codificada, con el fin de detectar oportunidades de mejora tempranas en la experiencia de usuario.

Perfil de la persona testeada

Nombre: Celina Zuñega

Edad aproximada: 53 años

Ocupación: Ama de casa

Experiencia con apps de compras online: Básica

Relación con el equipo: Familiar

Dispositivo usado para el test: Chrome en PC con vista móvil


Tareas solicitadas

Se le pidió a la persona completar 4 tareas clave, sin ayuda previa ni explicaciones sobre el funcionamiento de la app.

Tarea 1
Iniciá sesión en la app y llegá hasta la pantalla de inicio.
Resultado: Completada
Observaciones: La persona completó la tarea sin dificultad. Escribió email y contraseña e ingresó al Home sin problemas.

Tarea 2
Entrá al catálogo, buscá un jean y agregalo al carrito con talle 38.

Resultado: Completada
Observaciones:Encontró el catálogo desde el menú lateral y seleccionó la categoría PANTALONES. Sin embargo, al agregar el producto al carrito, no notó que el contador del ícono del carrito se había actualizado (arriba a la derecha).

Tarea 3
Desde el carrito, avanza todo lo que puedas en el proceso de compra hasta que no puedas más.

Resultado: Completada con dificultad inicial
Observaciones:La persona no sabía cómo llegar al carrito después de agregar el producto. No reconoció el ícono del carrito como un botón clickeable. Una vez guiada hacia el carrito, completó el flujo de compra (Checkout → Confirmación) sin problemas.

Tarea 4
Encontrá la sección de contacto y decime cómo le escribirías a Waikiria por WhatsApp.

Resultado:Completada
Observaciones:Encontró la sección de contacto desde el menú lateral y reconoció inmediatamente el botón de WhatsApp. Comentó que le pareció "muy práctico" que se abriera directo con el mensaje prearmado.

Hallazgos de usabilidad

Lo que funcionó bien:

1. Navegación intuitiva: La persona encontró rápidamente el menú lateral y las secciones principales (Catálogo, Lookbook, Contacto).
2. Flujo de compra claro: Una vez que llegó al carrito, completó el proceso de compra sin ninguna duda (Carrito → Checkout → Confirmación).
3. Integración con WhatsApp: Le resultó "muy práctico" que el botón de WhatsApp abriera con el mensaje prearmado.
4. Diseño visual:Comentó que el diseño "se ve profesional" y destacó la paleta de colores (crema y marrón).
5. Selector de talles: Reconoció fácilmente los botones de talle y supo seleccionar el 38.

Problemas detectados

1. Feedback visual débil en el contador del carrito
   Al agregar un producto, la persona no notó que el badge del carrito se actualizaba.
   El cambio era demasiado sutil (número chico, poco contraste).

2. Falta de affordance en el ícono del carrito
   La persona no identificó el ícono del carrito como un botón clickeable.
   No supo cómo llegar al carrito después de agregar un producto.

Mejoras implementadas a partir del test

1. Badge del carrito más visible:
   Se agrandó el tamaño del contador.
   Se agregó un borde del color del fondo para que destacara.
   Se agregó el texto "CARRITO" debajo del ícono.

2. SnackBar con acción:
   Al agregar un producto al carrito, ahora aparece un SnackBar con el texto  “Agregado al carrito" y un botón "VER CARRITO"que lleva directamente a la pantalla del carrito.

3. Ajustes de tamaño:
   Se redujeron las imágenes en general (catálogo, lookbook, detalle) para que las pantallas se vieran más equilibradas.

Conclusión: La persona completó el 100% de las tareas, aunque en 2 de ellas tuvo dificultades iniciales vinculadas al ícono del carrito. Estas dificultades fueron resueltas en la versión posterior a través de mejoras visuales y de interacción. Los demás flujos (Login, Navegación, Catálogo, Checkout, Contacto) fueron completados sin inconvenientes.

Evidencia:  Solo se registraron observaciones escritas.

Reflexión final

El test permitió detectar 2 problemas concretos de usabilidad que hubieran pasado desapercibidos en el desarrollo. Estas mejoras impactaron positivamente en la experiencia final, demostrando la importancia del Single-User Testing como herramienta de validación temprana.

Aprendizajes principales:
Los cambios sutiles de estado (badges, contadores) requieren feedback visual más fuerte.
Los íconos solos (sin texto) pueden no ser suficientes para indicar que son clickeables.
El flujo completo de la app es intuitivo una vez que se encuentra el punto de entrada correcto.
