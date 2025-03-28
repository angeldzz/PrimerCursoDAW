/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package ejerciciosdecalculo1;
import  java.util.Scanner;
/**
 *
 * @author zx23student3283
 */
public class EjerciciosDeCalculo1 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        //creacion de Scanner
        Scanner preg = new Scanner(System.in);
        //Creacion de variables
        int n = 0 ;
        //creacion del do for
       do {
            System.out.print("Ingresa un número entre 1 y 100: ");
            n = preg.nextInt();
        } while (n < 1 || n > 100);

        long nfactorial = 1; // Cambiamos el nombre de la variable a nfactorial

        for (int i = 1; i <= n; i++) {
            nfactorial *= i; // Actualizamos el nombre aquí también
        }

        System.out.println("El factorial de " + n + " es " + nfactorial);
    }
}
