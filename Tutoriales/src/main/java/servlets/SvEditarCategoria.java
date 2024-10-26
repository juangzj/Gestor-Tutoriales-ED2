package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import umariana.tutoriales.GestionarCategorias;

/**
 *
 * @author Usuario 1
 */
@WebServlet(name = "SvEditarCategoria", urlPatterns = {"/SvEditarCategoria"})
public class SvEditarCategoria extends HttpServlet {

    //Llamado a la clase gestiona
    GestionarCategorias gestionaCategoria = new GestionarCategorias();
    //Variable donde se guardará el id temporalmente
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

        String idCategoria = request.getParameter("idCategoriaEditar");
        String confirmacion = request.getParameter("confrimacionEdicion");
        String categoria = request.getParameter("categoriaEditar");

        System.out.println("la categoria es: " + id + confirmacion);
        if (idCategoria != null) {
            id = Integer.parseInt(idCategoria);
        }
        if (confirmacion != null) {
            boolean categoriaEditada = gestionaCategoria.editarCategoria(id, categoria);

            //Obtenemos la sesion
            HttpSession miSesion = request.getSession();
            if (categoriaEditada == true) {
                miSesion.setAttribute("categoriaEditada", "true");
            }
            if (categoriaEditada == false) {
                miSesion.setAttribute("categoriaEditada", "false");
            }
        }

        response.sendRedirect("categorias.jsp");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
