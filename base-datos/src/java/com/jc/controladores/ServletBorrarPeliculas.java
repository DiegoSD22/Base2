/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.jc.controladores;

import com.jc.model.DAOPelicula;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.codehaus.jackson.map.ObjectMapper;

/**
 *
 * @author T-102
 */
public class ServletBorrarPeliculas extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        //Pedimos el id de cliente
        String id = request.getParameter("id");
        System.out.println("el id es " + id);
        int myId = Integer.parseInt(id);
        Estatus e = new Estatus();

        try {
            e = DAOPelicula.borrarPelicula(myId);
        } catch (Exception ex) {
            e.setSuccess(false);
            e.setMensaje("Error al borrar " + ex.getMessage());
        }

        ObjectMapper maper = new ObjectMapper();
        out.print(maper.writeValueAsString(e));

    }
}
