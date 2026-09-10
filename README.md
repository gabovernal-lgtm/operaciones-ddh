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


## v1.1
- Se restituyeron en el PDF de Traslado los **CONTROLES CAMIONETA ESCOLTA** del formato anterior.
- Se restituyó la columna **OBSERVACIONES** tanto para Equipo Sonda como para Camioneta Escolta.
- No se modificaron SRM, Devolución ni Historial.


## v1.2
- PDF de Traslado ajustado contra el PDF de referencia del usuario.
- Título exacto: SOLICITUD AUTORIZACION DE TRASLADO DE EQUIPO SONDA.
- Etiquetas y estructura superior ajustadas.
- CONTROLES EQUIPO SONDA: 4 riesgos + observaciones en bloque.
- CONTROLES CAMIONETA ESCOLTA: 6 riesgos + observaciones en bloque.
- CONTROLES ADICIONALES en recuadro final.


## v1.4
- La fotografía opcional de Devolución de plataforma ahora se integra automáticamente al PDF.
- Se conserva su proporción y se agrega bajo el documento o en una página nueva si no cabe.

## v1.7
- Devolución: fotografías opcionales, máximo 3, integradas automáticamente al PDF.
- Nueva función: Minuta de reuniones.
- Fecha y hora automáticas al generar el correo.
- Nombre de reunión y participantes.
- 20 líneas para Compromiso / Acuerdo, Responsable y Fecha compromiso.
- Destinatarios de Minuta configurables por separado de los correos al cliente.
- Asunto corto automático y cuerpo con separadores claros entre compromisos.
- Minutas también se registran en el historial online.
