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
                            
                                      <!-- Botón para abrir el modal de editar -->
                                      <button type="button" class="btn btn-warning editarCategoria-btn" 

                                              data-bs-toggle="modal" 
                                              data-bs-target="#exampleModalEditar" 
                                              data-id="<%= categoria.getIdCategoria()%>"
                                              data-nombre="<%= categoria.getCategorias()%>"
                                              > <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil" viewBox="0 0 16 16">
                                              <path d="M12.146.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-10 10a.5.5 0 0 1-.168.11l-5 2a.5.5 0 0 1-.65-.65l2-5a.5.5 0 0 1 .11-.168zM11.207 2.5 13.5 4.793 14.793 3.5 12.5 1.207zm1.586 3L10.5 3.207 4 9.707V10h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.293zm-9.761 5.175-.106.106-1.528 3.821 3.821-1.528.106-.106A.5.5 0 0 1 5 12.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.468-.325"/>
                                          </svg>
                                      </button>
                               
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
<!-- Manejo de mensajes de alertas -->

<%
    /**
     * Alerta de categoria agregada
     */
    //Obtenemos el resultado que se obtuvo al agregar una categoria
    String alertaCategoriaAgregada = (String) request.getSession().getAttribute("categoriaAgregada");

    //Comprobamos si el resultado es diferente de null o de vacia
    if (alertaCategoriaAgregada != null && !alertaCategoriaAgregada.isEmpty()) {

        //Segun el resultado
        if (alertaCategoriaAgregada.equals("true")) {
%>  
<script>
    Swal.fire({
        title: "Categoria Agregada",
        text: "Se agregó correctamenta la categoria",
        icon: "success"

    });

</script>

<%
} else if (alertaCategoriaAgregada.equals("false")) {
%>
<script>
Swal.fire({
title: "Error al agregar la categría",
text: "No pudo agregar la categoría, por favor intentelo de nuevo",
icon: "error"
});
</script>  
<%
        }

    }

    //Limpiamos el resutlado para evitar erroes
    request.getSession().removeAttribute("categoriaAgregada");

%>
<%                        /**
     * Alerta de categoria Eliminada
     */
    //Obtenemos el resultado de la categoria eliminada
    String alertaCategoriaEliminada = (String) request.getSession().getAttribute("categoriaEliminada");

    //Comprobamos si el resultado es diferente de vacio o de null
    if (alertaCategoriaEliminada != null && !alertaCategoriaEliminada.isEmpty()) {
        //Evaluamos el resultado de la eliminación
        if (alertaCategoriaEliminada.equals("true")) {
%>

<script>
    Swal.fire({
        title: "Eliminación Exitosa",
        text: "Se ha eliminado la categoria de forma exitosa",
        icon: "success"

    });
</script>


<%
    }
    if (alertaCategoriaEliminada.equals("false")) {
%>
<script>
    Swal.fire({
        title: "Error",
        text: "No se puede eliminar la categoria porque esta ligada a uno o más tutoriales",
        icon: "error"

    });
</script> 
<%
        }
    }
    request.getSession().removeAttribute("categoriaEliminada");

%>









                        
                    <!-- Modal Para Editar una categoria -->
                    <div class="modal fade" id="exampleModalEditar" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">

                                    <h1 class="modal-title fs-5" id="exampleModalLabel">Editar</h1>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <form action="SvEditarCategoria" method="POST">
                                    <div class="modal-body">
                                        <p>¿Estás seguro de que deseas EDITAR la categoria con ID: <span id="categoriaIdEditar"></span>?</p>

                                        <div class="form-group">
                                            <input type="text" name="categoriaEditar" id="categoriaEditar" class="form-control" placeholder="ingrese la categoria" autofocus >
                                        </div><br>

                                    </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                                                    <button type="submit" name="confrimacionEdicion" value="editar" class="btn btn-primary">Editar</button>
                                                </div>
                                </form>


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
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" >Cancelar</button>
                                        <button type="submit" class="btn btn-primary" name="confirmacionEliminacion" value="confirmacionEliminar" >Eliminar</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    
                    
                    <!-- CDN JQUERY  -->
                    <script src="https://code.jquery.com/jquery-3.6.0.js"></script> 
                                      <!-- Script para obtener el id de la categoria que se va a editar y despues enviarla por ajaxx al servlet -->
                    <script>
                        // Captur clic y mandar el id de la  categoria que se va a editar 
                        $('.editarCategoria-btn').on('click', function () {
                            // Obtener el ID de la categoria
                            const idCategoriaEditar = $(this).data('id');
                            // Mostrar el ID en el modal de la edicion
                            $('#categoriaIdEditar').text(idCategoriaEditar);

                            // Envío de ID al servlet a través de AJAX (método POST)
                            $.ajax({
                                url: 'SvEditarCategoria', // Url donde se enviara los datos(en este caso el id)
                                method: 'POST', // Método de solicitud por donde llegara la información al servlet
                                data: {idCategoriaEditar: idCategoriaEditar}, // Datos a enviar (en este caso, el ID)
                                success: function (response) {
                                    // Manejar la respuesta del servidor si es necesario
                                },
                                error: function (xhr, status, error) {
                                    console.error('Error al enviar la solicitud:', error);
                                }
                            });
                        });
                    </script>
     
                    
                    <!-- script para capturar las variables y que se muestren en el modal -->
                    <script>
    
    $(document).ready(function(){
    // Manejar el evento cuando se hace clic en el enlace de la modal
    $('#exampleModalEditar').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget); // Botón que abrió la modal
        var nombre = button.data('nombre');
    
        
        // Actualizar el contenido de la modal
        var modal = $(this);
        modal.find('#categoriaEditar').val(nombre);
    });
});

                    </script>
                    
                                   
           
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