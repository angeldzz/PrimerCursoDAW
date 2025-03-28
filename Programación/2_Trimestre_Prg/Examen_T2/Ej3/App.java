package com.daw.ejercicio3_t2_examen;

import javafx.application.Application;
import javafx.scene.Scene;
import javafx.scene.control.Label;
import javafx.scene.layout.StackPane;
import javafx.stage.Stage;


/**
 * JavaFX App
 */
public class App extends Application {

    @Override
    public void start(Stage escenario) {
        Vista vt = new Vista(escenario);
        
    }

    public static void main(String[] args) {
        launch();
    }

}