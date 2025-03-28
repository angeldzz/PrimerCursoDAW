/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package mayorde3numeros;
import  java.util.Scanner;
/**
 *
 * @author zx23student3283
 */
public class MayorDe3Numeros {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // Creacion de Scanner
        Scanner preg = new Scanner(System.in);
        //Creacion de variables
        int numero1;
        int numero2;
        int numero3;
        int media;
        //Preguntas al usuario
        System.out.print("Diga numero1: ");
        numero1=preg.nextInt();
        System.out.print("Diga numero2: ");
        numero2=preg.nextInt();
        System.out.print("Diga numero3: ");
        numero3=preg.nextInt();
        //media
        media=(numero1+numero2+numero3)/3;
        System.out.println("Su media es de:"+media);
        //Comparacion de numeros
        if ((numero1>numero2)&&(numero1>numero3)) {
            System.out.println("El numero mayor es "+numero1);
        }
        else if ((numero2>numero1)&&(numero2>numero3)) {
            System.out.println("El numero mayor es "+numero2);
        }
        else if ((numero3>numero1)&&(numero3>numero2)) {
            System.out.println("El numero mayor es "+numero3);
        }
        else {
            System.out.println("Todos los numeros son iguales");
        }
    }
    
}
