<%-- 
    Document   : editar
    Created on : 26/05/2023, 07:26:49 PM
    Author     : User
--%>

<%@page import="Modelo.Producto"%>
<%@page import="ModeloDAO.ProductoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css1/styles.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <title>La Tienda del Músico - Listar</title>
    </head>
    <body>
       
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="index.jsp">La Tienda Del Músico</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="index.jsp">Inicio</a></li>
                      
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Tienda</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="#!">Ver todos los productos</a></li>
                                <li><hr class="dropdown-divider" /></li>
                                <li><a class="dropdown-item" href = "Controlador?accion=listar">Listar Producto</a></li>
                            </ul>
                        </li>
                    </ul>                    
                </div>
            </div>
        </nav>
        <!-- Header-->
        <header class="bg-dark py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="text-center text-white">
                    <h1 class="display-4 fw-bolder">Modificar Productos</h1>
                    
                </div>
            </div>
        </header>
        <!-- Section-->
        <section class="py-5">
            <div class="container">
            <div class="col-lg-6">
               <%
                ProductoDAO dao = new ProductoDAO();
                int codigo=Integer.parseInt((String)request.getAttribute("codigopro"));
                Producto p =(Producto)dao.list(codigo);
               %>
              
                <form action="Controlador">
            
                    Tipo:<br>
                    <input class="form-control" type="text" name="txtTipo" value="<%=p.getTipo()%>"><br>
                    Nombre:<br>
                    <input class="form-control" type="text" name="txtNombre" value="<%=p.getNombre()%>"><br>
                    Precio:<br>
                    <input class="form-control" type="text" name="txtPrecio" value ="<%=p.getPrecio()%>"><br>
                    
                    <input type="hidden" name="txtcodigo" value="<%=p.getCodigo()%>">
                    <input class="btn btn-primary" type="submit" name="accion" value="Actualizar"><br>
                    <a href = "Controlador?accion=listar">Regresar</a>
                </form>
            </div>
            
        </div>
        </section>
        <!-- Footer-->
        <footer class="py-5 bg-dark">
            <div class="container"><p class="m-0 text-center text-white">Copyright &copy; Your Website 2023</p></div>
        </footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
    
    </body>
</html>
