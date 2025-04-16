<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${titulo!"Crear nuevo usuario"}</title>
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
            --gray: #adb5bd;
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

        .register-container {
            width: 100%;
            max-width: 420px;
            background: white;
            border-radius: var(--border-radius);
            box-shadow: var(--box-shadow);
            overflow: hidden;
            margin: 20px;
            transition: transform 0.3s ease;
        }

        .register-container:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.15);
        }

        .brand-text {
            text-align: center;
            padding: 1.5rem;
            font-size: 2rem;
            font-weight: bold;
            color: var(--primary-color);
            font-family: 'Impact', sans-serif;
            letter-spacing: 1px;
            background-color: var(--dark-bg);
            color: var(--light-text);
        }

        .register-header {
            background-color: var(--primary-color);
            color: var(--light-text);
            padding: 1.5rem;
            text-align: center;
        }

        .register-header h2 {
            font-size: 1.5rem;
            margin-bottom: 0.5rem;
            font-weight: bold;
        }

        .register-header p {
            opacity: 0.9;
        }

        .register-body {
            padding: 1.5rem;
        }

        .error-message {
            background-color: var(--error-color);
            color: var(--light-text);
            padding: 0.8rem;
            border-radius: var(--border-radius);
            margin-bottom: 1.5rem;
            text-align: center;
            font-size: 0.9rem;
        }

        .form-group {
            margin-bottom: 1.5rem;
        }

        .form-group label {
            display: block;
            margin-bottom: 0.5rem;
            font-weight: 500;
            color: var(--text-color);
        }

        .form-control {
            width: 100%;
            padding: 0.8rem 1rem;
            border: 1px solid #ddd;
            border-radius: var(--border-radius);
            font-size: 1rem;
            transition: all 0.3s;
        }

        .form-control:focus {
            outline: none;
            border-color: var(--primary-color);
            box-shadow: 0 0 0 3px rgba(229, 9, 20, 0.2);
        }

        .btn {
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

        .back-link {
            text-align: center;
            margin-top: 1.5rem;
            color: #666;
        }

        .back-link a {
            color: var(--primary-color);
            text-decoration: none;
            font-weight: bold;
        }

        .back-link a:hover {
            text-decoration: underline;
        }

        input::placeholder {
            color: var(--gray);
            opacity: 0.7;
        }

        @media (max-width: 480px) {
            .register-container {
                margin: 1rem;
            }

            .register-header h2 {
                font-size: 1.3rem;
            }

            .brand-text {
                font-size: 1.8rem;
                padding: 1rem;
            }
        }
    </style>
</head>
<body>
    <div class="register-container">
        <div class="brand-text">CinePlus</div>

        <div class="register-header">
            <h2>Crear Cuenta Administrador</h2>
            <p>Completa el formulario para añadir un nuevo usuario</p>
        </div>

        <div class="register-body">
            <#if error??>
                <div class="error-message">${error}</div>
            </#if>

            <form action="/admin/nuevo-usuario" method="post">
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
                        placeholder="usuario@email.com"
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
                        placeholder="12345"
                    >
                </div>

                <button type="submit" class="btn">Crear Usuario</button>
            </form>

            <div class="back-link">
                <a href="/dashboard">← Volver al dashboard</a>
            </div>
        </div>
    </div>
</body>
</html>
