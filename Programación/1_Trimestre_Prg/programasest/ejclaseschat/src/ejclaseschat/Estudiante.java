/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ejclaseschat;

import java.util.Scanner;

/**
 *
 * @author PC-Sergio
 */
public class Estudiante {
    /*
    Desarrolla una clase denominada "Estudiante" que represente a un estudiante universitario. La clase "Estudiante" debe tener los siguientes atributos privados:

Dos métodos propios:
actualizarPromedio(double nuevoPromedio) que actualice el promedio del estudiante.
cambiarEstadoMatricula() que cambie el estado de matrícula del estudiante de "matriculado" a "no matriculado" o viceversa.
    */
    String nombre;
    int edad;
    String carrera;
    Double nota;
    boolean matriculado;

    public Estudiante(String nombre, int edad, String carrera, Double nota, boolean matriculado) {
        this.nombre = nombre;
        this.edad = edad;
        this.carrera = carrera;
        this.nota = nota;
        this.matriculado = matriculado;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    public String getCarrera() {
        return carrera;
    }

    public void setCarrera(String carrera) {
        this.carrera = carrera;
    }

    public Double getPromedio() {
        return nota;
    }

    public void setPromedio(Double promedio) {
        this.nota = promedio;
    }

    public boolean isMatriculado() {
        return matriculado;
    }

    public void setMatriculado(boolean matriculado) {
        this.matriculado = matriculado;
    }

    @Override
    public String toString() {
        return "Estudiante{" + "nombre=" + nombre + ", edad=" + edad + ", carrera=" + carrera + ", promedio=" + nota + ", matriculado=" + matriculado + '}';
    }
    
    public void actualizar(double nuevaNota){
        
        this.nota = nuevaNota;
    }
    
    public void cambiarEstadoMatricula(){
        this.matriculado = !this.matriculado;
    }
}
