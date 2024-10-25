/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package umariana.tutoriales;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author fparr
 */
public class GestionarCategorias {

    // objeto para manejar la conexion
    Conexion conectar = new Conexion();
    // Métodos para CRUD y otras operaciones relacionadas con los tutoriales

    /**
     * Metodo para agregar una nueva categoria
     *
     * @param categoria
     * @return
     */
    public boolean agregarCategoria(String categoria) {
        boolean categoriaAgregada = false;
        Connection conexion = null;
        PreparedStatement consulta = null;
        ResultSet resultado = null;

        String sqlVerificar = "SELECT * FROM categorias WHERE categoria = ?";
        String sqlInsertar = "INSERT INTO categorias(categoria) VALUES(?)";

        try {
            // Conectar a la base de datos
            conexion = conectar.obtenerConexion();

            // Verificar si la categoría ya existe
            consulta = conexion.prepareStatement(sqlVerificar);
            consulta.setString(1, categoria);
            resultado = consulta.executeQuery();

            if (!resultado.next()) { // Si no existe la categoría
                // Preparar la consulta para insertar la nueva categoría
                consulta = conexion.prepareStatement(sqlInsertar);
                consulta.setString(1, categoria);

                int filasInsertadas = consulta.executeUpdate();
                categoriaAgregada = filasInsertadas > 0;
            }

        } catch (SQLException e) {
            System.out.println("Error al agregar la categoría: " + e.getMessage());
        } finally {
            // Cerrar recursos
            try {
                if (resultado != null) {
                    resultado.close();
                }
                if (consulta != null) {
                    consulta.close();
                }
                if (conexion != null) {
                    conexion.close();
                }
            } catch (SQLException e) {
                System.out.println("Error al cerrar la conexión: " + e.getMessage());
            }
        }

        return categoriaAgregada;
    }

    /**
     * Metodo que permite listar los datos de la tabla tutoriales
     *
     * @return
     * @throws java.sql.SQLException
     */
    public List<Categoria> listarCategorias() throws SQLException {
        // Definición de variables
        List<Categoria> misCategorias = new ArrayList<>();
        Connection conexion = null;
        PreparedStatement consulta = null;
        ResultSet resultado = null;

        try {
            conexion = conectar.obtenerConexion(); // Aquí utilizamos el método obtenerConexion() existente
            consulta = conexion.prepareStatement("select * from categorias");
            resultado = consulta.executeQuery();
            while (resultado.next()) {
                Categoria categoria = new Categoria();
                categoria.setIdCategoria(resultado.getInt("idCategoria"));
                categoria.setCategorias(resultado.getString("categoria"));
                misCategorias.add(categoria);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        consulta.close();
        conexion.close();
        return misCategorias;
    }

    public Tutorial obtenerCategoriaId(int idCategoria) {
        // Lógica para obtener una categoria por su ID desde la base de datos
        return null;
    }

    /**
     * Metodo para editar una categoria
     * @param id
     * @param categoria
     * @return 
     */
    public boolean editarCategoria(int id, String categoria) {
        boolean categoriaEditada = false;
        Connection conexion = null;
        PreparedStatement consulta = null;

        try {
            // Obtener la conexión a la base de datos
            conexion = conectar.obtenerConexion();

            // Crear la consulta SQL para actualizar la categoría
            String sql = "UPDATE categorias SET categoria = ? WHERE idCategoria = ?";

            // Preparar la consulta
            consulta = conexion.prepareStatement(sql);

            // Establecer los parámetros en la consulta
            consulta.setString(1, categoria);
            consulta.setInt(2, id);

            // Ejecutar la consulta de actualización
            int filasActualizadas = consulta.executeUpdate();

            // Si se actualizó al menos una fila, la operación fue exitosa
            if (filasActualizadas > 0) {
                categoriaEditada = true;
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Muestra el error en consola
        } finally {
            // Cerrar los recursos de la base de datos
            if (consulta != null) {
                try {
                    consulta.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (conexion != null) {
                try {
                    conexion.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }

        return categoriaEditada;
    }


    /**
     * Metodo para eliminar una categoria
     * @param idCategoria
     * @return 
     */
    public boolean eliminarCategoria(int idCategoria) {
        boolean eliminacionCategoria = false;
        Connection conexion = null;
        PreparedStatement consulta = null;

        try {
            // Conectar a la base de datos
            conexion = conectar.obtenerConexion();

            // Consulta SQL para eliminar la categoría
            String sql = "DELETE FROM categorias WHERE idCategoria = ?";

            // Preparar la consulta
            consulta = conexion.prepareStatement(sql);
            consulta.setInt(1, idCategoria); // Asignar el valor del ID de la categoría

            // Ejecutar la consulta
            int filasAfectadas = consulta.executeUpdate();

            // Si se ha eliminado alguna fila, la categoría se eliminó correctamente
            if (filasAfectadas > 0) {
                eliminacionCategoria = true;
            }

        } catch (SQLException e) {
            e.printStackTrace(); // Manejar la excepción de SQL
        } finally {
            // Cerrar la conexión y el statement
            try {
                if (consulta != null) {
                    consulta.close();
                }
                if (conexion != null) {
                    conexion.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return eliminacionCategoria;
    }

}
