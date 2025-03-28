/*
 * Click nbfs://nbhost/System
FileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package registrodenotasconhashmap;

import java.util.HashMap;
import java.util.Scanner;

/**
 *
 * @author zx23student3283
 */
public class RegistroDeNotasConHashMap {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // Creacion de Scanner
        Scanner preg = new Scanner(System.in);
        //Creacion de hashmap
        HashMap<String, String[]> alumnos = new HashMap<String, String[]>();
        //Crear Menu
        int opcion = -1;
        do {
            System.out.println("****************************");
            System.out.println("""
                           1.- Agregar un estudiante
                           2.- Listar estudiantes
                           3.- Eliminar Estudiantes
                           4.- Buscar estudiantes
                           5.- Actualizar Nota
                           0.- Salir
                           """);
            System.out.print("Introduzca su opcion: ");
            opcion = preg.nextInt();
            switch (opcion) {
                case 1:
                    agregar(alumnos);
                    break;
                case 2:
                    listar(alumnos);
                    break;
                case 3:
                    borrar(alumnos);
                    break;
                case 4:
                    buscar(alumnos);
                    break;
                case 5:
                    actualizar(alumnos);
                    break;
                case 0:
                    System.out.println("ADIOS");
                    break;
                default:
                    System.out.println("Esta opcion no existe");
                    break;
            }
        } while (opcion != 0);

    }

    public static void agregar(HashMap<String, String[]> alm) {
        //Creacion de Scanner
        Scanner preg = new Scanner(System.in);
        //Creacion clave
        System.out.println("Introduzca clave de alumno (sucesivo a A0)");
        String clave = preg.nextLine();
        //Creacion Alumno
        System.out.println("Introduzca Alumno");
        String alumno = preg.nextLine();
        //Creacion Nota
        System.out.println("Introduzca Nota");
        String nota = preg.nextLine();
        //Introduccion de datos en Hashmap
        String[] info = {alumno, nota};
        alm.put(clave, info);

    }

    public static void listar(HashMap<String, String[]> alm) {
        for (String a : alm.keySet()) {
           String[] i = alm.get(a);
           System.out.println("Identificador = "+a+ " del Alumno " +i[0]+ " nota = " +i[1]); 
        }
    }

    public static void borrar(HashMap<String, String[]> alm) {
        //Creacion de Scanner
        Scanner preg = new Scanner(System.in);
        
        System.out.println("Que alumno quiere borrar");
        
        String borrar = preg.nextLine();
        
        alm.remove(borrar);
    }

    public static void buscar(HashMap<String, String[]> alm) {
        //Creacion de Scanner
        Scanner preg = new Scanner(System.in);
        //Seleccion de clave
        System.out.println("Introduzca clave de alumno");
        String coger = preg.nextLine();
        String[] info = alm.get(coger);
        //Muestra de datos
        System.out.println("El alumno con clave " + coger + " es " + info[0] + " y su nota es " + info[1]);
    }

    public static void actualizar(HashMap<String, String[]> alm) {
        //Creacion de Scanner
        Scanner preg = new Scanner(System.in);
        //Seleccion de clave
        System.out.println("Que clave desea actualizar");
        String id = preg.nextLine();
        String[] info = alm.get(id);
        System.out.println("Introduzca la nota nueva para actualizar");
        info[1] = preg.nextLine();
        
    }
}
