/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package claseschat2;

/**
 *
 * @author zx19student365
 */
public class Claseschat2 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        /*
        Crea una clase llamada "Producto" que represente un artículo en un inventario de una tienda. La clase "Producto" debe tener los siguientes atributos privados:

Nombre (String)
Código de barras (String)
Precio (double)
Cantidad en stock (int)
Disponible (boolean)
La clase "Producto" debe contener:

Un constructor que inicialice todos los atributos.
Métodos getter y setter para todos los atributos.
Un método toString que devuelva una cadena que muestre todos los atributos del producto.
Dos métodos propios:
reponerStock(int cantidad) que aumente la cantidad en stock del producto según la cantidad suministrada.
vender(int cantidad) que simule la venta de una cantidad específica del producto, disminuyendo la cantidad en stock.
El programa principal deberá crear al menos dos objetos "Producto", mostrar su información mediante el método toString,
        llamar a los métodos propios para modificar los atributos y mostrar nuevamente la información actualizada de los productos.
        */
        Producto prod1 = new Producto("Caja","123214",18.2,2,true);
        Producto prod2 = new Producto("Arbol","1525214",22.2,0,false);
        
        System.out.println("Informacion producto 1:");
        System.out.println(prod1.toString());
        System.out.println("Informacion producto 2:");
        System.out.println(prod2.toString());
        
        prod1.reponerStock(20);
        prod2.reponerStock(45);
        
        System.out.println("Informacion producto 1:");
        System.out.println(prod1.toString());
        System.out.println("Informacion producto 2:");
        System.out.println(prod2.toString());
        
        prod1.vender(10);
        prod2.vender(25);
         System.out.println("Informacion producto 1:");
        System.out.println(prod1.toString());
        System.out.println("Informacion producto 2:");
        System.out.println(prod2.toString());
    }
    }
    

