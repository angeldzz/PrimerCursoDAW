/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package ejerciciosdecalculo1;

import java.util.Scanner;

/**
 *
 * @author zx23student3283
 */
public class CalculosNumericos {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        factorial();
        primos();
    }

    public static void factorial() {
        //creacion de Scanner
        Scanner preg = new Scanner(System.in);
        //definir variables

        int fact = 1;
        int i = 1;
        int n;

        //introduzca un numero entre 1 y 100
        System.out.println("Introduzca un numero entre 1 y 100");
        n = preg.nextInt();

        if ((n >= 0) && (n <= 100)) {

            while (i <= n) {
                fact = fact * i;
                i++;

            }
            //Damos los resultados
            System.out.println("El factorial de" + n + "es" + fact);

        }
    }

    public static void primos() {
        //creacion de Scanner
        Scanner preg = new Scanner(System.in);

        // Pedir al usuario que ingrese un número
        System.out.print("Ingrese un número entre 1 y 100: ");
        int n = preg.nextInt();
        
    }

    public static void sumaenteros() {
        Scanner preg = new Scanner(System.in);

        // Pedir al usuario que ingrese un número que llamamos n
        System.out.print("Ingrese un número entre 1 y 100 (n): ");
        int n = preg.nextInt();

        // Verificar si el numero está en el rango de 1 a 100
        if (n >= 1 && n <= 100) {
            int suma = 0;

            // Calcular la suma de los primeros n números enteros positivos directamente en el bucle 'for'
            for (int i = 1; i <= n; i++) {
                suma += i;
            }

            // Mostrar el resultado al usuario
            System.out.println("La suma de los primeros " + n + " números enteros positivos es: " + suma);
        } else {
            // Si no está en el rango válido, mostrar un mensaje de error
            System.out.println("El número ingresado no está en el rango de 1 a 100.");
        }
    }
}
