package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import umariana.tutoriales.GestionarTutoriales;

/**
 *
 * @author Usuario 1
 */
@WebServlet(name = "SvEliminarTutorial", urlPatterns = {"/SvEliminarTutorial"})
public class SvEliminarTutorial extends HttpServlet {
    
    //LLamado a la clase GestionarTutoriales para acceder a sus metodos
    GestionarTutoriales gestionaTutoriales = new GestionarTutoriales();
    //Vaiable donde se guardará el id temporalmente
    int id = 0;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idTutorial = request.getParameter("idTutorialEliminar");
        String confirmacion = request.getParameter("confirmacionEliminacion");
        
        if(idTutorial != null){
            id = Integer.parseInt(idTutorial);
        }
        if(confirmacion != null){
            gestionaTutoriales.eliminarTutorial(id);
        }
        
        
        response.sendRedirect("index.jsp");
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
