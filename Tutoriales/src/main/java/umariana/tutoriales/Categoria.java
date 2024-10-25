
package umariana.tutoriales;


public class Categoria {
    private int idCategoria;
    private String categorias;

    public Categoria() {
    }

    public Categoria(int idCategoria, String categorias) {
        this.idCategoria = idCategoria;
        this.categorias = categorias;
    }

    public int getIdCategoria() {
        return idCategoria;
    }

    public void setIdCategoria(int idCategoria) {
        this.idCategoria = idCategoria;
    }

    public String getCategorias() {
        return categorias;
    }

    public void setCategorias(String categorias) {
        this.categorias = categorias;
    }
    
    
}
