/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package ejercicio2_examen;

import java.util.Scanner;

/**
 *
 * @author zx23student3283
 */
public class Ejercicio2_examen {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // Vamos a crear las variables necesarias junto a el scanner
        //inicializamos los valores para asi quitarnos de posibles errores
        Scanner preg = new Scanner(System.in);
        float decimal = 0;
        float decimal2 = 0;
        float sumad = 0;//suma de decimales
        float sumat = 0;//suma de totales en sumas
        long entero = 0;
        long entero2 = 0;
        long sumae = 0;//suma de enteros
        
        //ahora creamos las preguntas con el preg correspondiente a cada tipo de variable
        System.out.println("Ingresa el decimal 1");
        decimal = preg.nextFloat();
        System.out.println("Ingresa el decimal 2");
        decimal2 = preg.nextFloat();
        System.out.println("Ingresa el entero 1");
        entero = preg.nextLong();
        System.out.println("Ingresa el entero 2");
        entero2 = preg.nextLong();
        //creamos la suma decimal y la de enteros la decimal es sumad y entero es sumae
        sumad = decimal + decimal2;
        sumae = entero + entero2;
        //creamos la suma de los totales y la almacenamos en un float para que tenga los decimales
        sumat = sumad + sumae;
        //ahora vamos a realizar los minimos de los dos numeros enteros
        long minimoEntero = Math.min(entero, entero2);
        //ahora haremos lo mismo para los decimales con Math.min
        float minimoDecimal = Math.min(decimal, decimal2);
        //A continuacion mostraremos los mensajes con todos los resultados
        System.out.println("La suma de los decimales es "+sumad);
        System.out.println("La suma de los enteros es "+sumae);
        System.out.println("La suma del total de los numeros es "+sumat);
        System.out.println("El minimo de los enteros es "+minimoEntero);
        System.out.println("El minimo de los decimales es "+minimoDecimal);
        
    }

}
