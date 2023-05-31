
<%-- 
    Document   : listar
    Created on : 26/05/2023, 07:26:36 PM
    Author     : User
--%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
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
                            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="" role="button" data-bs-toggle="dropdown" aria-expanded="false">Tienda</a>
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
                    <h1 class="display-4 fw-bolder">Listar Producto</h1>                  
                </div>
            </div>
        </header>
        <!-- Section-->
        <section class="py-5">
            <div class="container">
            <a class="btn btn-success" href="Controlador?accion=add">Agregar Nuevo</a>
            <br>
            <br>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th class="text-center">CODIGO</th>
                        <th class="text-center">TIPO</th>
                        <th class="text-center">NOMBRE</th>
                        <th class="text-center">PRECIO</th>
                        <th class="text-center">ACCIONES</th>
                    </tr>
                </thead>
                <%
                    ProductoDAO dao = new ProductoDAO();
                    List<Producto>list = dao.listar();
                    Iterator<Producto>iter=list.iterator();
                    Producto pro = null;
                    while(iter.hasNext()){
                        pro=iter.next();  
                    
                %>
                <tbody>
                    <tr>
                        <td class="text-center"><%= pro.getCodigo()%></td>
                        <td class="text-center"><%= pro.getTipo()%></td>
                        <td class="text-center"><%= pro.getNombre()%></td>
                        <td class="text-center"><%= pro.getPrecio()%></td>
                        <td>
                            <a class ="btn btn-warning" href="Controlador?accion=editar&codigo=<%= pro.getCodigo()%>">Editar</a>
                            <a class ="btn btn-danger" href="Controlador?accion=eliminar&codigo=<%= pro.getCodigo()%>">Eliminar</a>                        
                        </td>
                    </tr>
                    <%}%>
                </tbody>
            </table>

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
