# Operaciones DDH - versión web

Archivos listos para GitHub Pages.

## Publicar
1. Crea un repositorio nuevo en GitHub, por ejemplo `operaciones-ddh`.
2. Sube a la raíz: `index.html`, `manifest.webmanifest`, `icon.svg` y `sw.js`.
3. En GitHub abre **Settings > Pages**.
4. En **Build and deployment**, selecciona **Deploy from a branch**.
5. Branch: `main` / folder: `/ (root)`.
6. Guarda. GitHub mostrará la URL pública.

## Qué funciona
- Traslado, SRM y Devolución de plataforma.
- Historial común en Supabase desde cualquier PC con Internet.
- PDF de Traslado y Devolución mediante jsPDF.
- Preparación del correo con destinatarios, CC, asunto y cuerpo.
- Configuración de correo guardada en el navegador.
- Diseño adaptable a PC y celular.

## Limitación web importante
Un navegador no puede adjuntar por sí solo archivos locales a Outlook mediante `mailto:`. Por eso:
1. Genera el PDF.
2. Pulsa **Abrir correo para revisar**.
3. Adjunta el PDF descargado y, si corresponde, la fotografía.

La clave incorporada es la **Publishable key** de Supabase. No se incluye ninguna Secret key.
