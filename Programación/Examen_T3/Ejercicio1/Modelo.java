/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.examen_ejercicio1;

import java.sql.*;
/**
 *
 * @author pinto
 */
class Modelo {
    
    //atributos de conexionn a la BD
    private String url = "jdbc:mysql://localhost:3306/examen";
    private String usuario = "examen";
    private String contraseña = "examen";

    //conexion a la BD
    Connection conexion;
    
    public Modelo() {
        try {
            this.conexion = DriverManager.getConnection(url, usuario, contraseña);
            
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
    }
    
    public Boolean insertaVenta(NotasAlumnos nt) {
        Boolean resultado = true;

        //creamos la consulta para insertar en programacion
        String insertar = "INSERT INTO programacion(alumno,eval1,eval2,eval3,notaMedia) VALUES(?,?,?,?,?)";
        
        try {
            //creamos la sentencia de preparedStatement para meter los datos con ?
            PreparedStatement sentencia = this.conexion.prepareStatement(insertar);

            //añadimos todos los datos teniendo en cuenta el tipo de dato
            sentencia.setString(1, nt.getNombre());
            sentencia.setDouble(2, nt.getEval1());
            sentencia.setDouble(3, nt.getEval2());
            sentencia.setDouble(4, nt.getEval3());
            sentencia.setDouble(5, nt.getNotaMedia());
            //ejecitamos la inserccion
            Integer nf = sentencia.executeUpdate();

            //comprobar que se inserto correctamente
            if (nf != 1) {
                System.out.println("Error al insertar");
                resultado = false;
            }
            
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            resultado = false;
        }
        return resultado;
    }
}
