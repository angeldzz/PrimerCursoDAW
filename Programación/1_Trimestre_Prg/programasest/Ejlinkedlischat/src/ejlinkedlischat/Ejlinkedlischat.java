/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package ejlinkedlischat;

import java.util.LinkedList;
import java.util.Scanner;

/**
 *
 * @author PC-Sergio
 */
public class Ejlinkedlischat {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        /*
        Crear una LinkedList llamada "listaElementos".
Agregar al menos cinco elementos a la LinkedList, pidiendo al usuario que ingrese los elementos.
Mostrar todos los elementos almacenados en la LinkedList.
Verificar si un elemento específico está presente en la LinkedList y mostrar un mensaje indicando su presencia o ausencia.
Eliminar un elemento de la LinkedList según la posición proporcionada por el usuario.
Mostrar nuevamente todos los elementos en la LinkedList después de realizar las operaciones anteriores.
        */
        LinkedList<String> listaElementos = new LinkedList<>(); //predefinimos los datos del LinkedList 
        listaElementos.add("Juan");
        listaElementos.add("Sergio");
        listaElementos.add("Dele");
        listaElementos.add("Mocksky");
        listaElementos.add("RIN");
        
        enseñar(listaElementos);
        comprobar(listaElementos);
        eliminar(listaElementos);
          enseñar(listaElementos);
    }
    public static void enseñar(LinkedList<String> listaElementos){  //se muestran los valores que tiene la lista
        System.out.println(listaElementos);
    }
    
    public static void comprobar(LinkedList<String> listaElementos){  //comprueba si el valor que pones esta dentro y si no te dice que no existe
        Scanner preg = new Scanner(System.in);
        String val;
        System.out.println("Que valor quieres buscar");
        val = preg.nextLine();
        if(listaElementos.contains(val)){
            System.out.println("El valor "+val+" si existe en la lista");
        }else{
            System.out.println("Ese usuario no existe");
        }
        
    }
    
    public static void eliminar(LinkedList<String> listaElementos){  //comprueba si existe lo que le pones y si exite borra la posicion
        Scanner preg = new Scanner(System.in);
        int eli;
        System.out.println("Que posicion quieres eliminar");
        eli = preg.nextInt();
        if (eli >= 0 && eli <= listaElementos.size()) {
            listaElementos.remove(eli -1);
        }else{
            System.out.println("Ese elemento no existe");
        }
        
    }
}
