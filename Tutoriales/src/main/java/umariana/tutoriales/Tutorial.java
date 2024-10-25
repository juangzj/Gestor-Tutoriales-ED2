/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package umariana.tutoriales;

/**
 *
 * @author fparra
 */
public class Tutorial {
    private int idTutorial;
    private String titulo;
    private String url;
    private int prioridad;
    private boolean estado;
    private int idCategoria;

    public Tutorial() {
    }

    public Tutorial(int idTutorial, String titulo, String url, int prioridad, boolean estado, int idCategoria) {
        this.idTutorial = idTutorial;
        this.titulo = titulo;
        this.url = url;
        this.prioridad = prioridad;
        this.estado = estado;
        this.idCategoria = idCategoria;
    }

    public int getIdTutorial() {
        return idTutorial;
    }

    public void setIdTutorial(int idTutorial) {
        this.idTutorial = idTutorial;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public int getPrioridad() {
        return prioridad;
    }

    public void setPrioridad(int prioridad) {
        this.prioridad = prioridad;
    }

    public boolean isEstado() {
        return estado;
    }

    public void setEstado(boolean estado) {
        this.estado = estado;
    }

    public int getIdCategoria() {
        return idCategoria;
    }

    public void setIdCategoria(int idCategoria) {
        this.idCategoria = idCategoria;
    }
    
    
}
