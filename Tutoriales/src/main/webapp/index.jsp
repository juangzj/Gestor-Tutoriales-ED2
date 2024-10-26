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
                             <td>Revisado</td>
                             <%
                             } else {
                             %>
                             <td>Revisar</td>
                             <%
                                 }
                             %>
                             <%
                              
                                Categoria c = categorias.obtenerCategoriaId(tutorial.getIdCategoria());

                             %>

                            <td><%= c.getCategorias() %></td>
                            <td>
                           <!-- Botón para abrir el modal de ver -->
                        <button type="button" class="btn btn-success verTutorial-btn" 
                                data-bs-toggle="modal" 
                                data-bs-target="#exampleModalVer" 
                                data-id="<%=tutorial.getIdTutorial() %>"
                                data-titulo="<%= tutorial.getTitulo() %>"
                                data-url="<%= tutorial.getUrl() %>"
                                data-prioridad="<%= tutorial.getPrioridad()%>"
                                data-estado="<%= tutorial.isEstado() %>"
                                data-categoria="<%= tutorial.getIdCategoria() %>">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-eye" viewBox="0 0 16 16">
                                <path d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8M1.173 8a13 13 0 0 1 1.66-2.043C4.12 4.668 5.88 3.5 8 3.5s3.879 1.168 5.168 2.457A13 13 0 0 1 14.828 8q-.086.13-.195.288c-.335.48-.83 1.12-1.465 1.755C11.879 11.332 10.119 12.5 8 12.5s-3.879-1.168-5.168-2.457A13 13 0 0 1 1.172 8z"/>
                                <path d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5M4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0"/>
                            </svg>
                        </button>                                 
                                      <!-- Botón para abrir el modal de editar -->
                        <button type="button" class="btn btn-warning editarTutorial-btn" 
                                data-bs-toggle="modal" 
                                data-bs-target="#exampleModalEditar" 
                                data-id="<%= tutorial.getIdTutorial() %>"
                                data-titulo="<%= tutorial.getTitulo() %>"
                                data-url="<%= tutorial.getUrl() %>"
                                data-prioridad="<%= tutorial.getPrioridad()  %>"
                                data-estado="<%= tutorial.isEstado() %>"
                                data-categoria="<%= tutorial.getIdCategoria() %>">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-fill" viewBox="0 0 16 16">
                                <path d="M12.854.146a.5.5 0 0 0-.707 0L10.5 1.793 14.207 5.5l1.647-1.646a.5.5 0 0 0 0-.708zm.646 6.061L9.793 2.5 3.293 9H3.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.207zm-7.468 7.468A.5.5 0 0 1 6 13.5V13h-.5a.5.5 0 0 1-.5-.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.5-.5V10h-.5a.5.5 0 0 1-.175-.032l-.179.178a.5.5 0 0 0-.11.168l-2 5a.5.5 0 0 0 .65.65l5-2a.5.5 0 0 0 .168-.11z"/>
                            </svg>
                        </button>
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
                        <!-- Manejo de alertas para gestion de tutoriales -->
                        <%
                            /**
                             * Alerta para cuando se agrega un tutorial
                             */
                            //Obtenemos el resultado del tutorial agregado
                            String alertaTutorialAgregado = (String) request.getSession().getAttribute("tutorialAgregado");

                            //Evaluamos si el resultado es diferente de null
                            if (alertaTutorialAgregado != null && !alertaTutorialAgregado.isEmpty()) {
                                //Evaluamos el resultado 
                                if (alertaTutorialAgregado.equals("true")) {
                        %> 
                        <script>
                            Swal.fire({
                                title: "Tutorial Agregado",
                                text: "El tutorial se ha agregado de forma exitosa ",
                                icon: "success"
                            });
                        </script>
                        <%
                            }
                            if (alertaTutorialAgregado.equals("false")) {
                        %>
                        <script>
                            Swal.fire({
                                title: "Error",
                                text: "No se pudo agregar el tutorial. Por favor Intentelo de nuevo",
                                icon: "error"
                            });
                        </script>
                        <%
                                }
                            }
                            //limpiamos el atributo que contien el resultado del tutorial agregado
                            request.getSession().removeAttribute("tutorialAgregado");

                        %>
                        <%                            /**
                             * Alerta para la eliminacion de un tutorial
                             */
                            String alertaTutorialEliminado = (String) request.getSession().getAttribute("tutorialEliminado");

                            //Verificamos que el resultado sea difetene de null o de vacio
                            if (alertaTutorialEliminado != null && !alertaTutorialEliminado.isEmpty()) {

                                //Evaluamos el resultado
                                if (alertaTutorialEliminado.equals("true")) {
                        %> 
                        <script>
                            Swal.fire({
                                title: "Eliminacion Exitosa",
                                text: "El tutorial ha sido eliminado",
                                icon: "success"
                            });
                        </script>
                        <%
                            }
                            if (alertaTutorialEliminado.equals("false")) {
                        %>
                        <script>
                            Swal.fire({
                                title: "Error",
                                text: "No se pudo eliminar el tutorial",
                                icon: "error"

                            });
                        </script>
                        <%
                                }

                            }

                            //limpiamos el atributo que contien el resultado de la eliminacion
                            request.getSession().removeAttribute("tutorialEliminado");


                        %>
                        <%                            /**
                             * Alerta de edición de tutorial
                             */
                            //Obtenemos el resultado de la edicion de un tutorial
                            String alertaTutorialEditado = (String) request.getSession().getAttribute("tutorialEditado");

                            //verificamos el que resultado sea difetene de null y de vacio
                            if (alertaTutorialEditado != null && !alertaTutorialEditado.isEmpty()) {
                                //Evaluamos el resultado de la edicion
                                if (alertaTutorialEditado.equals("true")) {

                        %> 
                        <script>
                            Swal.fire({
                                title: "Edicion Exitosa",
                                text: "El tutorial ha sido editado de forma exitosa",
                                icon: "success"
                            });
                        </script>
                        <%    }
                            if (alertaTutorialEditado.equals("false")) {
                        %>
                        <script>
                            Swal.fire({
                                title: "Error",
                                text: "El tutoria no pudo ser Editado",
                                icon: "error"
                            });
                        </script>
                        <%
                                }
                                //Limpiamos el atributo que contiene el resultado de la edicion de un tutorial
                                request.getSession().removeAttribute("tutorialEditado");
                            }
                        %>

                    <!-- Modal para ver la información-->
