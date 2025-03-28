/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.examen_ejercicio4;

/**
 *
 * @author pinto
 */
public class Piso {
    //esta es la clase piso y en ella guardaremos los datos de cada piso con su
    //constructor, getters ,setters y toString
      Integer id;
      String direccion;
      Integer habitaciones;
      Integer pax;
      Double precio;
      String ropaCamaAseo;
      String garage;

    public Piso(Integer id, String direccion, Integer habitaciones, Integer pax, Double precio, String ropaCamaAseo, String garage) {
        this.id = id;
        this.direccion = direccion;
        this.habitaciones = habitaciones;
        this.pax = pax;
        this.precio = precio;
        this.ropaCamaAseo = ropaCamaAseo;
        this.garage = garage;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public Integer getHabitaciones() {
        return habitaciones;
    }

    public void setHabitaciones(Integer habitaciones) {
        this.habitaciones = habitaciones;
    }

    public Integer getPax() {
        return pax;
    }

    public void setPax(Integer pax) {
        this.pax = pax;
    }

    public Double getPrecio() {
        return precio;
    }

    public void setPrecio(Double precio) {
        this.precio = precio;
    }

    public String getRopaCamaAseo() {
        return ropaCamaAseo;
    }

    public void setRopaCamaAseo(String ropaCamaAseo) {
        this.ropaCamaAseo = ropaCamaAseo;
    }

    public String getGarage() {
        return garage;
    }

    public void setGarage(String garage) {
        this.garage = garage;
    }

    @Override
    public String toString() {
        return "Piso{" + "id=" + id + ", direccion=" + direccion + ", habitaciones=" + habitaciones + ", pax=" + pax + ", precio=" + precio + ", ropaCamaAseo=" + ropaCamaAseo + ", garage=" + garage + '}';
    }
      
}
