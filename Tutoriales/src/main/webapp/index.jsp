<%@ page import="java.util.List" %>
<%@ page import="umariana.tutoriales.Tutorial" %>
<%@ page import="umariana.tutoriales.GestionarTutoriales" %>
<%@include file="lib/header.jsp" %>
<%@include file="lib/navbar.jsp" %>
<p></p>
 <div class="container">
    <div class="row">
        <div class="col-md-4">
            <div class="card card-body">
                <h5>Crear tutorial</h5>
                <form action="SvAgregarTutorial" method="POST">
                    <div class="form-group">
                        <input type="text" name="titulo" class="form-control" placeholder="ingrese el titulo" autofocus required >
                    </div><br>
                    <div class="form-group">
                        <input type="text" name="url" class="form-control" placeholder="ingrese la URL" required >
                    </div><br>
                    <div class="form-group">
                        <input type="text" name="prioridad" class="form-control" placeholder="ingrese la prioridad" required  >
                    </div><br>
                    <div class="form-group">
                        <input type="text" name="estado" class="form-control" placeholder="ingrese el estado" required  >
                    </div><br>
                    <div class="form-group">
                        <input type="text" name="categoria" class="form-control" placeholder="ingrese la categoria" required  >
                    </div><br>
                    <input type="submit" class="btn btn-success btn-block" name="guardar" value="Guardar">
                </form>

            </div>
        </div>
        <div class="col-md-8"> <!-- Columna derecha -->
            <div class="card card-body">
                <h5>Listado de tutoriales</h5>
                <table border="1">
                    <thead>
                        <tr>
                            <th>Id</th>
                            <th>Titulo</th>
                            <th>Link</th>
                            <th>Prioridad</th>
                            <th>Estado</th>
                            <th>Categoria</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
<%
    GestionarTutoriales tutoriales = new GestionarTutoriales();
    // Obtener la lista de tutoriales del atributo de la solicitud
    List<Tutorial> lista = tutoriales.listarTutoriales();

    // Verificar si la lista de tutoriales no es nula y no está vacía
    if (lista != null && !lista.isEmpty()) {
        for(Tutorial tutorial : lista) {
%>
                        <tr>
                            <td><%= tutorial.getIdTutorial() %></td>
                            <td><%= tutorial.getTitulo() %></td>
                            <td><a href="<%= tutorial.getUrl() %>" target="_blank">Enlace</a></td>
                            <td><%= tutorial.getPrioridad() %></td>
                            <td><%= tutorial.isEstado() %></td>
                            <td><%= tutorial.getIdCategoria() %></td>
                            <td>
                                <a href="#" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#exampleModal"><i class="fa fa-eye"></i></a>                                
                                <a href="#" class="btn btn-warning"><i class="fa fa-marker"></i></a>
                                <button class="btn btn-danger" onclick="confirmDelete()"><i class="fa fa-trash-alt"></i></button>
                            </td>
                        </tr>
<%
        }
    } else {
%>
                        <tr>
                            <td colspan="6">No hay tutoriales para mostrar.</td>
                        </tr>
<%
    }
%>
                    </tbody>
                </table>

            </div>
        </div>
    </div>
</div>
 
 <%@include file="lib/footer.jsp" %>