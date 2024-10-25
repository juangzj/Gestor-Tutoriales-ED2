
package umariana.tutoriales;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class Conexion {
       /**
    * Metodo que realiza la conexión con la base de datos
    * @return la conexión
    * @throws SQLException 
    */
    public Connection obtenerConexion() throws SQLException {
        String url = "jdbc:mysql://localhost:3306/tutorial";
        String usuario = "root";
        String contrasena = "root";
        Connection conexion = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conexion = DriverManager.getConnection(url, usuario, contrasena);
            
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return conexion;
    }
}
