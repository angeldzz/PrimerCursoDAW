/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package ejercicio1_examen;

import java.util.Scanner;

/**
 *
 * @author zx23student3283
 */
public class Ejercicio1_examen {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        Scanner preg = new Scanner(System.in);//creamos el Scanner
        //creamos todas las variables correspondientes a cada cosa
        String carrera = "";
        Boolean matriculado;
        String sino = "";
        System.out.println("Introduzca su carrera universitaria");//preguntamos por la carrera
        carrera = preg.nextLine();
        System.out.println("Su carrera es"+carrera);
        System.out.println("Estas matriculado");
        sino = preg.nextLine();
        //si la respuesta de matriculado es si nos lleva al caso si y si es no nos llega al no
        switch(sino){
            case "si":
                matriculado = true;//en caso de ser si el boolean de matriculado sera true de verdadero
                System.out.println("En que semestre se encuentra actualmente");
                Integer semestre = preg.nextInt();
                System.out.println("Estudias "+carrera+" y estas actualmente matriculado en el semestre "+semestre);
                break;
            case "no":
                matriculado = false;// en caso de ser no el boolean sera false de falso y nos lleva a la siguient pregunta
                System.out.println("Tiene usted planes de matricularse en el proximo semestre");
                String matricularse = preg.nextLine();
                //aqui si la respuesta es si nos lleva a la respuesta del si gracias al .equals y si es no nos lleva al no
                if (matricularse.equals("si")) {
                    System.out.println("Estudias "+carrera+" y no estas matriculado pero planteas hacerlo el proximo semestre");
                }else if (matricularse.equals("no")) {
                    System.out.println("Estudias "+carrera+" y no estas matriculado ni tienes planes de matricularte proximamente");
                }else{
                System.out.println("La respuesta no es valiada diga si o no");//en caso de ser otra respuesta nos dice que es incorrecta
                }
                break;
            default:
                System.out.println("La respuesta no es valiada diga si o no");//en caso de ser otra respuesta nos dice que es incorrecta
                break;
        }
        
    }
    
}
