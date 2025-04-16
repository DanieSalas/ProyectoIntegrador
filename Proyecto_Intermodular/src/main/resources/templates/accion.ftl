    <!DOCTYPE html>
    <html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Películas de Acción | CineFlix</title>
        <style>
            body {
                margin: 0;
                padding: 0;
                font-family: 'Arial', sans-serif;
                line-height: 1.6;
                color: #333;
                background-color: #f5f5f5;
            }

            .navbar {
                position: fixed;
                top: 0;
                width: 100%;
                background-color: #0f0f1a;
                color: white;
                padding: 12px 0;
                box-shadow: 0 2px 15px rgba(0, 0, 0, 0.3);
                z-index: 1000;
                transition: all 0.3s ease;
            }

            .navbar-container {
                display: flex;
                justify-content: space-between;
                align-items: center;
                max-width: 1400px;
                margin: 0 auto;
                padding: 0 30px;
            }

            .logo {
                font-size: 28px;
                font-weight: bold;
                color: #e50914;
                text-decoration: none;
                font-family: 'Impact', sans-serif;
                letter-spacing: 1px;
            }

            .nav-links {
                display: flex;
                list-style: none;
                align-items: center;
                margin: 0;
                padding: 0;
            }

            .nav-links li {
                margin-left: 25px;
                position: relative;
            }

            .nav-links a {
                color: #ffffff;
                text-decoration: none;
                transition: color 0.3s;
                font-weight: 500;
                font-size: 16px;
            }

            .nav-links a:hover {
                color: #e50914;
            }

            .search-box {
                display: flex;
                align-items: center;
                background: rgba(255, 255, 255, 0.1);
                border-radius: 20px;
                padding: 5px 15px;
                transition: all 0.3s;
            }

            .search-box:hover {
                background: rgba(255, 255, 255, 0.2);
            }

            .search-box input {
                background: transparent;
                border: none;
                color: white;
                padding: 5px 10px;
                width: 180px;
                outline: none;
            }

            .search-box input::placeholder {
                color: rgba(255, 255, 255, 0.7);
            }

            .search-box button {
                background: transparent;
                border: none;
                color: white;
                cursor: pointer;
            }

            /* Estilos para el dropdown */
            .dropdown {
                position: relative;
                display: inline-block;
            }

            .dropdown-menu {
                display: none;
                position: absolute;
                right: 0;
                background-color: #0f0f1a;
                min-width: 160px;
                box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
                z-index: 1;
                border-radius: 4px;
                padding: 10px 0;
            }

            .dropdown-menu li {
                padding: 8px 16px;
            }

            .dropdown-menu a {
                color: white !important;
                display: block;
                transition: all 0.3s;
            }

            .dropdown-menu a:hover {
                color: #e50914 !important;
                background-color: rgba(255, 255, 255, 0.1);
            }

            .dropdown:hover .dropdown-menu {
                display: block;
            }

            .genero-hero {
                text-align: center;
                padding: 60px 20px;
                background-image: linear-gradient(to right, #1c1c1c, #2c2c2c);
            }

            .genero-hero h1 {
                font-size: 2.5em;
                margin-bottom: 10px;
            }

            .genero-hero p {
                font-size: 1.2em;
                color: #cccccc;
            }

            .peliculas-grid {
                display: grid;
                grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
                gap: 20px;
                padding: 40px 20px;
                max-width: 1200px;
                margin: 0 auto;
            }

            .pelicula {
                background-color: #1a1a1a;
                padding: 15px;
                border-radius: 10px;
                text-align: center;
                box-shadow: 0 4px 8px rgba(0,0,0,0.3);
                transition: transform 0.2s;
            }

            .pelicula img {
                width: 100%;
                height: auto;
                border-radius: 8px;
            }

            .pelicula h3 {
                margin-top: 10px;
                font-size: 1.1em;
                color: #ffffff;
            }

            .pelicula:hover {
                transform: translateY(-5px);
            }
        </style>
    </head>
    <body>

    <header class="navbar">
        <!-- Navbar -->
        <nav class="navbar">
            <div class="navbar-container">
                <a href="/princip" class="logo">CinePlus</a>
                <ul class="nav-links">
                    <li><a href="#">Películas</a></li>
                    <li><a href="#">Cines</a></li>
                    <li><a href="#">Socio</a></li>
                    <li><a href="#">Ranking</a></li>
                    <li><a href="#">Blog</a></li>
                    <li class="dropdown">
                        <a href="/profile" class="dropdown-toggle">Usuario</a>
                        <#if usuario?? && usuario.isAdmin()>
                            <ul class="dropdown-menu">
                                <li><a href="/profile">Mi perfil</a></li>
                                <li><a href="/dashboard">Panel de administración</a></li>
                            </ul>
                        </#if>
                    </li>
                    <li>
                        <div class="search-box">
                            <input type="text" placeholder="Buscar películas...">
                            <button type="submit">🔍</button>
                        </div>
                    </li>
                </ul>
            </div>
        </nav>
    </header>

    <section class="genero-hero accion">
        <h1>Películas de Acción</h1>
        <p>Explosiones, adrenalina y pura emoción. ¡Prepárate para la acción!</p>
    </section>

    <main class="peliculas-grid">
        <div class="pelicula">
            <img src="/Imagenes/acc1.jpg" alt="Película Acción 1">
            <h3>Al filo del mañana</h3>
        </div>
        <div class="pelicula">
            <img src="/Imagenes/acc2.jpg" alt="Película Acción 2">
            <h3>Los juegos del hambre</h3>
        </div>
        <div class="pelicula">
            <img src="/Imagenes/acc3.jpg" alt="Película Acción 3">
            <h3>Tomb Raider</h3>
        </div>
    </main>

    </body>
    </html>
