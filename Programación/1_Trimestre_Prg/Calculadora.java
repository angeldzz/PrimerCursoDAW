/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package calculadora;

import java.util.Scanner;

/**
 *
 * @author zx23student3283
 */
public class Calculadora {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // Crear Scanner
        Scanner preg = new Scanner(System.in);
        //Creaccion de variables
        int numero1 = 0;
        int numero2 = 0;
        int operacion = -1;
        //Preguntar por los numeros
        System.out.print("Introduzca el numero 1: ");
        numero1 = preg.nextInt();
        System.out.print("Introduzca el numero 2: ");
        numero2 = preg.nextInt();

        //creacion operaciones
        while (operacion != 0) {
            System.out.println("1.-Introduccir de nuevo numeros\n" + "2.- Suma\n"
                    + "3.- Resta\n" + "4.- Multiplicacion\n" + "5.- Division\n" + "0.-Salir");
            System.out.print("Que quiere hacer: ");
            operacion = preg.nextInt();

            switch (operacion) {
                case 1:
                    System.out.print("Introduzca el numero 1: ");
                    numero1 = preg.nextInt();
                    System.out.print("Introduzca el numero 2: ");
                    numero2 = preg.nextInt();
                    System.out.println("1.-Introduccir de nuevo numeros\n" + "2.- Suma\n"
                            + "3.- Resta\n" + "4.- Multiplicacion\n" + "5.- Division\n" + "0.-Salir");
                    System.out.print("Que quiere hacer: ");
                    operacion = preg.nextInt();
                    break;
                case 2:
                    System.out.println("El resultado es " + (numero1 + numero2));
                    break;
                case 3:
                    System.out.println("El resultado es " + (numero1 - numero2));
                    break;
                case 4: 
                    System.out.println("El resultado es " + (numero1 * numero2));
                    break;
                case 5:
                    System.out.println("El resultado es " + (numero1 / numero2));
                    break;
                default:
                    break;
            }
        }
    }

}
