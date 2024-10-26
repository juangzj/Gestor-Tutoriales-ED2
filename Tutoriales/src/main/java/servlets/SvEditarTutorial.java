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
@WebServlet(name = "SvEditarTutorial", urlPatterns = {"/SvEditarTutorial"})
public class SvEditarTutorial extends HttpServlet {

    //Llamado a la clase GestioanrTutoriales para acceder a sus metodos
    GestionarTutoriales gestionaTutoriales = new GestionarTutoriales();
    //Variable donde se guaradá el id temporalmente
    int id = 0;
     
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idTutorial = request.getParameter("idTutorialEditar");
        String titulo = request.getParameter("tituloEditar");
        String url = request.getParameter("urlEditar");
        String prioridad = request.getParameter("prioridadEditar");
        String estado = request.getParameter("estadoEditar");
        String categoria = request.getParameter("categoriaEditar");
                
        
        if(idTutorial != null){
            id = Integer.parseInt(idTutorial);
        }
        
        if(titulo != null && url != null && prioridad != null && estado != null && categoria != null ){
            gestionaTutoriales.editarTutorial(id, titulo, url, Integer.parseInt(prioridad), Boolean.parseBoolean(estado), Integer.parseInt(categoria));
        }
        
        
        
        
        response.sendRedirect("index.jsp");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
