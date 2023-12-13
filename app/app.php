<!-- <?php echo phpinfo() ?> -->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <script src="main.js" defer></script>
</head>
<body>
    <header>
        <nav>
            <i id="hamburger" class="fa-solid fa-bars"></i>
            <ul class="liste">
                <li>
                    <a class="liens" href="#">Page 1</a>
                </li>
                <li>
                    <a class="liens" href="#">Page 2</a>
                </li>
                <li>
                    <a class="liens" href="#">Page 3</a>
                </li>
                <li>
                    <a class="liens" href="#">Page 4</a>
                </li>
            </ul>
        </nav>
    </header>
    <main> 
        <div>
            <h1>Bonjour !</h1>
            <?php 
            $formatter = new IntlDateFormatter('fr_FR', IntlDateFormatter::LONG, IntlDateFormatter::NONE);
            $date = $formatter->format(time());
            echo "<p>Vous visitez ce site ce $date.</p>";
            ?>
        </div>
    </main>
</body>
</html>