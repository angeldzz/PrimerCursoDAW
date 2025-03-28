/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.daw.ejercicio3_t2_examen;

/**
 *
 * @author zx23student3283
 */
//esta clase nos sirve para guardar los productos con su id,nombre, cantidad y precio y asi los podemos mostrar en el tableview despues
public class Producto {
    Integer id;
    String nombre;
    Integer cantidad;
    Integer precio;

    //contructor
    public Producto(Integer id, String nombre, Integer cantidad, Integer precio) {
        this.id = id;
        this.nombre = nombre;
        this.cantidad = cantidad;
        this.precio = precio;
    }
    
    //getter y los setter
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public Integer getCantidad() {
        return cantidad;
    }

    public void setCantidad(Integer cantidad) {
        this.cantidad = cantidad;
    }

    public Integer getPrecio() {
        return precio;
    }

    public void setPrecio(Integer precio) {
        this.precio = precio;
    }
    
}
