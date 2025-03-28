/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package arraylist;

import java.util.ArrayList;
import java.util.Arrays;

/**
 *
 * @author PC-Sergio
 */
public class Arraylist {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
      /*  ArrayList<String> milista = new ArrayList<String>();
        milista.add("Lechuga");
        milista.add("julio");
        milista.add("paco");
        
        System.out.println(milista);
        
        ArrayList<String> milistilla = new ArrayList<>(milista);
        
        milistilla.add("Harina");
        
        System.out.println(milista+" "+milistilla);
        
        System.out.println(milista.get(2));
        
        milista.set(1, "Delegao");
       milista.set(1, "Delegao");
        System.out.println(milista);
        
      /*milista.add("julio");
        System.out.println(milista);
        
        milista.remove(1);
        System.out.println(milista);
      milista.remove("Lechuga");
        System.out.println(milista);
        System.out.println(milista.size());*/
      
     /* Enunciado del ejercicio:
Escribe un programa en Java que maneje una lista de números enteros utilizando un ArrayList. El programa debe realizar las siguientes operaciones:

Inicializar un ArrayList llamado "numeros" con los siguientes valores: 10, 20, 30, 40, 50.
Agregar el número 60 al final de la lista.
Insertar el número 15 en la segunda posición de la lista.
Eliminar el número 40 de la lista.
Imprimir todos los elementos de la lista después de realizar las operaciones anteriores
*/      
      ArrayList<Integer> numeros = new ArrayList<Integer>();
      numeros.add(10);
      numeros.add(20);  //Se añaden los valores
      numeros.add(30);
      numeros.add(40);
      numeros.add(50);
      
        System.out.println(numeros);
        
     numeros.add(60); //Agregar 60 al final de la lista 
        System.out.println(numeros);
     
     numeros.set(1,15);  //Se remplaza en la posicion que le asignes
        System.out.println(numeros);
     numeros.remove(Integer.valueOf(40)); //Se borra el valor que le pongas
     
     System.out.println(numeros);
     
     numeros.remove(4); //Borra la posicion que le marques
        System.out.println(numeros);
     
    }
    
}
