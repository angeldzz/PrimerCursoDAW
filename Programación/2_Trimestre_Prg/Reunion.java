/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ejercicio4_examen;

/**
 *
 * @author zx23student3283
 */
public class Reunion {

    private String dia;
    private Integer hora;
    private String duracion;
    private String participantes;

    public Reunion(String dia, Integer hora, String duracion, String participantes) {
        this.setDia(dia);
        this.setHora(hora);
        this.duracion = duracion.toLowerCase();
        this.participantes = participantes.toLowerCase();
    }

    public void finReunion() {
        if (duracion.equals("mediahora")) {
            System.out.println("La reunion termino a las " + hora + " y media.");
        } else if (duracion.equals("unahora")) {
            int tiempo = hora + 1;
            System.out.println("La reunion termino a las " + tiempo);
        }
    }

    public void recordatorioReunion() {
        System.out.println("Tiene una reunion el " + dia + " a las " + hora + " con " + participantes + " durante " + duracion);
    }

    public String getDia() {
        return dia;
    }

    public void setDia(String dia) {
        switch (dia.toLowerCase()) {
            case "lunes":
                this.dia = dia;
                break;
            case "martes":
                this.dia = dia;
                break;
            case "miercoles":
                this.dia = dia;
                break;
            case "jueves":
                this.dia = dia;
                break;
            case "viernes":
                this.dia = dia;
                break;
            default:
                throw new IllegalArgumentException("El dia no puede ser otro que lunes, martes, miercoles, jueves y viernes");
        }
    }

    public Integer getHora() {
        return hora;
    }

    public void setHora(Integer hora) {
        if (hora<8 || hora>17) {
            throw new IllegalArgumentException("las horas de la reunion estan entre 8 y 17");
        }else{
        this.hora=hora;
        }
    }

    public String getDuracion() {
        return duracion;
    }

    public void setDuracion(String duracion) {
        this.duracion = duracion;
    }

    public String getParticipantes() {
        return participantes;
    }

    public void setParticipantes(String participantes) {
        this.participantes = participantes;
    }

    @Override
    public String toString() {
        return "Reunion{" + "dia=" + dia + ", hora=" + hora + ", duracion=" + duracion + ", participantes=" + participantes + '}';
    }

}
