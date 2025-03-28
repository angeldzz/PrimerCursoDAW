/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 */
package com.mycompany.examen_ejercicio2;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;

/**
 *
 * @author Angel pinto
 */
public class Examen_Ejercicio2 {

    //creamos un modelo
    static Modelo2 modeloBD;

    public static void main(String[] args) {
        modeloBD = new Modelo2();
        //llamamos al metodo que nos creara el csv
        BaseDeDatosA_CSV();

        //llamamos al metodo que nos creara el HTML
        BaseDeDatosA_HTML();
        System.out.println("Todo a ido bien");
    }

    private static void BaseDeDatosA_CSV() {

        //guardamos la ruta donde se creara el archivo en un file
        File archivoN = new File("C:\\Users\\pinto\\OneDrive\\OneDrive - Espacios Educativos, S.C.M\\Escritorio\\ExamenBBDD\\LigaFutbol.csv");

        //creamos un bufferedwriter para escribir el fichero
        try (BufferedWriter bfw = new BufferedWriter(new FileWriter(archivoN))) {
            //creamos un array en el que guardaremos a los datos del modeloBD de Liga
            ArrayList<Liga> listaEquipos = modeloBD.todasLasVentas();

            //escribimos indice
            bfw.write("Equipo;jugados;ganados;empatados;perdidos;Goles a favor; Goles en Contra;puntos\n");

            //recorremos listaEquipos y guardamos todos los datos guardados en Liga
            for (Liga lg : listaEquipos) {
                //escribimos los datos de Liga usando el metodo toCSV
                bfw.write(lg.toCSV() + "\n");
            }
            //capturamos excepciones y si falla salimos con un error
        } catch (IOException ex) {
            System.out.println("Los datos no existen");
            System.exit(0);
        }
    }

    private static void BaseDeDatosA_HTML() {
        //guardamos la ruta donde se creara el archivo en un file
        File archivoHTML = new File("C:\\Users\\pinto\\OneDrive\\OneDrive - Espacios Educativos, S.C.M\\Escritorio\\ExamenBBDD\\LigaFutbol.html");
        //creamos e iniciamos la clase donde guardamos el inicio y el fin del HTML
        HTMLCodigo hc = new HTMLCodigo();

        try (BufferedWriter salidaHTML = new BufferedWriter(new FileWriter(archivoHTML))) {

            //creamos un array en el que guardaremos a los datos del modeloBD de Liga
            ArrayList<Liga> ListaEquipos = modeloBD.todasLasVentas();

            //escribimos el inicio del html guardado en su clase
            salidaHTML.write(hc.inicio());

            //recorremos lista equipos y escribimos la salida con el toHTML
            for (Liga lg : ListaEquipos) {
                salidaHTML.write(lg.toHTML() + "\n");
            }
            //escribimos tambien el fin del HTML
            salidaHTML.write(hc.fin());
            //capturamos excepciones y si falla salimos con un error
        } catch (IOException ex) {
            System.out.println("Los datos no existen");
            System.exit(0);
        }

    }
}