<div class="modal fade" id="exampleModalVer" tabindex="-1" aria-labelledby="exampleModalVerLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalVerLabel">Tutorial</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <!-- Mostrar información de un tutorial -->
        <form>
           <label for="modalNombre">ID:</label>
          <input class="form-control" type="text" id="idVer" readonly><br>
          <label for="modalNombre">Titulo:</label>
          <input class="form-control" type="text" id="tituloVer" readonly><br>
          <label for="modalFecha">Url:</label>
          <input class="form-control" type="text" id="urlVer" readonly><br>
          <div class="form-group">
              <label>Prioridad:</label>
              <select name="prioridadVer" id="prioridadVer" class="form-control" required>
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
              <label>Estado:</label>
              <select name="estadoVer" id="estadoVer" class="form-control" required >
                  <option value="" disabled selected>Seleccione el estado</option>
                  <option value="true">Revisado</option>
                  <option value="false">Revisar</option>
              </select>
          </div><br>
          <label for="modalPuntuacion">Categoria:</label>
          <input class="form-control" type="text" id="categoriaVer" readonly><br>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
      </div>
    </div>
  </div>
</div>
                    <!-- Modal Para Editar una valoracion-->
<div class="modal fade" id="exampleModalEditar" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">

                <h1 class="modal-title fs-5" id="exampleModalLabel">Editar</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form action="SvEditarTutorial" method="POST">
                <div class="modal-body">
                    <p>¿Estás seguro de que deseas EDITAR el tutorial con ID: <span id="tutorialIdEditar"></span>?</p>
                    
                    <form action="SvAgregarTutorial" method="POST">
                        <div class="form-group">
                            <label>Titulo:</label>
                            <input type="text" name="tituloEditar" id="tituloEditar" class="form-control" placeholder="ingrese el titulo" autofocus required >
                        </div><br>
                        <div class="form-group">
                            <label>URL:</label>
                            <input type="text" name="urlEditar" id="urlEditar" class="form-control" placeholder="ingrese la URL" required >
                        </div><br>
                        <div class="form-group">
                            <label>Prioridad:</label>
                            <select name="prioridadEditar" id="prioridadEditar" class="form-control" required>
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
                            <label>Estado:</label>
                            <select name="estadoEditar" id="estadoEditar" class="form-control" required>
                                <option value="" disabled selected>Seleccione el estado</option>
                                <option value="true">Revisado</option>
                                <option value="false">Revisar</option>
                            </select>
                        </div><br>
                        <div class="form-group">

                            <label for="categoria">Categoría:</label>
                            <select name="categoriaEditar" id="categoriaEditar" class="form-control" required>
                                <option value="" disabled selected>Seleccione una categoría</option>
                                <%
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
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                            <button type="submit" class="btn btn-primary">Editar</button>
                        </div>
                    </form>


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
                                <script>
    
    $(document).ready(function(){
    // Manejar el evento cuando se hace clic en el enlace de la modal
    $('#exampleModalEditar').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget); // Botón que abrió la modal
        var titulo = button.data('titulo');
        var url = button.data('url');
        var prioridad = button.data('prioridad');
        var estado = button.data('estado');
        var categoria = button.data('categoria');
        
        // Actualizar el contenido de la modal
        var modal = $(this);
        modal.find('#tituloEditar').val(titulo);
        modal.find('#urlEditar').val(url);
        modal.find('#prioridadEditar').val(prioridad);
        modal.find('#estadoEditar').val(estado ? 'true' : 'false');
        modal.find('#categoriaEditar').val(categoria);
    });
});

