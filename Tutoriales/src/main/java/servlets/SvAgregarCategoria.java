package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import umariana.tutoriales.GestionarCategorias;

/**
 *
 * @author Usuario 1
 */
@WebServlet(name = "SvAgregarCategoria", urlPatterns = {"/SvAgregarCategoria"})
public class SvAgregarCategoria extends HttpServlet {

    //LLamado a la calse GestionarCategorias para acceder a sus metodos
    GestionarCategorias gestionaCategoria = new GestionarCategorias();
    
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
        
        String categoria = request.getParameter("categoria");
        
        if (categoria != null){
            gestionaCategoria.agregarCategoria(categoria);
        }
      
        
        response.sendRedirect("categorias.jsp");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
