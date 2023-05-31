/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Control;

import Modelo.Producto;
import ModeloDAO.ProductoDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author User
 */
public class Controlador extends HttpServlet {
    
    String listar ="vistas/listar.jsp";
    String add = "vistas/add.jsp";
    String edit = "vistas/edit.jsp";
    Producto p = new Producto();
    ProductoDAO dao = new ProductoDAO();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Controlador</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Controlador at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

  
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String acceso = "";
        String action = request.getParameter("accion");
        if(action.equalsIgnoreCase("listar")){
            acceso = listar;
        }else if(action.equalsIgnoreCase("add")){
            acceso = add;      
        }else if(action.equalsIgnoreCase("Agregar")){
            
            int codigo = Integer.parseInt(request.getParameter("txtCodigo"));
            String tipo = request.getParameter("txtTipo");
            String nombre = request.getParameter("txtNombre");
            float precio = Float.parseFloat(request.getParameter("txtPrecio"));
            p.setCodigo(codigo);
            p.setTipo(tipo);
            p.setNombre(nombre);
            p.setPrecio(precio);
            dao.add(p);
            acceso = listar;
            
        }
        else if(action.equalsIgnoreCase("editar")){
            request.setAttribute("codigopro", request.getParameter("codigo"));
            acceso = edit;
        }
        else if(action.equalsIgnoreCase("Actualizar")){
            
            int codigo = Integer.parseInt(request.getParameter("txtcodigo"));
            String tipo = request.getParameter("txtTipo");
            String nombre = request.getParameter("txtNombre");
            float precio = Float.parseFloat(request.getParameter("txtPrecio"));          
            p.setCodigo(codigo);
            p.setTipo(tipo);
            p.setNombre(nombre);
            p.setPrecio(precio);
            dao.edit(p);
            acceso = listar;
            
        }
        else if(action.equalsIgnoreCase("eliminar")){
            int codigo = Integer.parseInt(request.getParameter("codigo"));
            p.setCodigo(codigo);
            dao.eliminar(codigo);
            acceso = listar;
        }
        RequestDispatcher vista = request.getRequestDispatcher(acceso);
        vista.forward(request, response);
            
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
