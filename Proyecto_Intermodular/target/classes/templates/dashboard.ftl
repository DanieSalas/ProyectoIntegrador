<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Panel de Administración</title>
    <style>
        :root {
            --primary: #4361ee;
            --primary-light: #e6e9f9;
            --error: #f72585;
            --success: #4cc9f0;
            --text: #2b2d42;
            --light: #f8f9fa;
            --white: #ffffff;
            --gray: #adb5bd;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            background-color: var(--light);
            color: var(--text);
        }

        .admin-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 2rem;
        }

        .admin-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 2rem;
            padding-bottom: 1rem;
            border-bottom: 1px solid var(--gray);
        }

        .admin-title {
            color: var(--primary);
            margin: 0;
        }

        .user-info {
            display: flex;
            align-items: center;
            gap: 1rem;
        }

        .logout-btn {
            background-color: var(--error);
            color: white;
            padding: 0.5rem 1rem;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
            font-size: 0.9rem;
        }

        .alert {
            padding: 1rem;
            margin-bottom: 1.5rem;
            border-radius: 5px;
        }

        .alert-success {
            background-color: #d1fae5;
            color: #065f46;
            border: 1px solid #a7f3d0;
        }

        .alert-error {
            background-color: #fee2e2;
            color: #b91c1c;
            border: 1px solid #fecaca;
        }

        .action-buttons {
            display: flex;
            gap: 1rem;
            margin-bottom: 1.5rem;
        }

        .btn {
            padding: 0.5rem 1rem;
            border-radius: 5px;
            text-decoration: none;
            font-size: 0.9rem;
            cursor: pointer;
        }

        .btn-primary {
            background-color: var(--primary);
            color: white;
            border: none;
        }

        .users-table {
            width: 100%;
            border-collapse: collapse;
            background-color: var(--white);
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }

        .users-table th, .users-table td {
            padding: 1rem;
            text-align: left;
            border-bottom: 1px solid var(--light);
        }

        .users-table th {
            background-color: var(--primary-light);
            color: var(--primary);
            font-weight: 500;
        }

        .users-table tr:hover {
            background-color: rgba(67, 97, 238, 0.05);
        }

        .badge {
            padding: 0.25rem 0.5rem;
            border-radius: 50px;
            font-size: 0.75rem;
            font-weight: 500;
        }

        .badge-admin {
            background-color: var(--primary-light);
            color: var(--primary);
        }

        .badge-user {
            background-color: #e9ecef;
            color: var(--text);
        }

        .action-btn {
            padding: 0.3rem 0.6rem;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 0.8rem;
        }

        .delete-btn {
            background-color: var(--error);
            color: white;
        }

        .empty-state {
            text-align: center;
            padding: 2rem;
            color: var(--gray);
        }
    </style>
</head>
<body>
    <div class="admin-container">
        <div class="admin-header">
            <h1 class="admin-title">Panel de Administración</h1>
            <div class="user-info">
                <span>${(usuario.username)!'Admin'}</span>
                <a href="/logout" class="logout-btn">Cerrar sesión</a>
            </div>
        </div>

        <#if success??>
            <div class="alert alert-success">${success}</div>
        </#if>

        <#if error??>
            <div class="alert alert-error">${error}</div>
        </#if>

        <div class="action-buttons">
            <a href="/admin/nuevo-usuario" class="btn">Nuevo Usuario</a>
        </div>

        <table class="users-table">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Usuario</th>
                    <th>Email</th>
                    <th>Fecha Registro</th>
                    <th>Rol</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <#if usuarios?? && usuarios?size gt 0>
                    <#list usuarios as user>
                        <tr>
                            <td>${user.id!''}</td>
                            <td>${user.username!''}</td>
                            <td>${user.email!''}</td>
                            <td>
                                <#if user.fechaRegistro??>
                                    ${user.fechaRegistro?datetime?string('dd/MM/yyyy HH:mm')}
                                <#else>
                                    -
                                </#if>
                            </td>
                            <td>
                                <span class="badge ${(user.isAdmin())?then('badge-admin','badge-user')}">
                                    ${(user.isAdmin())?then('Admin','Usuario')}
                                </span>
                            </td>
                            <td>
                                <form action="/eliminar-usuario" method="post" style="display: inline;">
                                    <input type="hidden" name="id" value="${user.id!''}">
                                    <button type="submit" class="action-btn delete-btn">Eliminar</button>
                                </form>
                            </td>
                        </tr>
                    </#list>
                <#else>
                    <tr>
                        <td colspan="6" class="empty-state">No hay usuarios registrados</td>
                    </tr>
                </#if>
            </tbody>
        </table>
    </div>
</body>
</html>