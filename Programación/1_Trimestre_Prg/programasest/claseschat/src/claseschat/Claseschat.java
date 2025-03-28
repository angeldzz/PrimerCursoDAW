/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package claseschat;

/**
 *
 * @author zx19student365
 */
public class Claseschat {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        /*
        Crea una clase llamada "Persona" que represente a una persona con los siguientes atributos privados:

Nombre (String)
Edad (int)
Altura (double)
Casado (boolean)
La clase "Persona" debe tener:

Un constructor que inicialice todos los atributos.
Métodos getter y setter para todos los atributos.
Un método toString que devuelva una cadena que muestre todos los atributos de la persona.
Dos métodos propios:
incrementarEdad() que aumente en uno la edad de la persona.
casarse() que cambie el estado civil de la persona a casado (de false a true).
El programa principal deberá crear al menos dos objetos "Persona", mostrar su información mediante el método toString, llamar a los métodos 
        propios para modificar los atributos y mostrar nuevamente la información actualizada de las personas.
        */
        Persona pre1 = new Persona("Jose",18,19.2,false);
        Persona pre2 = new Persona("Paco",28,5.2,false);
        
        System.out.println("Informacion persona 1:");
        System.out.println(pre1.toString());
        
        System.out.println("Informacion persona2:");
        System.out.println(pre2.toString());
        
        pre1.incrementar();
        pre2.casar();
        
        System.out.println("Informacion persona 1:");
        System.out.println(pre1.toString());
        
        System.out.println("Informacion persona2:");
        System.out.println(pre2.toString());
        
    }
    
}
