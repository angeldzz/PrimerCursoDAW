/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.daw.ejercicio3_t2_examen;

import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.TextField;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.scene.layout.GridPane;
import javafx.scene.layout.VBox;
import javafx.stage.Stage;

/**
 *
 * @author zx23student3283
 */
public class Vista {

    //creamos la escena y el tableview, el table view empece creandolo fuera por 
    //que pense en hacer metodos y luego se me complico y lo deje asi
    Scene escena;
    TableView tableview;

    public Vista(Stage escenario) {
        //creacion de panel, gridPane y inicializacion de esos y tambien del
        //tableview
        VBox panel = new VBox();
        GridPane grid = new GridPane();
        this.tableview = new TableView<>();

        //creacion de labels
        Label id = new Label("Id producto");
        Label nombre = new Label("Nombre");
        Label cantidad = new Label("Cantidad");
        Label precio = new Label("Precio");

        //creacion de TextField
        TextField tid = new TextField("");
        TextField tnombre = new TextField("");
        TextField tcantidad = new TextField("");
        TextField tprecio = new TextField("");

        //creacion de Button
        Button anadir = new Button("Añadir");
        Button limpiar = new Button("Limpiar");
        Button salir = new Button("Salir");

        //añadimos todo al gridPane con sus correspondientes direcciones
        grid.add(id, 0, 0);
        grid.add(nombre, 0, 1);
        grid.add(cantidad, 0, 2);
        grid.add(precio, 0, 3);
        grid.add(tid, 1, 0);
        grid.add(tnombre, 1, 1);
        grid.add(tcantidad, 1, 2);
        grid.add(tprecio, 1, 3);
        grid.add(anadir, 2, 0);
        grid.add(limpiar, 2, 1);
        grid.add(salir, 2, 3);

        //el boton añadir nos mete los atributos en orden de la clase Producto y tambien los pasa a Integer los que son numeros :)
        anadir.setOnAction(evento -> {
            //esto nos sirve para enviar los datos que se introduzcan, a la clase y luego mostrarlos en el tableView
            Producto pdt = new Producto(Integer.valueOf(tid.getText()),tnombre.getText(),Integer.valueOf(tcantidad.getText()),Integer.valueOf(tprecio.getText()));
            //esto nos sirve para añadir el objeto pdt cada vez que lo creamos
            this.tableview.getItems().add(pdt);
        });

        //limpiar simplemente pone vacios todos los setText
        limpiar.setOnAction(evento -> {
            tid.setText("");
            tnombre.setText("");
            tcantidad.setText("");
            tprecio.setText("");
        });
        //salir cierra el programa
        salir.setOnAction(evento -> {
            System.exit(0);
        });

        //aqui añadimos las tablecolumns que son las columnas de nuestra tabla
        //un detalle es que los datos que son numeros son Integer y asi podriamos
        //Jugar con ellos mas facilmente a la hora de leer datos y hace operaciones
        TableColumn<Producto, Integer> colid = new TableColumn<>("Id");
        colid.setCellValueFactory(new PropertyValueFactory<>("id"));
        colid.setPrefWidth(100);
        this.tableview.getColumns().add(colid);

        TableColumn<Producto, String> colnom = new TableColumn<>("Nombre");
        colnom.setCellValueFactory(new PropertyValueFactory<>("nombre"));
        colnom.setPrefWidth(200);
        this.tableview.getColumns().add(colnom);

        TableColumn<Producto, Integer> colcant = new TableColumn<>("Cantidad");
        colcant.setCellValueFactory(new PropertyValueFactory<>("cantidad"));
        colcant.setPrefWidth(200);
        this.tableview.getColumns().add(colcant);

        TableColumn<Producto, Integer> colprecio = new TableColumn<>("Precio");
        colprecio.setCellValueFactory(new PropertyValueFactory<>("precio"));
        colprecio.setPrefWidth(100);
        this.tableview.getColumns().add(colprecio);

        panel.getChildren().addAll(grid, this.tableview);
        this.escena = new Scene(panel, 600, 400);
        escenario.setScene(this.escena);
        escenario.show();
    }

}
