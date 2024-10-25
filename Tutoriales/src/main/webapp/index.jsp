<%@page import="umariana.tutoriales.Categoria"%>
<%@page import="umariana.tutoriales.GestionarCategorias"%>
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
                        <select name="prioridad" class="form-control" required>
                            <option value="" disabled selected>Seleccione la prioridad</option>
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                            <option value="6">6</option>
                            <option value="7">7</option>
                            <option value="8">8</option>
                            <option value="9">9</option>
                            <option value="10">10</option>
                        </select>
                    </div><br>
                    <div class="form-group">
                        <select name="estado" class="form-control" required>
                            <option value="" disabled selected>Seleccione el estado</option>
                            <option value="true">Visto</option>
                            <option value="false">No visto</option>
                        </select>
                    </div><br>
                    <div class="form-group">
                        <label for="categoria">Seleccione la categoría</label>
                        <select name="categoria" class="form-control" required>
                            <option value="" disabled selected>Seleccione una categoría</option>
                            <%
                                // Obtener la lista de categorías y verificar si no está vacía
                                GestionarCategorias categorias = new GestionarCategorias();
                                List<Categoria> listaCategorias = categorias.listarCategorias();

                                if (listaCategorias != null && !listaCategorias.isEmpty()) {
                                    // Generar una opción para cada categoría en la lista
                                    for (Categoria categoria : listaCategorias) {
                            %>
                            <option value="<%= categoria.getIdCategoria()%>"><%= categoria.getCategorias()%></option>
                            <%
                                    }
    } else {
                            %>
                                
                                
                                <option value="">No hay Ninguna categoria agregada aun</option>
                                
                            <%
                                }
                            %>
                        </select>
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
                                for (Tutorial tutorial : lista) {
                        %>
                        <tr>
                            <td><%= tutorial.getIdTutorial()%></td>
                            <td><%= tutorial.getTitulo()%></td>
                            <td><a href="<%= tutorial.getUrl()%>" target="_blank">Enlace</a></td>
                            <td><%= tutorial.getPrioridad()%></td>
                             <% 
                                if (tutorial.isEstado() == true) {
                             %>
                             <td>Visto</td>
                             <%
                             } else {
                             %>
                             <td>No Visto</td>
                             <%
                                 }
                             %>

                            <td><%= tutorial.getIdCategoria()%></td>
                            <td>
                                <a href="#" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#exampleModal"><i class="fa fa-eye"></i></a>                                
                                <a href="#" class="btn btn-warning"><i class="fa fa-marker"></i></a>
                                <!-- Botón para abrir el modal de eliminacion  -->
                                <button type="button" class="btn btn-danger eliminarTutorial-btn" data-bs-toggle="modal" data-bs-target="#exampleModal" data-id="<%= tutorial.getIdTutorial()%>"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16">
                                <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5m2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5m3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0z"/>
                                <path d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4zM2.5 3h11V2h-11z"/>
                                 </svg></button>
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
                    
                        <!-- Modal Para Eliminar un tutorial-->
                        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h1 class="modal-title fs-5" id="exampleModalLabel">Eliminar</h1>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <p>¿Estás seguro de que deseas ELIMINAR el tutorial con ID: <span id="tutorialIdEliminar"></span>?</p>
                                    </div>
                                    <form action="SvEliminarTutorial" method="POST">
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                                            <button type="submit" class="btn btn-primary" name="confirmacionEliminacion" value="confirmacionEliminar" >Eliminar</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <!-- CDN JQUERY -->
                            <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
                            
                                <!-- Script para obtener el id del tutorial que se va a elimnar y despues enviarla por ajaxx al servlet -->
                                <script>
                                    // Captur clic y mandar el id del tutorial que se va a eliminar 
                                    $('.eliminarTutorial-btn').on('click', function () {
                                        // Obtener el ID del tutorial
                                        const idTutorialEliminar = $(this).data('id');
                                        // Mostrar el ID en el modal de eliminación
                                        $('#tutorialIdEliminar').text(idTutorialEliminar);

                                        // Envío de ID al servlet a través de AJAX (método POST)
                                        $.ajax({
                                            url: 'SvEliminarTutorial', // Url donde se enviara los datos(en este caso el id)
                                            method: 'POST', // Método de solicitud por donde llegara la información al servlet
                                            data: {idTutorialEliminar: idTutorialEliminar}, // Datos a enviar (en este caso, el ID)
                                            success: function (response) {
                                                // Manejar la respuesta del servidor si es necesario
                                            },
                                            error: function (xhr, status, error) {
                                                console.error('Error al enviar la solicitud:', error);
                                            }
                                        });
                                    });
                                </script>


<%@include file="lib/footer.jsp" %>