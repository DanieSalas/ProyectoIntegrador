<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CinePlus - Tu plataforma de cine</title>
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

        .main-content {
            margin-top: 80px;
            padding: 40px 20px;
        }

        .hero {
            background: linear-gradient(rgba(0, 0, 0, 0.7), rgba(0, 0, 0, 0.7)),
                        center/cover no-repeat;
            color: white;
            padding: 150px 20px;
            text-align: center;
            margin-bottom: 40px;
            border-radius: 8px;
        }

        .hero h1 {
            font-size: 52px;
            margin-bottom: 20px;
            text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.5);
        }

        .hero p {
            font-size: 22px;
            max-width: 800px;
            margin: 0 auto 30px;
            text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.5);
        }

        .btn {
            display: inline-block;
            background: #e50914;
            color: white;
            padding: 14px 35px;
            border-radius: 5px;
            text-decoration: none;
            font-weight: bold;
            font-size: 18px;
            transition: all 0.3s;
            border: none;
            cursor: pointer;
        }

        .btn:hover {
            background: #b2070f;
            transform: translateY(-2px);
        }

        .movie-section {
            max-width: 1400px;
            margin: 60px auto;
        }

        .section-title {
            font-size: 28px;
            margin-bottom: 30px;
            color: #0f0f1a;
            border-left: 5px solid #e50914;
            padding-left: 15px;
        }

        .movie-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(220px, 1fr));
            gap: 25px;
        }

        .movie-card {
            background: white;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s;
        }

        .movie-card:hover {
            transform: translateY(-10px);
        }

        .movie-poster {
            width: 100%;
            height: 320px;
            object-fit: cover;
        }

        .movie-info {
            padding: 15px;
        }

        .movie-title {
            font-weight: bold;
            margin-bottom: 5px;
            font-size: 16px;
        }

        .movie-meta {
            display: flex;
            justify-content: space-between;
            color: #666;
            font-size: 14px;
        }

        footer {
            background: #0f0f1a;
            color: white;
            padding: 50px 0 30px;
            margin-top: 60px;
        }

        .footer-container {
            max-width: 1400px;
            margin: 0 auto;
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 30px;
            padding: 0 30px;
        }

        .footer-column h3 {
            color: #e50914;
            margin-bottom: 20px;
            font-size: 18px;
        }

        .footer-column ul {
            list-style: none;
            padding: 0;
        }

        .footer-column li {
            margin-bottom: 10px;
        }

        .footer-column a {
            color: #ccc;
            text-decoration: none;
            transition: color 0.3s;
        }

        .footer-column a:hover {
            color: white;
        }

        .copyright {
            text-align: center;
            margin-top: 40px;
            padding-top: 20px;
            border-top: 1px solid #333;
            color: #999;
            font-size: 14px;
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
    </style>
</head>
<body>
    <!-- Navbar -->
    <nav class="navbar">
        <div class="navbar-container">
            <a href="#" class="logo">CinePlus</a>
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

    <div class="main-content">
        <section class="hero">
            <h1>Descubre el mundo del cine</h1>
            <p>Encuentra las mejores películas, consulta tus generos favoritos y mantente al día con las últimas novedades.</p>
            <a href="#" class="btn">Ver estrenos</a>
        </section>

        <!-- Sección de películas destacadas -->
        <section class="movie-section">
            <h2 class="section-title">Películas recién añadidas</h2>
            <div class="movie-grid">
                <!-- Película 1 -->
                <div class="movie-card">
                    <div class="movie-info">
                        <div class="movie-title">Inventado</div>
                        <div class="movie-meta">
                            <span>Acción</span>
                            <span>★ 4.5</span>
                        </div>
                    </div>
                </div>

                <!-- Película 2 -->
                <div class="movie-card">
                    <div class="movie-info">
                        <div class="movie-title">Inventado</div>
                        <div class="movie-meta">
                            <span>Romance</span>
                            <span>★ 4.2</span>
                        </div>
                    </div>
                </div>

                <!-- Película 3 -->
                <div class="movie-card">
                    <div class="movie-info">
                        <div class="movie-title">Inventado</div>
                        <div class="movie-meta">
                            <span>Ciencia ficción</span>
                            <span>★ 4.7</span>
                        </div>
                    </div>
                </div>

                <!-- Película 4 -->
                <div class="movie-card">
                    <div class="movie-info">
                        <div class="movie-title">Inventado</div>
                        <div class="movie-meta">
                            <span>Comedia</span>
                            <span>★ 3.9</span>
                        </div>
                    </div>
                </div>

                <!-- Película 5 -->
                <div class="movie-card">
                    <div class="movie-info">
                        <div class="movie-title">Inventado</div>
                        <div class="movie-meta">
                            <span>Suspenso</span>
                            <span>★ 4.1</span>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Sección de próximos estrenos -->
        <section class="movie-section">
            <h2 class="section-title">Próximos estrenos</h2>
            <div class="movie-grid">
                <!-- Película 1 -->
                <div class="movie-card">
                    <div class="movie-info">
                        <div class="movie-title">Thunderbolts</div>
                        <div class="movie-meta">
                            <span>Estreno: 2/05</span>
                        </div>
                    </div>
                </div>

                <!-- Película 2 -->
                <div class="movie-card">
                    <div class="movie-info">
                        <div class="movie-title">Until dawn</div>
                        <div class="movie-meta">
                            <span>Estreno: 25/04</span>
                        </div>
                    </div>
                </div>

                <!-- Película 3 -->
                <div class="movie-card">
                    <div class="movie-info">
                        <div class="movie-title">Zootopia 2</div>
                        <div class="movie-meta">
                            <span>Estreno: 26/11</span>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Sección de generos -->
        <section class="movie-section">
            <h2 class="section-title">Te recomendamos ver estas películas</h2>
            <div class="movie-grid">

                <a href="/accion" class="movie-card">
                    <div class="movie-info">
                        <div class="movie-title">🎬 Acción</div>
                    </div>
                </a>

                <a href="/romance" class="movie-card">
                    <div class="movie-info">
                        <div class="movie-title">💕 Romance</div>
                    </div>
                </a>

                <a href="/drama" class="movie-card">
                    <div class="movie-info">
                        <div class="movie-title">🎭 Drama</div>
                    </div>
                </a>

                <a href="/terror" class="movie-card">
                    <div class="movie-info">
                        <div class="movie-title">👻 Terror</div>
                    </div>
                </a>

                <a href="/cienciaficcion" class="movie-card">
                    <div class="movie-info">
                        <div class="movie-title">🚀 Ciencia Ficción</div>
                    </div>
                </a>

                <a href="/animacion" class="movie-card">
                    <div class="movie-info">
                        <div class="movie-title">🐭 Animación</div>
                    </div>
                </a>

                <a href="/aventura" class="movie-card">
                    <div class="movie-info">
                        <div class="movie-title">🗺️ Aventura</div>
                    </div>
                </a>
            </div>
        </section>
    </div>

    <footer>
        <div class="footer-container">
            <div class="footer-column">
                <h3>CinePlus</h3>
                <ul>
                    <li><a href="#">Sobre nosotros</a></li>
                    <li><a href="#">Trabaja con nosotros</a></li>
                    <li><a href="#">Contacto</a></li>
                    <li><a href="#">Prensa</a></li>
                </ul>
            </div>

            <div class="footer-column">
                <h3>Legal</h3>
                <ul>
                    <li><a href="#">Términos y condiciones</a></li>
                    <li><a href="#">Política de privacidad</a></li>
                    <li><a href="#">Política de cookies</a></li>
                    <li><a href="#">Aviso legal</a></li>
                </ul>
            </div>

            <div class="footer-column">
                <h3>Síguenos</h3>
                <ul>
                    <li><a href="#">Facebook</a></li>
                    <li><a href="#">Twitter</a></li>
                    <li><a href="#">Instagram</a></li>
                    <li><a href="#">YouTube</a></li>
                </ul>
            </div>
        </div>

        <div class="copyright">
            &copy; 2025 CinePlus. Todos los derechos reservados.
        </div>
    </footer>
</body>
</html>