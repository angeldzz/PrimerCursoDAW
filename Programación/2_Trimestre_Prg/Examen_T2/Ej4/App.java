package com.daw.ejercicio4_t2_examen;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import javafx.application.Application;
import javafx.scene.Scene;
import javafx.scene.control.CheckBox;
import javafx.scene.control.Label;
import javafx.scene.control.Menu;
import javafx.scene.control.MenuBar;
import javafx.scene.control.MenuItem;
import javafx.scene.control.RadioButton;
import javafx.scene.control.TextArea;
import javafx.scene.control.TextField;
import javafx.scene.control.ToggleGroup;
import javafx.scene.layout.AnchorPane;
import javafx.scene.layout.StackPane;
import javafx.stage.Stage;


/**
 * JavaFX App
 */
public class App extends Application {

    @Override
    public void start(Stage escenario) {
        //creamos el anchorpane
        AnchorPane panel = new AnchorPane();
        
        //creamos la barra de menus
        MenuBar mb = new MenuBar();
        
        //creamos el menu archivo
        Menu archivo = new Menu("Archivo");
        
        //creamos los menuItems Guardar y Salir
        MenuItem guardar = new MenuItem("Guardar");
        MenuItem salir = new MenuItem("Salir");
        
        //creamos la funcion para que nos deje salir
        salir.setOnAction(evento->{
        System.exit(0);
        });
        
        //añadimos los menuItems al menu
        archivo.getItems().addAll(guardar,salir);
        
        //añadimos el menu al menuBar
        mb.getMenus().add(archivo);
        
        //colocamos la barra de menu en el AP
        AnchorPane.setTopAnchor(mb, 5.0);
        
        //creamos los Labels y sus Text fields y los vamos colocando en el AnchorPane
        Label socio = new Label("Socio");
        AnchorPane.setTopAnchor(socio, 40.0);
        
        TextField tsocio = new TextField("");
        AnchorPane.setTopAnchor(tsocio, 40.0);
        AnchorPane.setLeftAnchor(tsocio, 50.0);
        
        Label telefono = new Label("Teléfono");
        AnchorPane.setTopAnchor(telefono, 70.0);
        
        TextField ttelefono = new TextField("");
        AnchorPane.setTopAnchor(ttelefono, 70.0);
        AnchorPane.setLeftAnchor(ttelefono, 50.0);
        
        Label correo = new Label("Correo");
        AnchorPane.setTopAnchor(correo, 100.0);
        
        TextField tcorreo = new TextField("");
        AnchorPane.setTopAnchor(tcorreo, 100.0);
        AnchorPane.setLeftAnchor(tcorreo, 50.0);
        
        //y un label para categoria
        Label categoria = new Label("Categoria");
        AnchorPane.setTopAnchor(categoria, 130.0);
        AnchorPane.setLeftAnchor(categoria, 20.0);
        
        //creamos el ToggleGroup para los RadioButon los cuales tambien creamos
        ToggleGroup Tgroup = new ToggleGroup();
        
        //RadioButton master
        RadioButton master = new RadioButton("Master");
        AnchorPane.setTopAnchor(master, 160.0);
        AnchorPane.setLeftAnchor(master, 50.0);
        master.setToggleGroup(Tgroup);//añadimos los radiobuttons a el togglegroup
        
        //RadioButton experto
        RadioButton experto = new RadioButton("Experto");
        AnchorPane.setTopAnchor(experto, 190.0);
        AnchorPane.setLeftAnchor(experto, 50.0);
        experto.setToggleGroup(Tgroup);
        
        //RadioButton aprendiz
        RadioButton aprendiz = new RadioButton("Aprendiz");
        AnchorPane.setTopAnchor(aprendiz, 220.0);
        AnchorPane.setLeftAnchor(aprendiz, 50.0);
        aprendiz.setToggleGroup(Tgroup);
        
        //creamos el label de servicios
        Label servicios = new Label("Servicios");
        AnchorPane.setTopAnchor(servicios, 40.0);
        AnchorPane.setLeftAnchor(servicios, 300.0);
        
        //creamos los CheckBox para los servicios
        //CheckBox biblioteca
        CheckBox biblioteca = new CheckBox("Biblioteca");
        AnchorPane.setTopAnchor(biblioteca, 70.0);
        AnchorPane.setLeftAnchor(biblioteca, 300.0);
        //CheckBox gimnasio
        CheckBox gimnasio = new CheckBox("Gimnasio");
        AnchorPane.setTopAnchor(gimnasio, 100.0);
        AnchorPane.setLeftAnchor(gimnasio, 300.0);
        //CheckBox fisioterapia
        CheckBox fisioterapia = new CheckBox("Fisioterapia");
        AnchorPane.setTopAnchor(fisioterapia, 130.0);
        AnchorPane.setLeftAnchor(fisioterapia, 300.0);
        
        //por ultimo creamos el label y el TextArea
        Label comentarios = new Label("Comentarios");
        AnchorPane.setTopAnchor(comentarios, 160.0);
        AnchorPane.setLeftAnchor(comentarios, 300.0);
        
        TextArea coment = new TextArea();
        AnchorPane.setTopAnchor(coment, 180.0);
        AnchorPane.setLeftAnchor(coment, 300.0);
        
        //ahora vamos a crear la accion de guardar para guardarlo en un csv
        File arc = new File("C:\\Users\\zx23student3283\\OneDrive - Espacios Educativos, S.C.M\\Escritorio\\Examen\\Ej4\\guardado.csv");
        guardar.setOnAction(event->{
            try(BufferedWriter bw = new BufferedWriter(new FileWriter(arc))){
            
                bw.write(tsocio.getText()+";"+ttelefono.getText()+";"+tcorreo.getText()+";"+Tgroup.getToggles()+";"+biblioteca.isSelected()+";"+gimnasio.isSelected()+";"+fisioterapia.isSelected()+";"+coment.getText());
                
            } catch (IOException ex) {
                System.out.println("Error: "+ ex.getMessage());
            }
        });
        
        //añadimos los objetos al panel: menuBar
        panel.getChildren().addAll(
                mb,
                socio,tsocio,telefono,ttelefono,correo,tcorreo,
                categoria,master,experto,aprendiz,
                servicios,biblioteca,gimnasio,fisioterapia,
                comentarios,coment);
        //creamos la escena y metemos el panel, tambien le damos tamaño fijo
        Scene escena = new Scene(panel,600,400);
        escenario.setScene(escena);
        escenario.show();
    }

    public static void main(String[] args) {
        launch();
    }

}