/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package ejhashsetchat;

import java.util.HashSet;
import java.util.Scanner;

/**
 *
 * @author zx19student365
 */
public class Ejhashsetchat {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        /*
        Crear un HashSet llamado "conjuntoElementos".
Agregar al menos cinco elementos al HashSet, pidiendo al usuario que ingrese los elementos.
Mostrar todos los elementos almacenados en el HashSet.
Verificar si un elemento específico está presente en el HashSet y mostrar un mensaje indicando su presencia o ausencia.
Eliminar un elemento del HashSet proporcionado por el usuario.
Mostrar nuevamente todos los elementos en el HashSet después de realizar las operaciones anteriores.
        */
        Scanner preg = new Scanner(System.in);
        HashSet<String> conjuntoElementos = new HashSet<>();
        
        añadir(conjuntoElementos);
        mostrar(conjuntoElementos);
        verificar(conjuntoElementos);
        eliminar(conjuntoElementos);
        mostrar(conjuntoElementos);
    }
    
    public static void añadir(HashSet<String> conjuntoElementos){
        Scanner preg = new Scanner(System.in);
        String num;
        for (int i = 0; i < 5; i++) {
            System.out.println("Añade un valor:");
           num = preg.nextLine();
           conjuntoElementos.add(num);
        }
    }
    
    public static void mostrar(HashSet<String> conjuntoElementos){
  
        System.out.println(conjuntoElementos);
    
}


public static void verificar(HashSet<String> conjuntoElementos){
    Scanner preg = new Scanner(System.in);
    String val;
    System.out.println("Que valor quieres buscar:");
    val = preg.nextLine();
    if(conjuntoElementos.contains(val)){
        System.out.println("El elemento existe");
    }else{
        System.out.println("Lo que buscas no existe");
    }
    
    
}
public static void eliminar(HashSet<String> conjuntoElementos){
    Scanner preg = new Scanner(System.in);
    String elim;
    System.out.println("Que valor quieres eliminar");
    elim = preg.nextLine();
    
    if(conjuntoElementos.contains(elim)){
        conjuntoElementos.remove(elim);
        System.out.println("Valor eliminado");
    }else{
        System.out.println("El valor no existe");
    }
}
}