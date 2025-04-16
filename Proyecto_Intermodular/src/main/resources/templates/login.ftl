<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${titulo}</title>
    <style>
        :root {
            --primary-color: #e50914;
            --primary-hover: #b2070f;
            --dark-bg: #0f0f1a;
            --light-bg: #f5f5f5;
            --text-color: #333;
            --light-text: #ffffff;
            --error-color: #ff3333;
            --border-radius: 8px;
            --box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Arial', sans-serif;
            background-color: var(--light-bg);
            color: var(--text-color);
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            line-height: 1.6;
        }

        .login-container {
            width: 100%;
            max-width: 420px;
            padding: 2.5rem;
            background: white;
            border-radius: var(--border-radius);
            box-shadow: var(--box-shadow);
            transition: transform 0.3s ease;
            margin: 20px;
        }

        .login-container:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.15);
        }

        .login-header {
            text-align: center;
            margin-bottom: 2rem;
        }

        .login-header h2 {
            font-size: 1.8rem;
            color: var(--primary-color);
            margin-bottom: 0.5rem;
            font-weight: bold;
        }

        .login-header p {
            color: #666;
        }

        .login-form .form-group {
            margin-bottom: 1.5rem;
        }

        .login-form label {
            display: block;
            margin-bottom: 0.5rem;
            font-weight: 500;
            color: var(--text-color);
        }

        .login-form input {
            width: 100%;
            padding: 0.8rem 1rem;
            border: 1px solid #ddd;
            border-radius: var(--border-radius);
            font-size: 1rem;
            transition: all 0.3s;
        }

        .login-form input:focus {
            outline: none;
            border-color: var(--primary-color);
            box-shadow: 0 0 0 3px rgba(229, 9, 20, 0.2);
        }

        .btn {
            display: inline-block;
            width: 100%;
            padding: 0.8rem;
            background-color: var(--primary-color);
            color: var(--light-text);
            border: none;
            border-radius: var(--border-radius);
            font-size: 1rem;
            font-weight: bold;
            cursor: pointer;
            transition: all 0.3s;
        }

        .btn:hover {
            background-color: var(--primary-hover);
            transform: translateY(-2px);
        }

        .error-message {
            color: var(--light-text);
            background-color: var(--error-color);
            padding: 0.8rem;
            border-radius: var(--border-radius);
            margin-bottom: 1.5rem;
            text-align: center;
            font-size: 0.9rem;
        }

        .register-link {
            text-align: center;
            margin-top: 1.5rem;
            color: #666;
        }

        .register-link a {
            color: var(--primary-color);
            text-decoration: none;
            font-weight: bold;
        }

        .register-link a:hover {
            text-decoration: underline;
        }

        /* Estilo similar al navbar para cohesión */
        .brand-text {
            text-align: center;
            margin-bottom: 1.5rem;
            font-size: 2rem;
            font-weight: bold;
            color: var(--primary-color);
            font-family: 'Impact', sans-serif;
            letter-spacing: 1px;
        }

        @media (max-width: 480px) {
            .login-container {
                padding: 1.5rem;
                margin: 1rem;
            }

            .login-header h2 {
                font-size: 1.5rem;
            }
        }
    </style>
</head>
<body>
    <div class="login-container">
        <div class="brand-text">CinePlus</div>

        <div class="login-header">
            <h2>Iniciar Sesión</h2>
            <p>Ingresa tus credenciales para continuar</p>
        </div>

        <#if error??>
            <div class="error-message">${error}</div>
        </#if>

        <form class="login-form" action="/login" method="post">
            <div class="form-group">
                <label for="username">Usuario</label>
                <input type="text" id="username" name="username" required placeholder="Ingresa tu usuario">
            </div>

            <div class="form-group">
                <label for="password">Contraseña</label>
                <input type="password" id="password" name="password" required placeholder="Ingresa tu contraseña">
            </div>

            <button type="submit" class="btn">Ingresar</button>
        </form>

        <div class="register-link">
            ¿No tienes cuenta? <a href="/register">Regístrate aquí</a>
        </div>
    </div>
</body>
</html>