/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.examen_ejercicio4;

import java.sql.*;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author pinto
 */
public class ModeloBD {

    //atributos de conexionn a la BD
    private String url = "jdbc:mysql://localhost:3306/examen";
    private String usuario = "examen";
    private String contraseña = "examen";

    //conexion a la BD
    Connection conexion;

    public ModeloBD() {
        try {
            this.conexion = DriverManager.getConnection(url, usuario, contraseña);
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }

    }

    public ArrayList<Piso> listaCanciones() {

        //cremos el array a devolver llamado pisos
        ArrayList<Piso> listaPisos = new ArrayList<>();

        try {
            //creamos la consulta de alquilerpisos
            String consulta = "SELECT * FROM alquilerpisos";

            //creamos la sentencia Statement
            Statement sentencia = conexion.createStatement();

            //Creamos el resultSet para recoger datos de BD
            ResultSet resultado = sentencia.executeQuery(consulta);

            //recorremos los datos del resultado y guardamos todos los datos extraidos
            //de la bd a nuestra clase Piso
            while (resultado.next()) {
                Piso ps = new Piso(resultado.getInt("id"),
                        resultado.getString("direccion"),
                        resultado.getInt("habitaciones"),
                        resultado.getInt("pax"),
                        resultado.getDouble("precio"),
                        resultado.getString("ropaCamaAseo"),
                        resultado.getString("garage"));
                //tambien guardamos ps en el arraylist
                listaPisos.add(ps);
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        return listaPisos;
    }

    Boolean insertarBD(Piso ps) {
        //cremaos el boolean  a devolver
        Boolean resultadoIns = true;
        try {
            //creamos la consulta para la inserccion
            String insercion = "INSERT INTO alquilerpisos (direccion,habitaciones,pax,precio,ropaCamaAseo,garage) VALUES (?,?,?,?,?,?)";

            //creamos el preparedstatement para posteriormente añadir los datos a la BD
            PreparedStatement prepstat = conexion.prepareStatement(insercion, Statement.RETURN_GENERATED_KEYS);

            //a continuacion añadimos todos los datos en el orden en el que creamos
            //la consulta
            prepstat.setString(1, ps.getDireccion());
            prepstat.setInt(2, ps.getHabitaciones());
            prepstat.setInt(3, ps.getPax());
            prepstat.setDouble(4, ps.getPrecio());
            prepstat.setString(5, ps.getRopaCamaAseo());
            prepstat.setString(6, ps.getGarage());

            //a continacion generamos la consulta
            prepstat.executeUpdate();

            //Hacemos un resultset para posteriormente coger la clave
            //consullta para recuperar el id de la fila insertada
            ResultSet resultado = prepstat.getGeneratedKeys();
            resultado.next();
            // hacemos un set y le ponemos una id al ps
            ps.setId(resultado.getInt(1));
            //capturamos posibles excepciones
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            return resultadoIns = false;
        }
        //devolvemos el boolean
        return resultadoIns;
    }

    public boolean modificaCancion(Piso pisoSeleccionado) {
        Boolean res = true;
        
        //creamos el String de update para los campos seleccionados por el preparedStatement
        String modificar = "UPDATE alquilerpisos SET direccion=?,habitaciones=?,pax=?,precio=?,ropaCamaAseo=?,garage=? WHERE id = ?";

        try {
            //creamos el prepared statemtn conla sconuta
            PreparedStatement ps = conexion.prepareStatement(modificar);
            //Insertamos al prepared statement todos los datos de get.datosdepiso
            ps.setString(1, pisoSeleccionado.getDireccion());
            ps.setInt(2, pisoSeleccionado.getHabitaciones());
            ps.setInt(3, pisoSeleccionado.getPax());
            ps.setDouble(4, pisoSeleccionado.getPrecio());
            ps.setString(5, pisoSeleccionado.getRopaCamaAseo());
            ps.setString(6, pisoSeleccionado.getGarage());
            ps.setInt(7, pisoSeleccionado.getId());

            Integer filasBorradas = ps.executeUpdate();
            if (filasBorradas != 1) {
                res = false;
            }

        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            res = false;
        }

        return res;
    }

    public boolean borrarCancion(Piso pisoSeleccionado) {
                Boolean res = true;
        //creamos el borrado de datos
        String borrado = "DELETE FROM alquilerpisos WHERE id=?";

        //creamos el preparedstatement para posteriormente añadir los datos a la BD
        PreparedStatement prepstat;
        try {
            prepstat = conexion.prepareStatement(borrado);

            //a continuacion añadimos todos los datos en el orden en el que creamos
            //la consulta
            prepstat.setInt(1, pisoSeleccionado.getId());
            
            Integer filasBorradas = prepstat.executeUpdate();
            //si filas borradas no es 1 es que no se a borrado ninguna
            if (filasBorradas != 1) {
                res=false;
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            res=false;
        }
        return res;
    }
}
