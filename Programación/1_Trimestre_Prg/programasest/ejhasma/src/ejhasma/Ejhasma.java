/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package ejhasma;

import java.util.HashMap;
import java.util.Scanner;

/**
 *
 * @author PC-Sergio
 */
public class Ejhasma {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        /*
        Crea una aplicación de gestión de libros que permita a un usuario realizar las siguientes operaciones:

Agregar Libro: El usuario puede agregar un nuevo libro especificando el título, el autor y el año de publicación.

Mostrar Libros: El usuario puede ver la lista completa de libros almacenados, mostrando el título, el autor y el año de publicación de cada libro.

Buscar Libro: El usuario puede buscar un libro por título. Si el libro está en la lista, se mostrará toda la información del libro; de lo contrario, se mostrará un mensaje indicando que el libro no se encuentra en la lista.

Eliminar Libro: El usuario puede eliminar un libro de la lista utilizando el título como identificador.

Utiliza una lista para almacenar los libros. Cada libro debe representarse como un objeto con propiedades para el título, el autor y el año de publicación.
        */
        
        HashMap<String,String> libros = new HashMap<>();
        Scanner preg = new Scanner(System.in);
        int opc=-1;
        do{
            System.out.println("""
                               1- Añadir
                               2- Mostrar
                               3- Buscar
                               4- Eliminar
                               0-Salir
                               """);
            System.out.println("Elige una opcion:");
            opc = preg.nextInt();
            switch(opc){
                case 1:
                    añadir(libros);
                    break;
                case 2:
                    mostrar(libros);
                    break;
                case 3:
                    buscar(libros);
                    break;
                case 4:
                    eliminar(libros);
                    break;
                case 0:
                    System.out.println("Hasta la proxima");
                    break;
                default:
                    System.out.println("Esta opcion no es valida");
                    break;
            }
                
        }while(opc != 0);
         
        
    }
    
    
    public static void añadir(HashMap<String,String> libros){
         Scanner preg = new Scanner(System.in);
         String ke = "";
         String aut = "";
         System.out.println("Cuantos libros quieres añadir");
         int cant = preg.nextInt();
         preg.nextLine();
        for (int i = 0; i < cant; i++) {
            System.out.println("Que libro quieres añadir ");
             ke = preg.nextLine();
             System.out.println("Y de que autor es:");
             aut = preg.nextLine();
             
             libros.put(ke, aut);
        }
             
         
         
    }
    public static void mostrar(HashMap<String,String> libros){
        Scanner preg = new Scanner(System.in);
       System.out.println(libros);
        
    }
    public static void buscar(HashMap<String,String> libros){
         Scanner preg = new Scanner(System.in);
         System.out.println("Que libro quieres buscar");
        String bus = preg.nextLine();
        if (libros.containsKey(bus)) {
            System.out.println("El libro que buscas es de "+libros.get(bus));
            
        }else{
            System.out.println("Ese libro no existe");
        }
       
    }
    public static void eliminar(HashMap<String,String> libros){
        Scanner preg = new Scanner(System.in);
        System.out.println("Que libro quieres eliminar");
        String tit = preg.nextLine();
        if (libros.containsKey(tit)) {
            libros.remove(tit);
            System.out.println("libro borrado");
        }else{
            System.out.println("Ese libro no existe");
        }
    }
}
