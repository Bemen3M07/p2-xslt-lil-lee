<?xml version="1.0" encoding="UTF-8"?>
<!-- Definim el full d'estils XSLT -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
  <!-- Especifica que la sortida serà en format HTML -->
  <xsl:output method="html" encoding="UTF-8" indent="yes"/>

  <!-- Plantilla principal que transforma l'XML en HTML -->
  <xsl:template match="/">
    <html lang="ca">
      <head>
        <!-- Títol de la pàgina web -->
        <title>Els Meus Videojocs Favorits</title>
        <style>
          /* Estils generals per al cos de la pàgina */
          body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f0f0f0;
          }
          /* Estils per a la capçalera */
          header {
            background-color: #333;
            color: white;
            text-align: center;
            padding: 1em;
          }
          /* Estils per a la secció principal */
          main {
            max-width: 800px;
            margin: 2em auto;
            padding: 1em;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
          }
          /* Estils per a les targetes de cada joc */
          .game-card {
            border: 1px solid #ddd;
            border-radius: 5px;
            padding: 1em;
            margin-bottom: 1em;
          }
          /* Estils per al títol del joc */
          .game-title {
            font-weight: bold;
            color: #2c3e50;
          }
          /* Estils per al peu de pàgina */
          footer {
            text-align: center;
            padding: 1em;
            background-color: #333;
            color: white;
          }
          /* Estils per al botó d'afegir un nou joc */
          .add-game-button {
            display: block;
            margin: 20px auto;
            background-color: #007bff;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            text-align: center;
            text-decoration: none;
            font-weight: bold;
          }
          /* Canvia el color del botó quan el ratolí està a sobre */
          .add-game-button:hover {
            background-color: #0056b3;
          }
        </style>
      </head>

      <body>
        <!-- Capçalera de la pàgina amb el títol -->
        <header>
          <h1>Els Meus Videojocs Favorits</h1>
        </header>

        <!-- Secció principal on es llisten els jocs -->
        <main>
          <!-- Bucle per a cada joc a l'XML -->
          <xsl:for-each select="videojocs/joc">
            <div class="game-card">
              <!-- Mostra el títol del joc -->
              <p class="game-title">
                <xsl:value-of select="titol"/>
              </p>
              <!-- Mostra la plataforma del joc -->
              <p>Plataforma: <xsl:value-of select="plataforma"/></p>
              <!-- Mostra l'any de llançament del joc -->
              <p>Any de llançament: <xsl:value-of select="any"/></p>
              <!-- Mostra el gènere del joc -->
              <p>Gènere: <xsl:value-of select="genere"/></p>
            </div>
          </xsl:for-each>
          
          <!-- Botó per anar al formulari form.php per afegir un nou joc -->
          <a href="form.php" class="add-game-button">Afegir un Nou Joc</a>
        </main>

        <!-- Peu de pàgina amb informació sobre els drets reservats -->
        <footer>
          <p>2024 Els Meus Videojocs Favorits. Tots els drets reservats.</p>
        </footer>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
