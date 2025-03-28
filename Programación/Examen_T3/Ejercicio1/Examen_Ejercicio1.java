/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 */
package com.mycompany.examen_ejercicio1;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

/**
 *
 * @author Angel pinto
 */
public class Examen_Ejercicio1 {

    //creamos un modelo
    static Modelo modeloBD;

    public static void main(String[] args) {
        //inicializamos el modelo
        modeloBD = new Modelo();

        //añadimos un archivo en el que tengamos la ruta de el fichero
        File archivo = new File("C:\\Users\\pinto\\OneDrive\\OneDrive - Espacios Educativos, S.C.M\\Escritorio\\ExamenBBDD\\notasAlumnos.csv");
        //comprobamos que existe el fichero
        if (archivo.exists()) {
            //creamos la conexion con la base de datos
            try (BufferedReader bfr = new BufferedReader(new FileReader(archivo))) {

                //leemos la primera linea ya que es el indice
                bfr.readLine();
                
                String linea = "";

                //leemos todas las lineas del fichero
                while ((linea = bfr.readLine()) != null) {
                    //hacemos una division (split) para tener los datos separados por el ;
                    String[] datos = linea.split(",");

                    //Añadimos datos en notas alumno y añadimos todos los datos que tenemos separados con el split
                    //hay que tener muy en cuenta los double de la clase notas
                    //vamos a cambiar datos a Double
                    Double eva1 = Double.parseDouble(datos[2]);
                    Double eva2 = Double.parseDouble(datos[3]);
                    Double eva3 = Double.parseDouble(datos[4]);
                    Double notaMedia = (eva1 + eva2 + eva3) / 3.0;
                    NotasAlumnos nt = new NotasAlumnos(datos[0],
                            datos[1],
                            eva1,
                            eva2,
                            eva3,
                            notaMedia);

                    //llamamos a modelo y le pasamos las notas, siempre dentro del while
                    //para que se haga por cada fila de datos que tengamos
                    //tambien metemos el metodo de modelo en un bolean para ver si funciona
                    Boolean funciona = modeloBD.insertaVenta(nt);

                    //tambien comprobamos si funciona gracias al boolean de insertaVenta
                    if (funciona) {
                        System.out.println("Se inserto una fila");
                    } else {
                        System.out.println("Error: no se pudo insertar fila");
                    }

                    //esta linea es simplemente para comprobar si nos lee el fichero
                    //y a su vez se lo pasa a notas
                    System.out.println(nt.toString());
                }

            } catch (FileNotFoundException ex) {
                System.out.println(ex.getMessage());
            } catch (IOException ex) {
                System.out.println(ex.getMessage());
            }
        } else {
            System.out.println("Error el fichero no existe");
            System.exit(0);
        }

    }
}
