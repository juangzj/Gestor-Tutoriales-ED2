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
                <h5>Crear Categorias</h5>
                <form action="SvAgregarCategoria" method="POST">
                    <div class="form-group">
                        <input type="text" name="categoria" class="form-control" placeholder="ingrese la categoria" autofocus required>
                    </div><br>

                    <input type="submit" class="btn btn-success btn-block" name="guardar" value="Guardar">
                </form>

            </div>
        </div>
        <div class="col-md-8"> <!-- Columna derecha -->
            <div class="card card-body">
                <h5>Listado de categorias</h5>
                <table border="1">
                    <thead>
                        <tr>
                            <th>Id</th>
                            <th>categoria</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            GestionarCategorias categorias = new GestionarCategorias();
                            // Obtener la lista de categorias del atributo de la solicitud
                            List<Categoria> lista = categorias.listarCategorias();

                            // Verificar si la lista de categorias no es nula y no está vacía
                            if (lista != null && !lista.isEmpty()) {
                                for (Categoria categoria : lista) {
                        %>
                        <tr>
                            <td><%= categoria.getIdCategoria()%></td>
                            <td><%= categoria.getCategorias()%></td>
                            <td>                              
                                <a href="#" class="btn btn-warning"><i class="fa fa-marker"></i></a>
                               
                                  <!-- Botón para abrir el modal de eliminacion  -->
                        <button type="button" class="btn btn-danger eliminarCategoria-btn" data-bs-toggle="modal" data-bs-target="#exampleModal" data-id="<%= categoria.getIdCategoria()%>"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16">
                                <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5m2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5m3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0z"/>
                                <path d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4zM2.5 3h11V2h-11z"/>
                            </svg>
                        </button>

                            </td>
                        </tr>
                        <%
                            }
                        } else {
                        %>
                        <tr>
                            <td colspan="6">No hay categorias para mostrar.</td>
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
                    <!-- Modal Para Eliminar una valoracion-->
                    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h1 class="modal-title fs-5" id="exampleModalLabel">Eliminar</h1>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <p>¿Estás seguro de que deseas ELIMINAR la categoria con ID: <span id="categoriaIdEliminar"></span>?</p>
                                </div>
                                <form action="SvEliminarCategoria" method="POST">
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                                        <button type="submit" class="btn btn-primary" name="confirmacionEliminacion" value="confirmacionEliminar" >Eliminar</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    
                    
                    <!-- CDN JQUERY  -->
                    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>                    
                    <!-- Script para obtener el id de la valoracion que se va a elimnar y despues enviarla por ajaxx al servlet -->
                    <script>
                        // Captur clic y mandar el id de la categoria  que se va a eliminar 
                        $('.eliminarCategoria-btn').on('click', function () {
                            // Obtener el ID de la categoria
                            const idCategoriaEliminar = $(this).data('id');
                            // Mostrar el ID en el modal de eliminación
                            $('#categoriaIdEliminar').text(idCategoriaEliminar);

                            // Envío de ID al servlet a través de AJAX (método POST)
                            $.ajax({
                                url: 'SvEliminarCategoria', // Url donde se enviara los datos(en este caso el id)
                                method: 'POST', // Método de solicitud por donde llegara la información al servlet
                                data: {idCategoriaEliminar: idCategoriaEliminar}, // Datos a enviar (en este caso, el ID)
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