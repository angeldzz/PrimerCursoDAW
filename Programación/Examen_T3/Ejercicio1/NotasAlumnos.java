/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.examen_ejercicio1;

/**
 *
 * @author pinto
 */
class NotasAlumnos {
    String nombre;
    String apellidos;
    Double eval1;
    Double eval2;
    Double eval3;
    Double notaMedia;

    public NotasAlumnos(String nombre, String apellidos, Double eval1, Double eval2, Double eval3, Double notaMedia) {
        this.nombre = nombre;
        this.apellidos = apellidos;
        this.eval1 = eval1;
        this.eval2 = eval2;
        this.eval3 = eval3;
        this.notaMedia = notaMedia;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public Double getEval1() {
        return eval1;
    }

    public void setEval1(Double eval1) {
        this.eval1 = eval1;
    }

    public Double getEval2() {
        return eval2;
    }

    public void setEval2(Double eval2) {
        this.eval2 = eval2;
    }

    public Double getEval3() {
        return eval3;
    }

    public void setEval3(Double eval3) {
        this.eval3 = eval3;
    }

    public Double getNotaMedia() {
        return notaMedia;
    }

    public void setNotaMedia(Double notaMedia) {
        this.notaMedia = notaMedia;
    }

    @Override
    public String toString() {
        return "NotasAlumnos{" + "nombre=" + nombre + ", apellidos=" + apellidos + ", eval1=" + eval1 + ", eval2=" + eval2 + ", eval3=" + eval3 + ", notaMedia=" + notaMedia + '}';
    }
    
}
