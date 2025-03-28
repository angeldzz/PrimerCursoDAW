/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package usocondicionales;

import java.util.Scanner;

/**
 *
 * @author zx23student3283
 */
public class UsoCondicionales {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        //Creacion Scanner
        Scanner preg = new Scanner(System.in);
        // Creacion de variables
        double numero = 0;
        //Preguntar al usuario por el numero
        System.out.print("Introdizca numero: ");
        numero = preg.nextDouble();
        //Creacion de condiciones

        if (numero > 0) {
            System.out.println("Tu numero es positivo");
        } else if (numero == 0) {
            System.out.println("Tu numero es 0");
        } else {
            System.out.println("Tu numero es negativo");
        }
    }
}
