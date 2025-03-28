/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.examen_ejercicio2;

/**
 *
 * @author pinto
 */
class HTMLCodigo {

    public HTMLCodigo() {
    }
    //creamos el inicio del HTML
    public String inicio() {
        String inicio = "<!DOCTYPE html><html><head></head><body><table>"
                + "<tr><th>Equipo</th><th>jugados</th><th>ganados</th><th>empatados</th><th>perdidos</th>"
                + "<th>Goles a Favor</th><th>Goles en contra</th><th>puntos</th></tr>";

        return inicio;
    }
    //este es el fin del fichero HTML
    public String fin() {
        String fin = "</table></body></html>";

        return fin;
    }
}
