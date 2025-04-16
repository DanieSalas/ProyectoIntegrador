package org.example;

import jakarta.persistence.*;

@Entity
@Table(name = "peliculas")
public class Pelicula {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id_pelicula;

    @Column(nullable = false, length = 255)
    private String titulo;

    private int duracion_min;

    @ManyToOne
    @JoinColumn(name = "id_director", referencedColumnName = "id_director")
    private Director director;

    @ManyToOne
    @JoinColumn(name = "id_genero", referencedColumnName = "id_genero")
    private Genero genero;

    @Column(precision = 3, scale = 2)
    private Double promedio_rating;

    public Pelicula() {
    }

    public Pelicula(String titulo, int duracion_min, Director director, Genero genero) {
        this.titulo = titulo;
        this.duracion_min = duracion_min;
        this.director = director;
        this.genero = genero;
        this.promedio_rating = null;
    }

    public int getId_pelicula() {
        return id_pelicula;
    }

    public void setId_pelicula(int id_pelicula) {
        this.id_pelicula = id_pelicula;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public int getDuracion_min() {
        return duracion_min;
    }

    public void setDuracion_min(int duracion_min) {
        this.duracion_min = duracion_min;
    }

    public Director getDirector() {
        return director;
    }

    public void setDirector(Director director) {
        this.director = director;
    }

    public Genero getGenero() {
        return genero;
    }

    public void setGenero(Genero genero) {
        this.genero = genero;
    }

    public Double getPromedio_rating() {
        return promedio_rating;
    }

    public void setPromedio_rating(Double promedio_rating) {
        this.promedio_rating = promedio_rating;
    }

    @Override
    public String toString() {
        return "Pelicula{" +
                "id_pelicula=" + id_pelicula +
                ", titulo='" + titulo + '\'' +
                ", duracion_min=" + duracion_min +
                ", director=" + (director != null ? director.getNombre() : "null") +
                ", genero=" + (genero != null ? genero.getNombre() : "null") +
                ", promedio_rating=" + promedio_rating +
                '}';
    }
}
