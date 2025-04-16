package org.example;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import java.util.List;

public class UsuarioDAO {
    private static final SessionFactory sessionFactory = new Configuration()
            .configure("hibernate.cfg.xml")
            .buildSessionFactory();

    public static void guardarUsuario(Usuario usuario) {
        try (Session session = sessionFactory.openSession()) {
            session.beginTransaction();
            session.persist(usuario);
            session.getTransaction().commit();
        }
    }

    public static Usuario validarCredenciales(String username, String password) {
        try (Session session = sessionFactory.openSession()) {
            Usuario usuario = session.createQuery(
                            "FROM Usuario WHERE username = :username AND password = :password", Usuario.class)
                    .setParameter("username", username)
                    .setParameter("password", password)
                    .uniqueResult();
            return usuario;
        }
    }

    public static List<Usuario> listarTodos() {
        try (Session session = sessionFactory.openSession()) {
            return session.createQuery("FROM Usuario", Usuario.class).list();
        }
    }

    public static void eliminarUsuario(int id) {
        try (Session session = sessionFactory.openSession()) {
            session.beginTransaction();
            Usuario usuario = session.get(Usuario.class, id);
            if (usuario != null) {
                session.remove(usuario);
            }
            session.getTransaction().commit();
        }
    }
}