package com.mycompany.examen_ejercicio3;

import java.io.IOException;
import java.net.URL;
import java.sql.*;
import java.util.ResourceBundle;
import java.util.logging.Level;
import java.util.logging.Logger;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.chart.CategoryAxis;
import javafx.scene.chart.LineChart;
import javafx.scene.chart.NumberAxis;
import javafx.scene.chart.XYChart;

public class PrimaryController implements Initializable {

    @FXML
    private LineChart<String, Double> GraficoLineas;
    @FXML
    private NumberAxis EjeY;
    @FXML
    private CategoryAxis EjeX;
    //mis atributos
    private Connection conexion;

    @Override
    public void initialize(URL url, ResourceBundle rb) {
        String ruta = "jdbc:mysql://localhost:3306/examen";
        String usuario = "examen";
        String contraseña = "examen";

        try {
            //Crear la conexion
            this.conexion = DriverManager.getConnection(ruta, usuario, contraseña);

        } catch (SQLException ex) {
            Logger.getLogger(PrimaryController.class.getName()).log(Level.SEVERE, null, ex);
        }
        //llamamos dos veces a guardar datos para que se corriga los valores en el grafico
        guardarDatos();
        guardarDatos();
    }

    public void guardarDatos() {
        //creamos la consulta de bitcoin
        String consulta = "Select * from bitcoin";

        try {
            //Preparacion de la consulta
            PreparedStatement consultaUsu = this.conexion.prepareStatement(consulta);

            //ejecutar la consulta
            ResultSet salida = consultaUsu.executeQuery();

            //creamos las series necesarias para cada tipo de valores
            XYChart.Series<String, Double> ultimo = new XYChart.Series<>();
            XYChart.Series<String, Double> minimo = new XYChart.Series<>();
            XYChart.Series<String, Double> maximo = new XYChart.Series<>();

            //ponemos los titulos a las series
            ultimo.setName("Ultimo");
            minimo.setName("Minimo");
            maximo.setName("Maximo");
            //recorremos los datos devueltos
            while (salida.next()) {
                //añadimos todos los datos de cada rango de valores a su serie
                //los datos de dia los pasamos a String por que es un CategoryAxes
                ultimo.getData().add(new XYChart.Data<>(String.valueOf(salida.getInt("dia")), salida.getDouble("ultimo")));
                minimo.getData().add(new XYChart.Data<>(String.valueOf(salida.getInt("dia")), salida.getDouble("minimo")));
                maximo.getData().add(new XYChart.Data<>(String.valueOf(salida.getInt("dia")), salida.getDouble("maximo")));

                //comprobamos que nos muestra en el sistema los datos de BD
                System.out.println(salida.getInt("dia") + "-"
                        + salida.getDouble("ultimo") + "-"
                        + salida.getDouble("minimo") + "-"
                        + salida.getDouble("maximo"));
            }
            //limpiamos el grafico
            this.GraficoLineas.getData().clear();

            //añadimos las series de datos a los graficos de lineas
            this.GraficoLineas.getData().addAll(ultimo, minimo, maximo);
        } catch (SQLException ex) {
            System.out.println("Error de SQL");
            ex.getMessage();
        }
    }
}
