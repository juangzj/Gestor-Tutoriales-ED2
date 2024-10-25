
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import umariana.tutoriales.GestionarTutoriales;
import umariana.tutoriales.Tutorial;

/**
 *
 * @author fparra
 */
@WebServlet(urlPatterns = {"/sv_listarTutoriales"})
public class sv_listarTutoriales extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Crear una instancia de la clase GestionarTutoriales
        GestionarTutoriales gestionar = new GestionarTutoriales();
        List<Tutorial> listaTutoriales = null;
        
        try{
        listaTutoriales = gestionar.listarTutoriales();
        
        }catch(SQLException e){
            e.printStackTrace();
            return;
        }
        request.setAttribute("listaTutoriales", listaTutoriales);
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
