<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
<xsl:output method="html" doctype-system="about:legacy-compat" />
<xsl:template match='/'>
    <html lang="es">
        <head>
            <link href="../css/estilo.css" rel="stylesheet" type="text/css" />
            <meta charset="utf-8"/>
            <meta name="description" content="Página principal" />
            <title>titulo de la web</title>
        </head>

        <body>
            <header>
                <img src= "../img/logotipo.png" alt= "Reservas" />
                <a href="tienda.xml">Tienda</a>
                <a href="equipos.xml">Equipos</a>
                <a href="partidos.xml">Partidos</a>
            </header>
            
            <main>
                <xsl:variable name="entrenador" select="/club_voleibol/equipo[@categoria='Primera']/entrenador/nombre"/>
                <h1><a href="{/club_voleibol/equipo/entrenador[nombre = $entrenador]/url}"><xsl:value-of select="/club_voleibol/equipo/entrenador[nombre = $entrenador]/nombre"/></a></h1>
                <article class="equipos">
                    <h4><xsl:value-of select="/club_voleibol/equipo[entrenador/nombre=$entrenador]/nombre"/></h4>
                    <xsl:apply-templates select="/club_voleibol/equipo[entrenador/nombre=$entrenador]/jugadores/jugador[@titular='si']"/>
                </article>
            </main>

            <footer>
                <address>&#169; Desarrollado por info@birt.eus</address>
            </footer>
        </body>
    </html>
</xsl:template>

<xsl:template match="jugador">
    <p><xsl:value-of select="@camiseta"/> - <xsl:value-of select="nombre"/></p>
</xsl:template>
</xsl:stylesheet>