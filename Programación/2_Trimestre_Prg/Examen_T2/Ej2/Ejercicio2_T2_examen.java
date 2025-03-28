/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 */

package com.daw.ejercicio2_t2_examen;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.ObjectOutputStream;
import java.util.LinkedList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author zx23student3283
 */
public class Ejercicio2_T2_examen {
    
    public static void main(String[] args) {
        //dos File, uno es el archivo empleados.csv y el otro es donde se va a guardar empleados_serializados.ser
        File archivo1 = new File("C:\\Users\\zx23student3283\\OneDrive - Espacios Educativos, S.C.M\\Escritorio\\Examen\\Ej2\\empleados.csv");
        File guardado = new File("C:\\Users\\zx23student3283\\OneDrive - Espacios Educativos, S.C.M\\Escritorio\\Examen\\Ej2\\empleados_serializados.ser");
        
        //creamos un linkedList con la clase Empleado llamada empleados
        LinkedList<Empleado> empleados = new LinkedList<Empleado>();
        //ahora hacemos un try para el bfr que es el que va a leer el archivo1 y otra para el oos que es el que va a guardarnos el .ser
        try(BufferedReader bfr = new BufferedReader(new FileReader(archivo1));ObjectOutputStream oos = new ObjectOutputStream(new FileOutputStream(guardado))){
            //linea que va a contener cada linea que se lea una a una
        String linea = "";
        //hacemos un while para que nos lea todo mientras no esta null y si esta null deja de leer
            while((linea = bfr.readLine())!=null){
                //el split para que nos separa cada uno de los datos de cada fila del archivo 1
            String[] datos = linea.split(",");
            //añadimos cada dato en la clase empleado creando un emple datos[0]=id, datos[1]=nombre,datos[2]=departamento,datos[3]=salario,datos[4]=anios en empresa
            Empleado emple = new Empleado(datos[0],datos[1],datos[2],datos[3],datos[4]);
            //añadimos emple al linkedList
            empleados.add(emple);
            //este for se encarga de para cada empleado que le asignamos e guarda los empleados, es decir los archivos del likedList
            for (Empleado e : empleados) {
                
                oos.writeObject(e);
                
            }
            
            }
            //por ultimo hacemos un catch de las escepciones que nos puede lanzar
        }catch (FileNotFoundException ex) {
            System.out.println("Error: " + ex.getMessage());
            } catch (IOException ex) {
            System.out.println("Error: " + ex.getMessage());
            }        
    }
}
