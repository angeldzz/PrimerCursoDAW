/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package ejhasmachat;

import java.util.HashMap;
import java.util.Scanner;

/**
 *
 * @author PC-Sergio
 */
public class EjHasmachat {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        Scanner preg = new Scanner(System.in);
        /*
        Crear un HashMap llamado "empleados" que asocie el número de identificación del empleado (clave) con su nombre (valor).
Agregar al menos tres empleados al HashMap, pidiendo al usuario que ingrese el número de identificación y el nombre de cada empleado.
Mostrar todos los empleados y sus números de identificación almacenados en el HashMap.
Verificar si un número de identificación específico está presente en el HashMap y mostrar el nombre del empleado asociado si existe.
Eliminar a un empleado del HashMap, solicitando al usuario que ingrese el número de identificación del empleado a eliminar.
Mostrar nuevamente todos los empleados y sus números de identificación después de realizar las operaciones anteriores.
        */
        HashMap<Integer,String> empleados = new HashMap<>(); //Creamos un hasmap con id Integer y valor String
        
        añadir(empleados);
        mostrar(empleados);
        comprobar(empleados);
        eliminar(empleados);
        mostrar(empleados);
    }
    
    public static void añadir(HashMap<Integer,String> empleados){ //como tiene un maximo de 3 valores hacemos el bucle for hasta que llegue a 3
         Scanner preg = new Scanner(System.in);
        String emp;
        for (int i = 0; i < 3; i++) {
            System.out.println("Que nombre tiene el empleado "+(i+1));
            emp = preg.nextLine();
            empleados.put(i, emp); //remplazamos en la posicion por el valor que nos da el usuario
        }
    }
    
    public static void mostrar(HashMap<Integer,String> empleados){
        for (int i = 0; i < 3; i++) {
            System.out.println("El nombre del empleado "+(i+1)+" es "+empleados.get(i)); //nos muestra el numero de del empleado y su nombre
        }
    }
    
    public static void comprobar(HashMap<Integer,String> empleados){ //comprueba si el empleado existe y te devuelve su nomrbe
        Scanner preg = new Scanner(System.in);
        Integer nume;
        System.out.println("Que empleado quieres buscar");
        nume = preg.nextInt()-1; //-1 para la posicion del hash
        if (empleados.containsKey(nume)) {
            System.out.println("El empleado con id "+(nume+1)+ " es "+empleados.get(nume));
        }
    }
    
    public static void eliminar(HashMap<Integer,String> empleados){ //busca el empleado y si existe borra el nombre
         Scanner preg = new Scanner(System.in);
         Integer num;
         System.out.println("Que empleado quieres borrar(id)");
         num = preg.nextInt()-1;
         if (empleados.containsKey(num)) {
            empleados.remove(num);
        }else{
             System.out.println("Ese empleado no existe");
         }
    }
}
