/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package cajeroautomatico;

import java.util.Scanner;

/**
 *
 * @author zx23student3283
 */
public class CajeroAutomatico {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        //Creacion de Scanner
        Scanner preg = new Scanner(System.in);
        //Creacion de variables
        int ingresar = 0;
        int cuenta = 0;
        int[][] cuentadinero = {{111111111, 0}, {222222222, 0}, {333333333, 0}};
        int operacion = -1;
        //Seleccion de cuenta
        System.out.println("Usted tiene estas cuentas\n"
                + "cuenta 1.- 111111111\n"
                + "cuenta 2.- 222222222\n"
                + "cuenta 3.- 333333333\n"
                + "Seleccione una: ");
        cuenta = preg.nextInt();
        switch (cuenta) {
            case 1 ->
                System.out.println("A seleccionado la cuenta " + cuentadinero[0][0]);
            case 2 ->
                System.out.println("A seleccionado la cuenta " + cuentadinero[1][0]);
            case 3 ->
                System.out.println("A seleccionado la cuenta " + cuentadinero[2][0]);
            default ->
                System.out.println("CUENTA INEXISTENTE");
        }
        //Creacion de menu
        while (operacion != 0) {
            System.out.println("operaciones:\n"
                    + "1 .- ver saldo\n"
                    + "2 .- ingresar\n"
                    + "3 .- sacar\n"
                    + "0 .- salir\n"
                    + "Seleccionar una opcion:");
            operacion = preg.nextInt();
            if (operacion == 1) {
                System.out.println("Su saldo es " + cuentadinero[cuenta - 1][1]);
            } else if (operacion == 2) {
                int ing = ingreso();
                cuentadinero[cuenta - 1][1] = cuentadinero[cuenta - 1][1] + ing;
                System.out.println("Su nuevo saldo es " + cuentadinero[cuenta - 1][1]);
            } else if (operacion == 3) {

                int sac = sacar();
                if (sac < cuentadinero[cuenta - 1][1]) {
                    cuentadinero[cuenta - 1][1] = cuentadinero[cuenta - 1][1] - sac;
                    System.out.println("Su nuevo saldo es " + cuentadinero[cuenta - 1][1]);
                } else {
                    System.out.println("No se puede realizar, su saldo es menor que lo que desea sacar");
                }
            } else if (operacion > 3) {
                System.out.println("Opcion Incorrecta");
            }
        }
    }

    public static int ingreso() {
        //crear scanner
        Scanner preg = new Scanner(System.in);
        //crear algo para cuando tengamos seleccionada la cuenta meter dinero
        int ingresar = 0;
        System.out.println("Introduzca la cantidad que desea meter: ");
        ingresar = preg.nextInt();
        return ingresar;
    }

    public static int sacar() {
        //crear Scanner 
        Scanner preg = new Scanner(System.in);
        //crear algo para borrar el dinero que quieran
        int sacar = 0;
        System.out.println("Introduzca la cantidad que desea sacar: ");
        sacar = preg.nextInt();
        return sacar;
    }

}
