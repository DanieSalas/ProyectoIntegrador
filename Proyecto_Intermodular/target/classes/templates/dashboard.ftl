<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Panel de Administración</title>
    <style>
        :root {
          --primary: #e50914;
          --primary-dark: #b00610;
          --background: #111111;
          --card-bg: #1c1c1c;
          --text: #ffffff;
          --text-muted: #cccccc;
          --border: #333333;
          --error: #ff4d4d;
        }

        body {
          font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
          margin: 0;
          background-color: var(--background);
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
          border-bottom: 1px solid var(--border);
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
          transition: background-color 0.3s ease;
        }

        .logout-btn:hover {
          background-color: var(--primary-dark);
        }

        .alert {
          padding: 1rem;
          margin-bottom: 1.5rem;
          border-radius: 5px;
        }

        .alert-success {
          background-color: #1f5130;
          color: #9cf6c1;
          border: 1px solid #2ecc71;
        }

        .alert-error {
          background-color: #4b1c1c;
          color: #f88;
          border: 1px solid #e74c3c;
        }

        .action-buttons {
          display: flex;
          gap: 1rem;
          margin-bottom: 1.5rem;
        }

        .btn {
          padding: 0.6rem 1.2rem;
          border-radius: 6px;
          text-decoration: none;
          font-size: 1rem;
          cursor: pointer;
          font-weight: bold;
          transition: background-color 0.3s ease;
        }

        .btn-primary {
          background-color: var(--primary);
          color: white;
          border: none;
        }

        .btn-primary:hover {
          background-color: var(--primary-dark);
        }

        .users-table {
          width: 100%;
          border-collapse: collapse;
          background-color: var(--card-bg);
          box-shadow: 0 2px 10px rgba(0,0,0,0.3);
          border: 1px solid var(--border);
        }

        .users-table th, .users-table td {
          padding: 1rem;
          text-align: left;
          border-bottom: 1px solid var(--border);
        }

        .users-table th {
          background-color: var(--primary-dark);
          color: var(--text);
        }

        .users-table tr:hover {
          background-color: #222;
        }

        .badge {
          padding: 0.3rem 0.7rem;
          border-radius: 50px;
          font-size: 0.8rem;
          font-weight: bold;
        }

        .badge-admin {
          background-color: var(--primary);
          color: white;
        }

        .badge-user {
          background-color: #555;
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

        .delete-btn:hover {
          background-color: #cc0000;
        }

        .empty-state {
          text-align: center;
          padding: 2rem;
          color: var(--text-muted);
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
          <a href="/admin/nuevo-usuario" class="btn btn-primary">➕ Nuevo Usuario</a>
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