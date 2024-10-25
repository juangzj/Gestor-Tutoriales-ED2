
package umariana.tutoriales;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class GestionarTutoriales {
    
    Conexion conectar = new Conexion();
        // Métodos para CRUD y otras operaciones relacionadas con los tutoriales
    public void agregarTutorial(Tutorial tutorial) {
        // Lógica para agregar un tutorial a la base de datos
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
