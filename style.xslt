<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" encoding="UTF-8" indent="yes"/>

  <xsl:template match="/">
    <html lang="ca">
      <head>
        <title>Els Meus Videojocs Favorits</title>
        <style>
          body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f0f0f0;
          }
          header {
            background-color: #333;
            color: white;
            text-align: center;
            padding: 1em;
          }
          main {
            max-width: 800px;
            margin: 2em auto;
            padding: 1em;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
          }
          .game-card {
            border: 1px solid #ddd;
            border-radius: 5px;
            padding: 1em;
            margin-bottom: 1em;
          }
          .game-title {
            font-weight: bold;
            color: #2c3e50;
          }
          footer {
            text-align: center;
            padding: 1em;
            background-color: #333;
            color: white;
          }
        </style>
      </head>
      <body>
        <header>
          <h1>Els Meus Videojocs Favorits</h1>
        </header>

        <main>
          <xsl:for-each select="videojocs/joc">
            <div class="game-card">
              <p class="game-title"><xsl:value-of select="titol"/></p>
              <p>Plataforma: <xsl:value-of select="plataforma"/></p>
              <p>Any de llançament: <xsl:value-of select="any"/></p>
              <p>Gènere: <xsl:value-of select="genere"/></p>
            </div>
          </xsl:for-each>
        </main>

        <footer>
          <p>2024 Els Meus Videojocs Favorits. Tots els drets reservats.</p>
        </footer>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
