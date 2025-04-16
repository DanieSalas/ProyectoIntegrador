package org.example;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PeliculaDAO {
    private final Connection conn;

    public PeliculaDAO(Connection conn) {
        this.conn = conn;
    }

    // Obtener una película por ID
    public Pelicula obtenerPorId(int id) {
        String sql = "SELECT * FROM peliculas WHERE id_pelicula = ?";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                Pelicula pelicula = new Pelicula();
                pelicula.setId_pelicula(rs.getInt("id_pelicula"));
                pelicula.setTitulo(rs.getString("titulo"));
                pelicula.setDuracion_min(rs.getInt("duracion_min"));
                pelicula.setPromedio_rating(rs.getDouble("promedio_rating"));

                // Obtener director y género si es necesario
                Director director = new Director();
                director.setId_director(rs.getInt("id_director"));
                pelicula.setDirector(director);

                Genero genero = new Genero();
                genero.setId_genero(rs.getInt("id_genero"));
                pelicula.setGenero(genero);

                return pelicula;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // Obtener todas las películas
    public List<Pelicula> obtenerTodas() {
        List<Pelicula> lista = new ArrayList<>();
        String sql = "SELECT * FROM peliculas";
        try (Statement stmt = conn.createStatement()) {
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                Pelicula pelicula = new Pelicula();
                pelicula.setId_pelicula(rs.getInt("id_pelicula"));
                pelicula.setTitulo(rs.getString("titulo"));
                pelicula.setDuracion_min(rs.getInt("duracion_min"));
                pelicula.setPromedio_rating(rs.getDouble("promedio_rating"));

                Director director = new Director();
                director.setId_director(rs.getInt("id_director"));
                pelicula.setDirector(director);

                Genero genero = new Genero();
                genero.setId_genero(rs.getInt("id_genero"));
                pelicula.setGenero(genero);

                lista.add(pelicula);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return lista;
    }

    // Insertar nueva película
    public void insertar(Pelicula pelicula) {
        String sql = "INSERT INTO peliculas (titulo, duracion_min, id_director, id_genero, promedio_rating) VALUES (?, ?, ?, ?, ?)";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, pelicula.getTitulo());
            stmt.setInt(2, pelicula.getDuracion_min());
            stmt.setInt(3, pelicula.getDirector().getId_director());
            stmt.setInt(4, pelicula.getGenero().getId_genero());
            stmt.setObject(5, pelicula.getPromedio_rating());

            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Actualizar promedio
    public void actualizarPromedio(int idPelicula, double nuevoPromedio) {
        String sql = "UPDATE peliculas SET promedio_rating = ? WHERE id_pelicula = ?";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setDouble(1, nuevoPromedio);
            stmt.setInt(2, idPelicula);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public double calcularPromedio(int idPelicula) {
        String sql = "SELECT AVG(puntuacion) AS promedio FROM calificaciones WHERE id_pelicula = ?";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, idPelicula);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return rs.getDouble("promedio");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0.0; // Si no hay calificaciones, el promedio será 0
    }

}
