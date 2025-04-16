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
            config.staticFiles.add(staticFileConfig -> {
                staticFileConfig.hostedPath = "/";
                staticFileConfig.directory = "public";
                staticFileConfig.precompress = false;
                staticFileConfig.aliasCheck = null;
            });
            config.fileRenderer(new JavalinFreemarker(freemarkerConfig));
        }).start(8080);

        // Inicio

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
                ctx.redirect("/principal");
            } else {
                Map<String, Object> model = new HashMap<>();
                model.put("error", "Credenciales incorrectas");
                ctx.render("login.ftl", model);
            }
        });

        app.get("/principal", ctx -> {
            Usuario usuario = ctx.sessionAttribute("user");
            if (usuario == null) {
                ctx.redirect("/?error=Debe+iniciar+sesion");
                return;
            }

            Map<String, Object> model = new HashMap<>();
            model.put("usuario", usuario);
            if (usuario.isAdmin()) {
                model.put("usuarios", UsuarioDAO.listarTodos());
            }
            ctx.render("principal.ftl", model);
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

        app.get("/profile", ctx -> {
            Usuario usuario = ctx.sessionAttribute("user");
            if (usuario == null) {
                ctx.redirect("/?error=Debe+iniciar+sesion");
                return;
            }
            Map<String, Object> model = new HashMap<>();
            model.put("usuario", usuario);
            ctx.render("profile.ftl", model);
        });

        app.get("/admin-dashboard", ctx -> {
            Usuario usuario = ctx.sessionAttribute("user");
            if (usuario == null) {
                ctx.redirect("/?error=Debe+iniciar+sesion");
                return;
            }
            Map<String, Object> model = new HashMap<>();
            model.put("usuario", usuario);
            ctx.render("dashboard.ftl", model);
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
            model.put("titulo", "Nuevo Usuario");
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

        app.get("/accion", ctx -> {
            Usuario usuario = ctx.sessionAttribute("user");
            if (usuario == null) {
                ctx.redirect("/?error=Debe+iniciar+sesion");
                return;
            }
            Map<String, Object> model = new HashMap<>();
            model.put("usuario", usuario);
            ctx.render("accion.ftl", model);
        });

        app.get("/drama", ctx -> {
            Usuario usuario = ctx.sessionAttribute("user");
            if (usuario == null) {
                ctx.redirect("/?error=Debe+iniciar+sesion");
                return;
            }
            Map<String, Object> model = new HashMap<>();
            model.put("usuario", usuario);
            ctx.render("drama.ftl", model);
        });

        app.get("/terror", ctx -> {
            Usuario usuario = ctx.sessionAttribute("user");
            if (usuario == null) {
                ctx.redirect("/?error=Debe+iniciar+sesion");
                return;
            }
            Map<String, Object> model = new HashMap<>();
            model.put("usuario", usuario);
            ctx.render("terror.ftl", model);
        });

        app.get("/romance", ctx -> {
            Usuario usuario = ctx.sessionAttribute("user");
            if (usuario == null) {
                ctx.redirect("/?error=Debe+iniciar+sesion");
                return;
            }
            Map<String, Object> model = new HashMap<>();
            model.put("usuario", usuario);
            ctx.render("romance.ftl", model);
        });

        app.get("/cienciaficcion", ctx -> {
            Usuario usuario = ctx.sessionAttribute("user");
            if (usuario == null) {
                ctx.redirect("/?error=Debe+iniciar+sesion");
                return;
            }
            Map<String, Object> model = new HashMap<>();
            model.put("usuario", usuario);
            ctx.render("cienciaficcion.ftl", model);
        });

        app.get("/animacion", ctx -> {
            Usuario usuario = ctx.sessionAttribute("user");
            if (usuario == null) {
                ctx.redirect("/?error=Debe+iniciar+sesion");
                return;
            }
            Map<String, Object> model = new HashMap<>();
            model.put("usuario", usuario);
            ctx.render("animacion.ftl", model);
        });

        app.get("/aventura", ctx -> {
            Usuario usuario = ctx.sessionAttribute("user");
            if (usuario == null) {
                ctx.redirect("/?error=Debe+iniciar+sesion");
                return;
            }
            Map<String, Object> model = new HashMap<>();
            model.put("usuario", usuario);
            ctx.render("aventura.ftl", model);
        });

        app.get("/princip", ctx -> {
            Usuario usuario = ctx.sessionAttribute("user");
            if (usuario == null) {
                ctx.redirect("/?error=Debe+iniciar+sesion");
                return;
            }
            Map<String, Object> model = new HashMap<>();
            model.put("usuario", usuario);
            ctx.render("principal.ftl", model);
        });
    }
}