</script>
<!-- Script para obtener el id del tutorial que se va a editar y despues enviarla por ajaxx al servlet -->
<script>
    // Captur clic y mandar el id del tutorial que se va a editar 
    $('.editarTutorial-btn').on('click', function () {
        // Obtener el ID de la valoracion
        const idTutorialEditar = $(this).data('id');
        // Mostrar el ID en el modal de la edicion
        $('#tutorialIdEditar').text(idTutorialEditar);

        // Envío de ID al servlet a través de AJAX (método POST)
        $.ajax({
            url: 'SvEditarTutorial', // Url donde se enviara los datos(en este caso el id)
            method: 'POST', // Método de solicitud por donde llegara la información al servlet
            data: {idTutorialEditar: idTutorialEditar}, // Datos a enviar (en este caso, el ID)
            success: function (response) {
                // Manejar la respuesta del servidor si es necesario
            },
            error: function (xhr, status, error) {
                console.error('Error al enviar la solicitud:', error);
            }
        });
    });
</script>
<script>
    
    $(document).ready(function(){
    // Manejar el evento cuando se hace clic en el enlace de la modal
    $('#exampleModalVer').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget); // Botón que abrió la modal
        var id = button.data('id');
        var titulo = button.data('titulo');
        var url = button.data('url');
        var prioridad = button.data('prioridad');
        var estado = button.data('estado');
        var categoria = button.data('categoria');
        
        // Actualizar el contenido de la modal
        var modal = $(this);
        modal.find('#idVer').val(id);
        modal.find('#tituloVer').val(titulo);
        modal.find('#urlVer').val(url);
        modal.find('#prioridadVer').val(prioridad);
        modal.find('#estadoVer').val(estado ? 'true' : 'false');
        modal.find('#categoriaVer').val(categoria);
    });
});

</script>


<%@include file="lib/footer.jsp" %>