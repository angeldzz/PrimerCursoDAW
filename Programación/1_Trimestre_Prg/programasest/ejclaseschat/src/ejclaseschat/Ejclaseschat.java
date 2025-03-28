/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package ejclaseschat;

import java.util.Scanner;

/**
 *
 * @author PC-Sergio
 */
public class Ejclaseschat {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        Estudiante estudiante1 = new Estudiante("Sergio",18,"Ingenieria",19.6,false );
        Estudiante estudiante2 = new Estudiante("Ethan",28,"Jueza",6.8,false );
        /*
        Desarrolla una clase denominada "Estudiante" que represente a un estudiante universitario. La clase "Estudiante" debe tener los siguientes atributos privados:

Nombre (String)
Edad (int)
Carrera (String)
Promedio (double)
Matriculado (boolean)
La clase "Estudiante" debe incluir:

Un constructor que inicialice todos los atributos.
Métodos getter y setter para todos los atributos.
Un método toString que devuelva una cadena con la información de todos los atributos del estudiante.
Dos métodos propios:
actualizarPromedio(double nuevoPromedio) que actualice el promedio del estudiante.
cambiarEstadoMatricula() que cambie el estado de matrícula del estudiante de "matriculado" a "no matriculado" o viceversa.
        */
        System.out.println("Informacion estudiante 1");
        System.out.println(estudiante1.toString());
        System.out.println("Informacion estudiante 2");
        System.out.println(estudiante2.toString());
        
       estudiante1.actualizar(8.2);
       estudiante2.actualizar(9);
       System.out.println("Informacion estudiante 1");
        System.out.println(estudiante1.toString());
        System.out.println("Informacion estudiante 2");
        System.out.println(estudiante2.toString());
        
        estudiante1.cambiarEstadoMatricula();
        estudiante2.cambiarEstadoMatricula();
        System.out.println("Informacion estudiante 1");
        System.out.println(estudiante1.toString());
        System.out.println("Informacion estudiante 2");
        System.out.println(estudiante2.toString());
        
    }
    
}
