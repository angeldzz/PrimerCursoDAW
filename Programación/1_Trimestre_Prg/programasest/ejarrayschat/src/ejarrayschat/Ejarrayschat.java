/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package ejarrayschat;

import java.util.Arrays;
import java.util.Scanner;

/**
 *
 * @author PC-Sergio
 */
public class Ejarrayschat {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        Scanner preg = new Scanner(System.in);
     /*
        Crear un array de tamaño 5 y llenarlo con valores enteros proporcionados por el usuario.
Mostrar los elementos del array en orden inverso al ingresado.
Calcular la suma de todos los elementos del array.
Encontrar el número más grande presente en el array.
Encontrar el número más pequeño presente en el array.
Cambiar todos los elementos pares del array por cero.
Mostrar el contenido final del array después de realizar las operaciones anteriores.
        */
     int cant = 0;  //variable para el tamaño del array
    
        System.out.println("Cuantos numeros quieres añadir");
        cant = preg.nextInt();  //el ttamaño del array es lo que ponga el usuario
    int numeros[] = new int[cant];
    //Añadimos los metodos ylño hara en el orden que esta puesto
    añadirNumeros(numeros);
    enseñarNumeros(numeros);
     ordeninverso(numeros);
    sumar(numeros);
    mayorymenor(numeros);
    cambiarPares(numeros);
    enseñarNumeros(numeros);
    
     
    }
    
    public static void añadirNumeros(int numeros[]){   //Recorre el array por todas las posiciones preguntando por el numero en cada una
         Scanner preg = new Scanner(System.in);
         for (int i = 0; i < numeros.length; i++) {
             System.out.println("Pon un numero para añadir");
            int num = preg.nextInt();
            numeros[i] = num;
        }
        
    }
    
    public static void enseñarNumeros(int numeros[]){   //muestra los numeros de dentro del array
        for (int i = 0; i < numeros.length; i++) {
            System.out.println("El numero de la casilla "+(i+1)+ " es de "+numeros[i]);
        }
    }
    
    public static void sumar(int numeros[]){ //recorremos el array y vamos sumando a la variable suma cada valor
        int suma= 0;
        int media=0;
        for (int i = 0; i < numeros.length; i++) {
            suma += numeros[i];
        }
        System.out.println("La suma de los numeros es "+suma);
        
        media = suma / numeros.length;  //Dividimos la suma entre el tamaño del array para sacar la media
        System.out.println("Y la media es "+media);
                
    }
    
    public static void mayorymenor(int numeros[]){  //Calculamos el numero mas grande y mas pequeño
        int max = -9999;
        int min = 99999;
        
        for (int i = 0; i < numeros.length; i++) {
            if (numeros[i] > max) {
                max = numeros[i];
            }
        }
        
        for (int i = 0; i < numeros.length; i++) {
            if (numeros[i] < min) {
                min = numeros[i];
            }
        }
        System.out.println("El numero mas grande es "+max+ " y el mas pequeño "+min);
    }
    
    public static void cambiarPares(int numeros[]){  //Comprobamos que numeros son pares y los cambiamos a 0
        for (int i = 0; i < numeros.length; i++) {
            if(numeros[i] % 2 == 0){
                numeros[i] = 0;
            }
        }
    }
    public static void ordeninverso(int numeros[]){ //Te muestra los numeros en orden inverso
        for (int i = numeros.length - 1; i >= 0; i--) {
            
       
            System.out.print("Los numeros inversos serian " + numeros[i]);
        }
        System.out.println(); // Salto de línea
        }
    
}
