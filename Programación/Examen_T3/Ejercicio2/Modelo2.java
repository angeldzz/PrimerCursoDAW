/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.examen_ejercicio2;
import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
/**
 *
 * @author pinto
 */
class Modelo2 {
    

    //atributos de conexionn a la BD
    private String url = "jdbc:mysql://localhost:3306/examen";
    private String usuario = "examen";
    private String contraseña = "examen";

    //conexion a la BD
    Connection conexion;
    
    public Modelo2() {
        //conectamos a la base de datos
        try {
            this.conexion = DriverManager.getConnection(url, usuario, contraseña);
            
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
    }
    
    public ArrayList<Liga> todasLasVentas() {
        //creamos el array que vamos a devolver
        ArrayList<Liga> listaliga = new ArrayList<>();
        
        try {
            Statement todasVentas = this.conexion.createStatement();
            //ejecutamos la consulta de ligaFutbol y guardamos los datos en datos
            ResultSet datos = todasVentas.executeQuery("Select * from ligaFutbol");
            //recorremos datos y vamos guardando lo que nos devuelve en el arraylist y en liga
            while (datos.next()) {
                listaliga.add(new Liga(
                            datos.getString("equipo"),
                            datos.getInt("jugados"),
                            datos.getInt("ganados"),
                            datos.getInt("empatados"),
                            datos.getInt("perdidos"),
                            datos.getInt("golesFavor"),
                            datos.getInt("golesContra"),
                            datos.getInt("puntos")));
            }
            //capturamos excepciones
        } catch (SQLException ex) {
            System.out.println("Los datos no existen");
            System.exit(0);
        }
        
        return listaliga;
    }
}
