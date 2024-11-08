<!DOCTYPE html>
<html lang="ca">
<head>
    <!-- Definim els metadades i l'estil de la pàgina -->
    <meta charset="UTF-8">
    <title>Afegir un Nou Joc</title>
    <style>
        /* Estils generals per a la pàgina */
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            padding: 20px;
        }
        /* Estils del formulari */
        form {
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            max-width: 400px;
            margin: auto;
        }
        /* Estils per a les etiquetes del formulari */
        label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
        }
        /* Estils per als camps de text i data */
        input[type="text"],
        input[type="date"] {
            width: 100%;
            padding: 8px;
            margin-bottom: 16px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
        /* Estils per al botó d'enviament */
        input[type="submit"] {
            background-color: #007bff;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        /* Canviar el color del botó d'enviament quan el ratolí està a sobre */
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
        /* Estils per al botó de tornar enrere */
        .back-button {
            margin-top: 20px;
            background-color: #6c757d;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            display: block;
            text-align: center;
            text-decoration: none;
        }
        /* Canviar el color del botó de tornar enrere quan el ratolí està a sobre */
        .back-button:hover {
            background-color: #5a6268;
        }
    </style>
</head>
<body>
    <!-- Formulari per afegir un nou joc -->
    <form action="form.php" method="post">
        <!-- Camp per introduir el títol del joc -->
        <label for="titol">Títol:</label>
        <input type="text" id="titol" name="titol" required>

        <!-- Camp per introduir la plataforma del joc -->
        <label for="plataforma">Plataforma:</label>
        <input type="text" id="plataforma" name="plataforma" required>

        <!-- Camp per introduir l'any de llançament del joc -->
        <label for="any">Any de Llançament:</label>
        <input type="date" id="any" name="any" required>

        <!-- Camp per introduir el gènere del joc -->
        <label for="genere">Gènere:</label>
        <input type="text" id="genere" name="genere" required>

        <!-- Botó per enviar el formulari -->
        <input type="submit" value="Afegir Joc">
    </form>
    
    <!-- Botó per tornar enrere utilitzant JavaScript -->
    <button class="back-button" onclick="window.history.back();">Tornar Enrere</button>

    <?php
    // Definim les rutes dels arxius XML i XSLT
    $xmlFile = 'videojocs.xml'; // Arxiu XML on s'emmagatzemen els jocs
    $xsltFile = 'style.xslt'; // Arxiu XSLT per transformar l'XML a HTML
    $htmlOutput = 'output.html'; // Arxiu HTML de sortida després de la transformació

    // Comprovem si el formulari ha estat enviat
    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        // Obtenim les dades del formulari
        $titol = $_POST['titol'];
        $plataforma = $_POST['plataforma'];
        $any = $_POST['any'];
        $genere = $_POST['genere'];

        // Carregar l'arxiu XML existent o crear-ne un de nou si no existeix
        if (file_exists($xmlFile)) {
            // Si l'arxiu XML ja existeix, el carreguem
            $xml = new DOMDocument();
            $xml->load($xmlFile);
        } else {
            // Si no existeix, creem un nou document XML
            $xml = new DOMDocument('1.0', 'UTF-8');
            // Afegim l'element arrel <videojocs>
            $root = $xml->createElement('videojocs');
            $xml->appendChild($root);
        }

        // Crear un nou element <joc> amb les dades introduïdes
        $joc = $xml->createElement('joc');

        // Afegim els detalls del joc com a elements fills
        $titolElement = $xml->createElement('titol', htmlspecialchars($titol)); // Títol del joc
        $plataformaElement = $xml->createElement('plataforma', htmlspecialchars($plataforma)); // Plataforma
        $anyElement = $xml->createElement('any', htmlspecialchars($any)); // Any de llançament
        $genereElement = $xml->createElement('genere', htmlspecialchars($genere)); // Gènere

        // Afegim tots els elements al joc
        $joc->appendChild($titolElement);
        $joc->appendChild($plataformaElement);
        $joc->appendChild($anyElement);
        $joc->appendChild($genereElement);

        // Afegim el nou element <joc> al document XML
        $xml->documentElement->appendChild($joc);

        // Guardar l'arxiu XML actualitzat amb formatació
        $xml->formatOutput = true;
        $xml->save($xmlFile);

        // Carreguem l'arxiu XSLT per transformar l'XML en HTML
        $xsl = new DOMDocument();
        $xsl->load($xsltFile);

        // Creem un processador XSLT i importem l'estil
        $proc = new XSLTProcessor();
        $proc->importStylesheet($xsl);

        // Transformem l'XML utilitzant l'estil XSLT i guardem el resultat
        $transformed = $proc->transformToXML($xml);
        file_put_contents($htmlOutput, $transformed);

        // Redirigim a la pàgina HTML generada
        header("Location: $htmlOutput");
        exit(); // Assegurem que el codi s'atura aquí
    }
    ?>
</body>
</html>
