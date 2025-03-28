/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package hash;

import java.util.HashMap;

/**
 *
 * @author PC-Sergio
 */
public class Hash {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        
        HashMap<String,Double> registroEstudiantes = new HashMap<>(); //Se le asigna que la clave va a ser tipo String y el valor Double

/*
Enunciado del ejercicio:
Escribe un programa en Java que maneje un HashMap para almacenar información sobre estudiantes y sus calificaciones. El programa debe realizar las siguientes operaciones:

Crear un HashMap llamado "registroEstudiantes" que asocie nombres de estudiantes (String) con sus calificaciones (Double). Agrega al menos 5 pares de estudiantes y sus respectivas calificaciones al mapa.
Imprimir las calificaciones de todos los estudiantes almacenados en el HashMap.
Agregar un nuevo estudiante "Ana" con una calificación de 9.5 al mapa.
Imprimir nuevamente todas las calificaciones de los estudiantes, incluyendo la de "Ana".
Verificar si el estudiante "Pedro" existe en el mapa y, si existe, imprimir su calificación. Si no existe, imprimir un mensaje indicando que el estudiante no está en el registro.*/
        registroEstudiantes.put("Juan",5.2);
        registroEstudiantes.put("Pedro",2.2);  //Se crean en el HashMap los datos
        registroEstudiantes.put("Sergio",7.8);
        registroEstudiantes.put("Mosca",9.1);
        registroEstudiantes.put("SK",5.0);
        
        System.out.println(registroEstudiantes);
        
        registroEstudiantes.put("Ana",9.5);  //Se añade ana al hashmap
        System.out.println(registroEstudiantes);
        
        if (registroEstudiantes.containsKey("Pedro")) {  //Se declara que si en el HashMap se encuentra la clave con ese valor se inicializa la condicion
            System.out.println(registroEstudiantes.get("Pedro"));  //Se enseña solo el valor que tiene dentro de la clave
        }else{
            System.out.println("Ese estudiante no existe");
        }
    }
    
}
