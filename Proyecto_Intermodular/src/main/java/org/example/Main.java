package org.example;

import io.javalin.Javalin;
import io.javalin.rendering.template.JavalinFreemarker;
import freemarker.template.Configuration;
import java.util.HashMap;
import java.util.Map;

public class Main {
    public static void main(String[] args) {
        Configuration freemarkerConfig = new Configuration(Configuration.VERSION_2_3_32);
        freemarkerConfig.setClassForTemplateLoading(Main.class, "/templates");

        Javalin app = Javalin.create(config -> {
            config.fileRenderer(new JavalinFreemarker(freemarkerConfig));
        }).start(8080);

        app.get("/", ctx -> {
            Map<String, Object> model = new HashMap<>();
            model.put("titulo", "Iniciar Sesión");
            ctx.render("login.ftl", model);
        });

        app.post("/login", ctx -> {
            String username = ctx.formParam("username");
            String password = ctx.formParam("password");

            Usuario usuario = UsuarioDAO.validarCredenciales(username, password);

            if (usuario != null) {
                ctx.sessionAttribute("user", usuario);
                if (usuario.isAdmin()) {
                    Map<String, Object> adminModel = new HashMap<>();
                    adminModel.put("usuario", usuario);
                    adminModel.put("usuarios", UsuarioDAO.listarTodos());
                    ctx.render("dashboard.ftl", adminModel);
                }
                else {
                    Map<String, Object> userModel = new HashMap<>();
                    userModel.put("usuario", usuario);
                    ctx.render("profile.ftl", userModel);
                }
            } else {
                Map<String, Object> model = new HashMap<>();
                model.put("error", "Credenciales incorrectas");
                ctx.render("login.ftl", model);
            }
        });

        app.get("/register", ctx -> {
            Map<String, Object> model = new HashMap<>();
            model.put("titulo", "Registrar Cuenta");
            ctx.render("register.ftl", model);
        });

        app.post("/register", ctx -> {
            try {
                Usuario usuario = new Usuario();
                usuario.setUsername(ctx.formParam("username"));
                usuario.setEmail(ctx.formParam("email"));
                usuario.setPassword(ctx.formParam("password"));
                usuario.setAdmin(false);

                UsuarioDAO.guardarUsuario(usuario);
                ctx.redirect("/?registroExitoso=true");
            } catch (Exception e) {
                Map<String, Object> model = new HashMap<>();
                model.put("error", e.getMessage());
                ctx.render("register.ftl", model);
            }
        });

        app.get("/mi-perfil", ctx -> {
            Usuario usuario = ctx.sessionAttribute("user");
            if (usuario == null) {
                ctx.redirect("/?error=Debe+iniciar+sesion");
                return;
            }
            Map<String, Object> model = new HashMap<>();
            model.put("usuario", usuario);
            ctx.render("profile.ftl", model);
        });

        app.get("/dashboard", ctx -> {
            Usuario admin = ctx.sessionAttribute("user");
            if (admin == null || !admin.isAdmin()) {
                ctx.redirect("/?error=Acceso+no+autorizado");
                return;
            }

            Map<String, Object> model = new HashMap<>();
            model.put("usuarios", UsuarioDAO.listarTodos());
            model.put("admin", admin);
            ctx.render("dashboard.ftl", model);
        });

        app.post("/eliminar-usuario", ctx -> {
            int userId = Integer.parseInt(ctx.formParam("id"));
            UsuarioDAO.eliminarUsuario(userId);
            ctx.redirect("/dashboard?success=Usuario+eliminado");
        });

        app.get("/logout", ctx -> {
            ctx.req().getSession().invalidate();
            ctx.redirect("/");
        });


        // Mostrar formulario de creación de usuario para el admin
        app.get("/admin/nuevo-usuario", ctx -> {
            Usuario admin = ctx.sessionAttribute("user");
            if (admin == null || !admin.isAdmin()) {
                ctx.redirect("/?error=Acceso+no+autorizado");
                return;
            }

            Map<String, Object> model = new HashMap<>();
            model.put("usuario", admin);
            model.put("titulo", "Nuevo Usuario"); // puedes reutilizar el mismo formulario con cambio de título
            ctx.render("admin_register.ftl", model);
        });

        // Procesar formulario de creación de usuario desde el admin
        app.post("/admin/nuevo-usuario", ctx -> {
            Usuario admin = ctx.sessionAttribute("user");
            if (admin == null || !admin.isAdmin()) {
                ctx.redirect("/?error=Acceso+no+autorizado");
                return;
            }

            try {
                Usuario nuevo = new Usuario();
                nuevo.setUsername(ctx.formParam("username"));
                nuevo.setEmail(ctx.formParam("email"));
                nuevo.setPassword(ctx.formParam("password"));
                nuevo.setAdmin("on".equals(ctx.formParam("admin"))); // checkbox para marcar si será admin

                UsuarioDAO.guardarUsuario(nuevo);
                ctx.redirect("/dashboard?success=Usuario+creado+correctamente");
            } catch (Exception e) {
                Map<String, Object> model = new HashMap<>();
                model.put("error", e.getMessage());
                model.put("usuario", admin);
                model.put("titulo", "Nuevo Usuario");
                ctx.render("admin_register.ftl", model);
            }
        });
    }
}