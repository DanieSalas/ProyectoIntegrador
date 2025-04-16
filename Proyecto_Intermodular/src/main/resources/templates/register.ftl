<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${titulo}</title>
    <style>
        :root {
            --primary: #4361ee;
            --primary-dark: #3a56d4;
            --error: #f72585;
            --text: #2b2d42;
            --light: #f8f9fa;
            --white: #ffffff;
            --gray: #adb5bd;
        }

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: var(--light);
            color: var(--text);
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            line-height: 1.6;
            padding: 1rem;
        }

        .register-container {
            width: 100%;
            max-width: 420px;
            background: var(--white);
            border-radius: 12px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.08);
            overflow: hidden;
            animation: fadeIn 0.5s ease-out;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .register-header {
            background-color: var(--primary);
            color: var(--white);
            padding: 1.5rem;
            text-align: center;
        }

        .register-header h2 {
            font-size: 1.5rem;
            margin-bottom: 0.25rem;
        }

        .register-body {
            padding: 1.5rem;
        }

        .error-message {
            background-color: rgba(247, 37, 133, 0.1);
            color: var(--error);
            padding: 0.75rem;
            border-radius: 8px;
            margin-bottom: 1.5rem;
            font-size: 0.9rem;
            text-align: center;
        }

        .form-group {
            margin-bottom: 1.25rem;
        }

        .form-group label {
            display: block;
            margin-bottom: 0.5rem;
            font-weight: 500;
            font-size: 0.9rem;
        }

        .form-control {
            width: 100%;
            padding: 0.8rem 1rem;
            border: 1px solid #e9ecef;
            border-radius: 8px;
            font-size: 1rem;
            transition: all 0.3s;
        }

        .form-control:focus {
            outline: none;
            border-color: var(--primary);
            box-shadow: 0 0 0 3px rgba(67, 97, 238, 0.2);
        }

        .btn {
            width: 100%;
            padding: 0.8rem;
            background-color: var(--primary);
            color: var(--white);
            border: none;
            border-radius: 8px;
            font-size: 1rem;
            font-weight: 500;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .btn:hover {
            background-color: var(--primary-dark);
        }

        .login-link {
            text-align: center;
            margin-top: 1.5rem;
            color: var(--gray);
            font-size: 0.9rem;
        }

        .login-link a {
            color: var(--primary);
            text-decoration: none;
            font-weight: 500;
        }

        .login-link a:hover {
            text-decoration: underline;
        }

        /* Efectos para inputs */
        input {
            background-color: var(--light);
        }

        input::placeholder {
            color: var(--gray);
            opacity: 0.7;
        }
    </style>
</head>
<body>
    <div class="register-container">
        <div class="register-header">
            <h2>Crear Cuenta</h2>
            <p>Completa el formulario para registrarte</p>
        </div>

        <div class="register-body">
            <#if error??>
                <div class="error-message">${error}</div>
            </#if>

            <form action="/register" method="post">
                <div class="form-group">
                    <label for="username">Nombre de Usuario</label>
                    <input
                        type="text"
                        id="username"
                        name="username"
                        class="form-control"
                        required
                        placeholder="Ej: usuario123"
                    >
                </div>

                <div class="form-group">
                    <label for="email">Correo Electrónico</label>
                    <input
                        type="email"
                        id="email"
                        name="email"
                        class="form-control"
                        required
                        placeholder="tu@email.com"
                    >
                </div>

                <div class="form-group">
                    <label for="password">Contraseña</label>
                    <input
                        type="password"
                        id="password"
                        name="password"
                        class="form-control"
                        required
                        placeholder="Mínimo 8 caracteres"
                    >
                </div>

                <button type="submit" class="btn">Registrarse</button>
            </form>

            <div class="login-link">
                ¿Ya tienes una cuenta? <a href="/">Inicia sesión</a>
            </div>
        </div>
    </div>
</body>
</html>