/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.jc.controladores;

import com.jc.model.DAOPelicula;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.codehaus.jackson.map.ObjectMapper;
/**
 *
 * @author T-102
 */
public class ServletBorrarPelicula extends HttpServlet{
    
    protected void doDelete(HttpServletRequest request, 
            HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        //PEDIMOS DATOS AL CLIENTE
       String idPelicula=request.getParameter("ID");
       System.out.println("ID de la pelicula: "+idPelicula);
       Estatus estatus=new Estatus();
       int idsPelicula=Integer.parseInt(idPelicula);
      
      try{
            //Se invoca el procedimiento
         out.println( DAOPelicula.borrar(idsPelicula));
         estatus.setSuccess(true);
         estatus.setMensaje("Pelicula borrada con exito");
         ObjectMapper maper=new ObjectMapper();
         
            System.out.println(maper.writeValueAsString(estatus));
            
      }catch(Exception e){ 
         out.println("Hubo un error "+e.getMessage());
          System.out.println("HUbo un error "+e.getMessage());
      }
     
    }
    
}
