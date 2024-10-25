
package umariana.tutoriales;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class GestionarTutoriales {
    
    Conexion conectar = new Conexion();
    /**
     * Metodo para agregar un tutorial
     * @param titulo
     * @param url
     * @param prioridad
     * @param estado
     * @param idCategoria
     * @return 
     */
     
    public boolean agregarTutorial(String titulo, String url, int prioridad, boolean estado, int idCategoria) {
        boolean tutorialAgregado = false;
        Connection conexion = null;
        PreparedStatement consulta = null;

        try {
            // Conectar a la base de datos
            conexion = conectar.obtenerConexion();

            // Crear la consulta SQL para insertar el tutorial
            String sql = "INSERT INTO tutoriales (titulo, url, prioridad, estado, idCategoria) VALUES (?, ?, ?, ?, ?)";

            // Preparar la consulta
            consulta = conexion.prepareStatement(sql);
            consulta.setString(1, titulo);
            consulta.setString(2, url);
            consulta.setInt(3, prioridad);
            consulta.setBoolean(4, estado);
            consulta.setInt(5, idCategoria);

            // Ejecutar la consulta
            int filasInsertadas = consulta.executeUpdate();

            // Verificar si se insertó al menos una fila
            if (filasInsertadas > 0) {
                tutorialAgregado = true;
            }
        } catch (SQLException e) {
            System.out.println("Error al agregar el tutorial: " + e.getMessage());
        } finally {
            // Cerrar recursos
            try {
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

        return tutorialAgregado;
    }

    /**
     * Metodo que permite listar los datos de la tabla tutoriales
     * @return 
     * @throws java.sql.SQLException 
     */
    public List<Tutorial> listarTutoriales() throws SQLException {
        // Definición de variables
        List<Tutorial> misTutoriales = new ArrayList<>();
        Connection conexion = null;
        PreparedStatement consulta = null;
        ResultSet resultado = null; 
        
        try{
            conexion = conectar.obtenerConexion(); // Aquí utilizamos el método obtenerConexion() existente
            consulta = conexion.prepareStatement("select * from tutoriales");
            resultado = consulta.executeQuery(); 
            while(resultado.next()){  
                Tutorial tutorial = new Tutorial(); 
                tutorial.setIdTutorial(resultado.getInt("idTutorial"));
                tutorial.setTitulo(resultado.getString("titulo"));
                tutorial.setUrl(resultado.getString("url"));
                tutorial.setPrioridad(resultado.getInt("prioridad"));
                tutorial.setEstado(resultado.getBoolean("estado"));
                tutorial.setIdCategoria(resultado.getInt("idCategoria"));
                misTutoriales.add(tutorial);
            }
            
        }catch(SQLException e){
            e.printStackTrace();
        }   
        consulta.close();
        conexion.close();
        return misTutoriales;
    }
    
    
    
    public Tutorial obtenerTutorialPorId(int idTutorial) {
        // Lógica para obtener un tutorial por su ID desde la base de datos
        return null;
    }

    public void actualizarTutorial(Tutorial tutorial) {
        // Lógica para actualizar un tutorial en la base de datos
    }

    public void eliminarTutorial(int idTutorial) {
        // Lógica para eliminar un tutorial de la base de datos
    }
}
