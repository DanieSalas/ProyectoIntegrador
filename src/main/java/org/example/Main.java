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
            model.put("titulo", "Registro de Usuario");
            ctx.render("form.ftl", model);
        });

        app.post("/submit", ctx -> {
            Map<String, Object> model = new HashMap<>();
            model.put("titulo", "Registro de Usuario");

            try {
                Usuario usuario = new Usuario();
                usuario.setUsername(ctx.formParam("username"));
                usuario.setEmail(ctx.formParam("email"));
                usuario.setPassword(ctx.formParam("password"));

                UsuarioDAO.guardarUsuario(usuario);

                model.put("usuario", usuario);
                ctx.render("result.ftl", model);

            } catch (Exception e) {
                model.put("error", "Error al registrar el usuario: " + e.getMessage());
                ctx.render("form.ftl", model);
            }
        });

        // Ruta para listar usuarios (requiere nueva plantilla y metodo en UsuarioDAO)
        app.get("/usuarios", ctx -> {
            // Implementación futura
        });
    }
}