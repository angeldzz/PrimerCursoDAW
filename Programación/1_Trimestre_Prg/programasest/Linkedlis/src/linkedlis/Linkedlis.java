/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package linkedlis;

import java.util.LinkedList;

/**
 *
 * @author PC-Sergio
 */
public class Linkedlis {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        /*
        Crea un programa en Java que maneje una lista enlazada (LinkedList) para almacenar nombres de personas. El programa debe realizar las siguientes operaciones:

Crear una lista enlazada llamada "listaNombres".
Agregar los siguientes nombres al final de la lista: "Juan", "María", "Carlos", "Laura", "Pedro".
Insertar el nombre "Ana" en la tercera posición de la lista.
Mostrar todos los nombres presentes en la lista después de realizar las operaciones anteriores.
Eliminar el segundo nombre de la lista.
Mostrar nuevamente todos los nombres presentes en la lista después de eliminar un nombre.
        */
        
        LinkedList<String> lista = new LinkedList<>();
        
        lista.add("Juan");
        lista.add("Luis");
        lista.add("Paco");
        lista.add("Sergio");
        lista.add("Pedro");
        
        System.out.println(lista);
        lista.set(2,"Ana"); //remplaza los datos de esa posicion
        System.out.println(lista);
        
        lista.add(2,"asfadsa"); //Añade en la posicion que le des 
        System.out.println(lista);
        
        lista.remove(4); //borra lo que hay en la posicion que le marcas
        System.out.println(lista);
        
        lista.remove("Pedro"); //borra la posicion en la que encuentre este valor
        System.out.println(lista);
    }
    
}
