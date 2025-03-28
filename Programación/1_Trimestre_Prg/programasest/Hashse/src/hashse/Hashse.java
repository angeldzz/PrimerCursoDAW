/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package hashse;

import java.util.HashSet;

/**
 *
 * @author PC-Sergio
 */
public class Hashse {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        /*
        Crear un HashSet llamado "colores".
Agregar los siguientes nombres de colores al conjunto: "Rojo", "Verde", "Azul", "Amarillo", "Rojo" (introducir "Rojo" dos veces).
Mostrar todos los nombres de colores únicos presentes en el HashSet.
Verificar si "Negro" está presente en el conjunto y mostrar un mensaje indicando su presencia o ausencia.
        */
        HashSet<String> lista = new HashSet<>();
        lista.add("Rojo");
        lista.add("Verde");
        lista.add("Azul"); 
        lista.add("Amarillo");
        lista.add("Rojo");
        
        
        
        System.out.println(lista);
        
        System.out.println("Nomrbe de colores unicos");
        for(String unicos: lista){    //recorre el hashset y te dice todos los colores sin que se repitan
            System.out.println(unicos);
       /* for (String elemento : lista) {
            System.out.println("El valor es " +elemento); */
       
        }
        if(lista.contains("Negro")){    //Se comprueba si existe el color negro dentro del hashset y si no esta te lo dice
           System.out.println("El color negro esta disponible");
       }else{
           System.out.println("el color negro no vesta");
       }
    }
    
}
