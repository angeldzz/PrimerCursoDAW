/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package calculadoradedescuentosinstrucciones;

import java.util.Scanner;

/**
 *
 * @author zx23student3283
 */
public class CalculadoraDeDescuentosInstrucciones {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        //Creacion de Scanner
        Scanner preg = new Scanner(System.in);
        //creacion de variables
        double precio;
        double descuento;
        double dctoeuro;
        //Preguntas al usuario
        System.out.print("Introduzca precio: ");
        precio = preg.nextDouble();
        System.out.print("Introduzca descuento: ");
        descuento = preg.nextDouble();

        //Calculos
        if (descuento < 100) {
            dctoeuro = (precio * descuento) / 100;
            System.out.println("Se le van a descontar: " + dctoeuro);
        }

        //creacion condicionales
        if (descuento > 100) {
            System.out.println("Su descuento no es valido");
        }
    }

}
