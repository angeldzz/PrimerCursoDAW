/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.examen_ejercicio2;

/**
 *
 * @author pinto
 */
class Liga {
    String equipo;
    Integer jugados;
    Integer ganados;
    Integer empeatados;
    Integer perdidos;
    Integer golesFavor;
    Integer golesContra;
    Integer puntos;

    public Liga(String equipo, Integer jugador, Integer ganados, Integer empeatados, Integer perdidos, Integer golesFavor, Integer golesContra, Integer puntos) {
        this.equipo = equipo;
        this.jugados = jugador;
        this.ganados = ganados;
        this.empeatados = empeatados;
        this.perdidos = perdidos;
        this.golesFavor = golesFavor;
        this.golesContra = golesContra;
        this.puntos = puntos;
    }

    public String getEquipo() {
        return equipo;
    }

    public void setEquipo(String equipo) {
        this.equipo = equipo;
    }

    public Integer getJugados() {
        return jugados;
    }

    public void setJugados(Integer jugados) {
        this.jugados = jugados;
    }

    public Integer getGanados() {
        return ganados;
    }

    public void setGanados(Integer ganados) {
        this.ganados = ganados;
    }

    public Integer getEmpeatados() {
        return empeatados;
    }

    public void setEmpeatados(Integer empeatados) {
        this.empeatados = empeatados;
    }

    public Integer getPerdidos() {
        return perdidos;
    }

    public void setPerdidos(Integer perdidos) {
        this.perdidos = perdidos;
    }

    public Integer getGolesFavor() {
        return golesFavor;
    }

    public void setGolesFavor(Integer golesFavor) {
        this.golesFavor = golesFavor;
    }

    public Integer getGolesContra() {
        return golesContra;
    }

    public void setGolesContra(Integer golesContra) {
        this.golesContra = golesContra;
    }

    public Integer getPuntos() {
        return puntos;
    }

    public void setPuntos(Integer puntos) {
        this.puntos = puntos;
    }

    @Override
    public String toString() {
        return "Liga{" + "equipo=" + equipo + ", jugador=" + jugados + ", ganados=" + ganados + ", empeatados=" 
                + empeatados + ", perdidos=" + perdidos + ", golesFavor=" + golesFavor + ", golesContra=" 
                + golesContra + ", puntos=" + puntos + '}';
    }
    //este es el formato creado para el csv
        public String toCSV() {
        return equipo + ";" + jugados + ";" + ganados + ";" + empeatados + ";" + perdidos + ";" + golesFavor + ";" + golesContra + ";" + puntos;
    }
    //este es el formato creado para el html
    public String toHTML() {
        return "<tr><td>" + equipo + "</td>" + "<td>" + jugados + "</td>" + "<td>" + ganados + "</td>"
                + "<td>" + empeatados + "</td>" + "<td>" + perdidos + "</td>" + "<td>" + golesFavor + "</td>"
                + "<td>" + golesContra + "</td>" + "<td>" + puntos + "</td>";
    }
}
