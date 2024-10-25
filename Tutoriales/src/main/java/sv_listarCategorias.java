/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import umariana.tutoriales.Categoria;
import umariana.tutoriales.GestionarCategorias;
import umariana.tutoriales.GestionarTutoriales;
import umariana.tutoriales.Tutorial;

/**
 *
 * @author fparra
 */
@WebServlet(urlPatterns = {"/sv_listarCategorias"})
public class sv_listarCategorias extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Crear una instancia de la clase GestionarTutoriales
        GestionarCategorias gestionarC = new GestionarCategorias();
        List<Categoria> listaCategorias = null;
        
        try{
        listaCategorias = gestionarC.listarCategorias();
        
        }catch(SQLException e){
            e.printStackTrace();
            return;
        }
        request.setAttribute("listaCategorias", listaCategorias);
        request.getRequestDispatcher("index.jsp").forward(request, response);    
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
