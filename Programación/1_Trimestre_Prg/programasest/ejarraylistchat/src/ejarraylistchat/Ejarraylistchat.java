/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package ejarraylistchat;

import java.util.ArrayList;
import java.util.Scanner;

/**
 *
 * @author PC-Sergio
 */
public class Ejarraylistchat {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Scanner preg = new Scanner(System.in);
        // TODO code application logic here
        int opc;
        /*
        Crear un ArrayList llamado "numeros".
Llenar el ArrayList con números enteros proporcionados por el usuario (pide al usuario que ingrese la cantidad de números y luego esos números).
Mostrar los números ingresados por el usuario.
Calcular la suma de todos los números en el ArrayList.
Encontrar el número más grande presente en el ArrayList.
Encontrar el número más pequeño presente en el ArrayList.
Cambiar todos los números pares en el ArrayList por cero.
Mostrar el contenido final del ArrayList después de realizar las operaciones anteriores.
        */
        ArrayList<Integer> numeros = new ArrayList<>();
       do{ //hacemos un bucle en el que el usuario hasta que no marque 0 no saldra de la aplicacion
        System.out.println("""
                           
                 1- Añadir numero
                 2- Mostrar numeros
                 3- Suma
                 4- Numero mayor y menos
                 5- Pares por cero
                 0- Salir""");
           System.out.println("Elige una opcion:");
        opc = preg.nextInt();
        switch(opc){  //menu de la apliacion
            case 1:
                añadir( numeros);
                break;
            case 2:
                mostrar(numeros);
                break;
            case 3:
                sumar(numeros);
                break;
            case 4:
                mayorYMenor(numeros);
                break; 
            case 5:
                paresCero(numeros);
                break;   
            case 0:
                System.out.println("Saliendo del programa");
                break;
        }
        
       }while(opc != 0); //condicion de final bucle
        
    }
    
    public static void añadir(ArrayList<Integer> numeros){ //metodo para añadir numero al arraylist
        int num;
    Scanner preg = new Scanner(System.in);
        System.out.println("Que numero quieres añadir");
    num = preg.nextInt();
    numeros.add(num); //importante .add
}
     public static void mostrar(ArrayList<Integer> numeros){ //muestra los numeros del array
         System.out.println(numeros);
 
     }
      public static void sumar(ArrayList<Integer> numeros){  //Suma todos los valores del array
          int suma= 0;
          for(int num : numeros){
              suma += num;
          }
          
          System.out.println("La suma de los numeros del ArrayList es " +suma);
      }
      
       public static void mayorYMenor(ArrayList<Integer> numeros){ //busca el numero mayor y menor y te lo muestra
           int max = -999999;
           int min = 999999;
           
           for (int i = 0; i < numeros.size(); i++) {
               if(numeros.get(i) > max){
                   max = numeros.get(i);
           }
           }
           for (int i = 0; i < numeros.size(); i++) {
               if(numeros.get(i) < min){
                   min = numeros.get(i);
               }
           }
           System.out.println("El numero mas grande es "+max+ "Y el numero mas pequeño es "+min);
       }
        public static void paresCero(ArrayList<Integer> numeros){ //Cambia los numeros pares por 0
            for (int i = 0; i < numeros.size(); i++) {
                if (numeros.get(i) % 2 == 0) {
                    numeros.set(i,0); ///cambia el valor de ese numero x0 .set
                }
            }
        }
}
