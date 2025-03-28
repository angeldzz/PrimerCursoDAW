/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package claseschat;

/**
 *
 * @author zx19student365
 */
public class Persona {
    String nombre;
    int edad;
    Double altura;
    Boolean casado;

    public Persona(String nombre, int edad, Double altura, Boolean casado) {
        this.nombre = nombre;
        this.edad = edad;
        this.altura = altura;
        this.casado = casado;
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

    public Double getAltura() {
        return altura;
    }

    public void setAltura(Double altura) {
        this.altura = altura;
    }

    public Boolean getCasado() {
        return casado;
    }

    public void setCasado(Boolean casado) {
        this.casado = casado;
    }

    @Override
    public String toString() {
        return "Persona{" + "nombre=" + nombre + ", edad=" + edad + ", altura=" + altura + ", casado=" + casado + '}';
    }
    
    public void incrementar(){
        this.edad++;
}
    public void casar(){
        this.casado = true;
    }
}

