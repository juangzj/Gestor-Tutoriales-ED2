
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import umariana.tutoriales.GestionarTutoriales;

/**
 *
 * @author Usuario 1
 */
@WebServlet(name = "SvAgregarTutorial", urlPatterns = {"/SvAgregarTutorial"})
public class SvAgregarTutorial extends HttpServlet {

    //LLamado a la clase GestionarTutoriales para acceder a sus metodos
    GestionarTutoriales gestionaTutorial =  new GestionarTutoriales();
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

        //Obtenemos los valores ingresados por el usuario
        String titulo = request.getParameter("titulo");
        String url = request.getParameter("url");
        String prioridad = request.getParameter("prioridad");
        String estado = request.getParameter("estado");
        String idCategoria = request.getParameter("categoria");

        if (titulo != null && url != null && prioridad != null && estado != null && idCategoria != null) {
            boolean tutorialAgregado = gestionaTutorial.agregarTutorial(titulo, url, Integer.parseInt(prioridad), Boolean.parseBoolean(estado), Integer.parseInt(idCategoria));

            //Obtenemos la sesion
            HttpSession miSesion = request.getSession();

            System.out.println("el resultado del tutorial es: " + tutorialAgregado);

            if (tutorialAgregado == true) {
                miSesion.setAttribute("tutorialAgregado", "true");
            }
            if (tutorialAgregado == false) {
                miSesion.setAttribute("tutorialAgregado", "false");
            }
        }

        response.sendRedirect("index.jsp");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
