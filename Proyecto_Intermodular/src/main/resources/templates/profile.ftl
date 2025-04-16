<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mi Perfil</title>
    <style>
        :root {
            --primary: #e50914;
            --primary-dark: #b2070f;
            --error: #ff3333;
            --text: #ffffff;
            --light: #0f0f1a;
            --white: #ffffff;
            --gray: #adb5bd;
            --border: #2c2f40;
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
            line-height: 1.6;
            padding: 0;
        }

        .profile-container {
            max-width: 800px;
            margin: 2rem auto;
            background: #1c1c2e;
            border-radius: 12px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
            overflow: hidden;
        }

        .profile-header {
            background-color: var(--primary);
            color: var(--white);
            padding: 2rem;
            text-align: center;
            position: relative;
        }

        .profile-avatar {
            width: 100px;
            height: 100px;
            background-color: var(--light);
            border-radius: 50%;
            margin: 0 auto 1rem;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 2.5rem;
            color: var(--primary);
            font-weight: bold;
            border: 3px solid var(--white);
            box-shadow: 0 3px 10px rgba(0, 0, 0, 0.3);
        }

        .profile-name {
            font-size: 1.8rem;
            margin-bottom: 0.5rem;
        }

        .profile-email {
            opacity: 0.9;
            font-size: 1rem;
        }

        .profile-body {
            padding: 2rem;
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 2rem;
        }

        .profile-card {
            background: #222233;
            border: 1px solid var(--border);
            border-radius: 8px;
            padding: 1.5rem;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
        }

        .profile-card h3 {
            color: var(--primary);
            margin-bottom: 1rem;
            padding-bottom: 0.5rem;
            border-bottom: 1px solid var(--border);
        }

        .profile-detail {
            margin-bottom: 1rem;
        }

        .profile-detail strong {
            display: block;
            color: var(--gray);
            font-size: 0.8rem;
            text-transform: uppercase;
            margin-bottom: 0.25rem;
        }

        .profile-detail span {
            font-size: 1rem;
        }

        .logout-btn {
            display: inline-block;
            background-color: var(--primary);
            color: var(--white);
            padding: 0.6rem 1.5rem;
            border-radius: 6px;
            text-decoration: none;
            font-weight: 500;
            transition: all 0.3s;
            border: none;
            cursor: pointer;
            margin-top: 1.5rem;
        }

        .logout-btn:hover {
            background-color: var(--primary-dark);
            transform: translateY(-2px);
        }

        @media (max-width: 768px) {
            .profile-body {
                grid-template-columns: 1fr;
            }

            .profile-container {
                margin: 0;
                border-radius: 0;
            }
        }
    </style>
</head>
<body>
    <div class="profile-container">
        <div class="profile-header">
            <div class="profile-avatar">${usuario.username?substring(0,1)?upper_case}</div>
            <h1 class="profile-name">${usuario.username}</h1>
            <p class="profile-email">${usuario.email}</p>
        </div>

        <div class="profile-body">
            <div class="profile-card">
                <h3>Información Personal</h3>
                <div class="profile-detail">
                    <strong>Nombre de Usuario</strong>
                    <span>${usuario.username}</span>
                </div>
                <div class="profile-detail">
                    <strong>Correo Electrónico</strong>
                    <span>${usuario.email}</span>
                </div>
                <div class="profile-detail">
                    <strong>Fecha de Registro</strong>
                    <span>
                        <#if usuario.fechaRegistro??>
                            ${usuario.fechaRegistro?datetime?string("dd/MM/yyyy")}
                        <#else>
                            No disponible
                        </#if>
                    </span>
                </div>
            </div>

            <div class="profile-card">
                <h3>Estadísticas</h3>
                <div class="profile-detail">
                    <strong>Rol</strong>
                    <span>
                        <#if usuario.isAdmin()>
                            Administrador
                        <#else>
                            Usuario Estándar
                        </#if>
                    </span>
                </div>
                <div class="profile-detail">
                    <strong>Estado</strong>
                    <span>Activo</span>
                </div>
                <div class="profile-detail">
                    <strong>Último Acceso</strong>
                    <span>Hoy</span>
                </div>
            </div>
        </div>

        <div style="text-align: center; padding: 0 2rem 2rem;">
            <a href="/logout" class="logout-btn">Cerrar Sesión</a>
        </div>
    </div>
</body>
</html>