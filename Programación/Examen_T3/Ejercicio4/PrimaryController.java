package com.mycompany.examen_ejercicio4;

import java.io.IOException;
import java.net.URL;
import java.util.ArrayList;
import java.util.ResourceBundle;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Alert;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.TextField;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.scene.input.MouseEvent;

public class PrimaryController implements Initializable {

    @FXML
    private TextField tf_id;
    @FXML
    private TextField tf_direccion;
    @FXML
    private TextField tf_habitaciones;
    @FXML
    private TextField tf_pax;
    @FXML
    private TextField tf_precio;
    @FXML
    private TextField tf_ropa;
    @FXML
    private TextField tf_garaje;
    @FXML
    private TableView<Piso> tv_alquiler;
    @FXML
    private TableColumn<Piso, String> col_direccion;

    //atributos propios
    //Modelo Base de datos
    ModeloBD modelobd;

    //Objeto para la cancion seleccionada
    Piso pisoSeleccionado = null;

    @Override
    public void initialize(URL url, ResourceBundle rb) {

        //iniciar el modelo de Base de datos
        this.modelobd = new ModeloBD();

        //enlazar cell value
        col_direccion.setCellValueFactory(new PropertyValueFactory<>("direccion"));

        //Cargar los pisos que hay en la BD al iniciar
        //en la tableview
        this.cargaCancionesBD();
    }

    @FXML
    private void filaSeleccionada(MouseEvent event) {
                if (event.getClickCount() == 2) {

            //guardar en cncSeleccionada la cancion que esta seleccionada en la tabla
            this.pisoSeleccionado = this.tv_alquiler.getSelectionModel().getSelectedItem();

            //ponemos los datos de la bbdd a los textfields
            this.tf_id.setText(""+this.pisoSeleccionado.getId());
            this.tf_direccion.setText(this.pisoSeleccionado.getDireccion());
            this.tf_habitaciones.setText("" + this.pisoSeleccionado.getHabitaciones());
            this.tf_pax.setText("" + this.pisoSeleccionado.getPax());
            this.tf_precio.setText("" + this.pisoSeleccionado.getPrecio());
            this.tf_ropa.setText(this.pisoSeleccionado.getRopaCamaAseo());
            this.tf_garaje.setText(this.pisoSeleccionado.getGarage());
        }
    }

    @FXML
    private void btn_limpiar(ActionEvent event) {
        tf_id.setText("");
        tf_direccion.setText("");
        tf_habitaciones.setText("");
        tf_pax.setText("");
        tf_precio.setText("");
        tf_ropa.setText("");
        tf_garaje.setText("");
    }

    @FXML
    private void btn_nuevo(ActionEvent event) {
        
        //validar campos de texto
        if (this.tf_direccion.getText().equals("")) {
            dialogoError("El titulo no puede estar vacio");
            return;
        }
        if (this.tf_habitaciones.getText().equals("")) {
            dialogoError("El año no puede estar vacio");
            return;
        }
        if (this.tf_ropa.getText().equals("")) {
            dialogoError("El artista no puede estar vacio");
            return;
        }
        if (this.tf_garaje.getText().equals("")) {
            dialogoError("El genero no puede estar vacio");
            return;
        }
        //la habitacion y el pax lo pasamos a integer y capturamos excepcion de numero
        Integer habitaciones = 0;
        try {
            habitaciones = Integer.valueOf(this.tf_habitaciones.getText());
        } catch (NumberFormatException ex) {
            dialogoError("La habitacion tiene que ser un numero entero");
        }
        Integer pax = 0;
        try {
            pax = Integer.valueOf(this.tf_habitaciones.getText());
        } catch (NumberFormatException ex) {
            dialogoError("El pax tiene que ser un numero entero");
        }
        //Y precio lo pasamos a double para tener el precio en su formato y capturamos excepcion numero
        Double precio = 0.0;
        try {
            precio = Double.valueOf(this.tf_habitaciones.getText());
        } catch (NumberFormatException ex) {
            dialogoError("El precio tiene que ser un numero double ej:(999.00)");
        }
        //añadimos el piso
        Piso ps = new Piso(null,
                this.tf_direccion.getText(),
                habitaciones,
                pax,
                precio,
                this.tf_ropa.getText(),
                this.tf_garaje.getText()
        );
        //cremoa un bollean para ver si funciona el modelo
        Boolean resultado = this.modelobd.insertarBD(ps);
        //si funciona nos devuelve true entonces añadimos a la tv
        if (resultado) {
            this.tv_alquiler.getItems().add(ps);
            this.tf_id.setText(String.valueOf(ps.getId()));
        } else {
            this.dialogoError("No se pudo insertar el piso");
        }
    }

    @FXML
    private void btn_modificar(ActionEvent event) {
        //Si tenemos un piso seleccionado
                if (this.pisoSeleccionado != null) {
        //entonces cambiamos con sets los datos de Piso a los nuevos textField
            this.pisoSeleccionado.setDireccion(this.tf_direccion.getText());
            this.pisoSeleccionado.setHabitaciones(Integer.valueOf(this.tf_habitaciones.getText()));
            this.pisoSeleccionado.setPax(Integer.valueOf(this.tf_pax.getText()));
            this.pisoSeleccionado.setPrecio(Double.valueOf(this.tf_precio.getText()));
            this.pisoSeleccionado.setRopaCamaAseo(this.tf_ropa.getText());
             this.pisoSeleccionado.setGarage(this.tf_garaje.getText());
             
             //controlamos lo que nos devuelva 
            if (this.modelobd.modificaCancion(this.pisoSeleccionado)) {
                //damos una advertencia de que todoa a ido bien
                this.dialogo("Fila Modificada");
                //limpiamos los datos de tf
                this.btn_limpiar(event);
                //refrescamos la tabla
                this.tv_alquiler.refresh();
            } else {
                //si a dado false saldra el error
                this.dialogoError("No se pudo modificar la fila");
            }
        }
    }

    @FXML
    private void btn_borrar(ActionEvent event) {
        //controlamos que este un piso seleccionado
                if (this.pisoSeleccionado != null) {
        //controlamos que funcione el llamar al modelo
            if (this.modelobd.borrarCancion(this.pisoSeleccionado)) {
                //sacamos un dialogo de que a funcionado
                this.dialogo("Fila borrada");
                //quitamos el piso de la tabla
                this.tv_alquiler.getItems().remove(this.pisoSeleccionado);
            } else {
                this.dialogoError("No se pudo borrar la fila");
            }

        }
    }

    private void cargaCancionesBD() {
        //creamos un array en el que guardamos los datos que saquemos del modelo
        ArrayList<Piso> listaPisosIniciales = this.modelobd.listaCanciones();
        
        //recorremos dicho array y añadimos los datos al table view
        for (Piso ps : listaPisosIniciales) {
            this.tv_alquiler.getItems().add(ps);
        }
    }

    //ventanas de errores
    private void dialogoError(String error) {
        //crear una ventana para mostrar el error
        Alert nv = new Alert(Alert.AlertType.ERROR);

        //Caracteristicas de la ventana
        nv.setTitle("Error");
        nv.setContentText(error);

        //Mostrar la ventana
        nv.showAndWait();
    }

    //ventanas de informacion
    private void dialogo(String info) {
        //crear una ventana para mostrar el error
        Alert nv = new Alert(Alert.AlertType.INFORMATION);

        //Caracteristicas de la ventana
        nv.setTitle("Informacion");
        nv.setContentText(info);

        //Mostrar la ventana
        nv.showAndWait();
    }
}
