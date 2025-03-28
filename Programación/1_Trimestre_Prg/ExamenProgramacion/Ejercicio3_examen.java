/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package ejercicio3_examen;

import java.util.LinkedList;
import java.util.Scanner;

/**
 *
 * @author zx23student3283
 */
public class Ejercicio3_examen {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // Declaramos el LinkedList y tambien creamos el Scanner
        Scanner preg = new Scanner(System.in);
        LinkedList<String> palabras = new LinkedList<>();
        //acontinuacion preguntaremos las palabras al usuario y las añadiremos a la linkedlist
        System.out.println("Introduzca la palabra 1");
        palabras.add(preg.nextLine());//para ello se usa nombreLInkedList.add y en este caso preg.nextLine pra
        //para que nos lo guarde directamente y no tengamos que crear otro string
        System.out.println("Introduzca la palabra 2");
        palabras.add(preg.nextLine());
        System.out.println("Introduzca la palabra 3");
        palabras.add(preg.nextLine());
        //Ahora vamos a mostrar las palabras que escriba el usuario
        System.out.println("Has escrito las siguientes palabras: ");
        System.out.println(palabras.get(0)); // para ello usamos .get(posicion de la palabra el 0 es la primera);
        System.out.println(palabras.get(1));
        System.out.println(palabras.get(2));
        //ahora vamos a hacer el bucle foreach
        int contarpalabras=0;
        for (String indice : palabras) {//este for recorre palabras y cada palabra se almacena en String indice
            if (indice.length()<=3) {//este if se encarga de contar la logitud en letras de cada una de las palabras que rrecore el for
               contarpalabras++; //en caso de ser <= a 3 letras suma una al contador
            }else{//en caso de no ser <= a 3 muestra un mensaje de que no se puede añadir la palabra
                System.out.println("La palabra "+indice+" no se aniadio");
            }
            
        }
        //Aqui mostraremos las palabras que tienen menos de 3 o 3 letras
        System.out.println("El total de palabras con 3 o menos de 3 letras es= "+contarpalabras);
    }
}
