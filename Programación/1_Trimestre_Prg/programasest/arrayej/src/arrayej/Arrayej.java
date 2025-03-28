/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package arrayej;

import java.util.Scanner;

/**
 *
 * @author PC-Sergio
 */
public class Arrayej {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        
      /* Scanner preg = new Scanner(System.in);
       int numeros[] = new int[10];
       
       añadirNum(numeros);
       enseñarNum(numeros);
       */
       Scanner preg = new Scanner(System.in);
       int numeros[] = new int [4]; //inicializa el array con 4 posiciones(0,1,2,3)
       
       añadirNumeros(numeros); //Aplica el siguiente metodo a la lista que hemos creado
       enseñarNumeros(numeros);
       verMayorYMenor(numeros);
       /*verMenor(numeros);*/
    }
    
  /*  public static void añadirNum(int lista[]){
         Scanner preg = new Scanner(System.in);
        for (int i = 0; i < lista.length; i++) {
            System.out.println("Intoduce el numero que quieres añadir");
            lista[i] = preg.nextInt();
        }
    }
    
    public static void enseñarNum(int lista[]){
      
        for (int i = 0; i < lista.length; i++) {
            System.out.println("En el indice "+i+ "esta el valor"+lista[i]);
           
        }
    }
    
    */
    public static void añadirNumeros(int lista[]){
        Scanner preg = new Scanner(System.in);                 //Pregunta el usuario tantas veces como el array sea de grande y lo rellena
        for (int i = 0; i < lista.length; i++) {
            System.out.println("Introduce un numero:");
            lista[i] = preg.nextInt();
        }
    }
    
    public static void enseñarNumeros(int lista[]){            //Enseña el valora de todas las posiciones
        for (int i = 0; i < lista.length; i++) {
            System.out.println("En el valor "+i+" tiene el valor "+lista[i]);
        }
    }
    
    public static void verMayorYMenor(int lista[]){   
        int minimo = 999999999;  //Creamos las variables de maximo y minimo que vamos a utilizar en el metodo
        int maximo = -999999999;
        
        for (int i = 0; i < lista.length; i++) {  //repite el bucle con todas las posiciones del array
            if(lista[i] > maximo ){   //Si el valor es mas grande que el que habia antes almacenado se inicializa 
                maximo = lista[i];  //guarda el numero mas alto en la variable
            }
            if( lista[i] < minimo){ //Si el  valor es mas pequeño que el que habia antes almacenado se inicializa 
                minimo = lista[i]; //Guarda el numero mas bajo en la variable
            }
        }
        System.out.println("El numero mas grande es " +maximo+ " y el mas pequeño es "+ minimo); //Enseña el numero mas alto y mas bajo
    }
}
