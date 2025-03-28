/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 */

package com.daw.ejercicio1_t2_examen;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author zx23student3283
 */
public class Ejercicio1_T2_examen {
    
    String datosUnidos="";
    
    public static void main(String[] args) {
        //aqui tendriamos las rutas de los 3 archivos
        File archivo1 = new File("C:\\Users\\zx23student3283\\OneDrive - Espacios Educativos, S.C.M\\Escritorio\\Examen\\Ej1\\datos_empresa1.csv");
        File archivo2 = new File("C:\\Users\\zx23student3283\\OneDrive - Espacios Educativos, S.C.M\\Escritorio\\Examen\\Ej1\\datos_empresa2.csv");
        File archivoguardar = new File("C:\\Users\\zx23student3283\\OneDrive - Espacios Educativos, S.C.M\\Escritorio\\Examen\\Ej1\\empleados_filtrados_unificados.csv");
        //a continuacion creamos el try para el archivo1 el 2 y el archivo guardar
        try(BufferedReader bfr1 = new BufferedReader(new FileReader(archivo1));BufferedReader bfr2 = new BufferedReader(new FileReader(archivo2));
                BufferedWriter bfw = new BufferedWriter(new FileWriter(archivoguardar))){
            //creamos los string que contendran las siguientes lineas de lectura del bfr1 y el 2 para el while
        String linea = "";
        String linea2 = "";
        bfw.write("ID,Nombre,Departamento,Salario\n");
            while((linea = bfr1.readLine()) != null && (linea2 = bfr2.readLine()) !=null){
                //hacemos el slit para los datos de los dos archivos
                String[] datos1 = linea.split(",");
                String[] datos2 = linea2.split(",");
                //realizamos las comprobaciones del departamento que esta en el [2] de el array de strings y del salario que esta en el [3]
                if ((datos1[2].equals("Tecnología")) && (Integer.valueOf(datos1[3]) >= 3000)) {
                    bfw.write(linea+"\n");
                }
                if ((datos1[2].equals("Recursos Humanos")) && (Integer.valueOf(datos1[3]) >= 3000)) {
                    bfw.write(linea+"\n");
                }
                if ((datos2[2].equals("Tecnología")) && (Integer.valueOf(datos2[3]) >= 3000)) {
                    bfw.write(linea2+"\n");
                }
                if ((datos2[2].equals("Recursos Humanos")) && (Integer.valueOf(datos2[3]) >= 3000)) {
                    bfw.write(linea2+"\n");
                }
            }
            //cogemos las escepciones que nos puede tirar el ejercicio
        } catch (FileNotFoundException ex) {
            Logger.getLogger(Ejercicio1_T2_examen.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(Ejercicio1_T2_examen.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
    }
}
