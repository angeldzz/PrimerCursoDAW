/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package claseschat2;

/**
 *
 * @author zx19student365
 */
public class Producto {
    String nombre;
    String barras;
    Double precio;
    int stock;
    boolean disponible;

    public Producto(String nombre, String barras, Double precio, int stock, boolean disponible) {
        this.nombre = nombre;
        this.barras = barras;
        this.precio = precio;
        this.stock = stock;
        this.disponible = disponible;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getBarras() {
        return barras;
    }

    public void setBarras(String barras) {
        this.barras = barras;
    }

    public Double getPrecio() {
        return precio;
    }

    public void setPrecio(Double precio) {
        this.precio = precio;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public boolean isDisponible() {
        return disponible;
    }

    public void setDisponible(boolean disponible) {
        this.disponible = disponible;
    }

    @Override
    public String toString() {
        return "Producto{" + "nombre=" + nombre + ", barras=" + barras + ", precio=" + precio + ", stock=" + stock + ", disponible=" + disponible + '}';
    }
    
    public void reponerStock(int cantidad){
        this.stock += cantidad;
    }
    
    public void vender(int cantidad){
        this.stock -= cantidad;
    }
}
