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
//creamos y encapsulamos todo lo que necesitamos
    private String dia;//dia con un String por que es lunes,martes,etc es decir palabras
    private Integer hora;//hora es un Integer por que es un numero
    private String duracion;//duracion es un String por que es mediahora o unahora
    private String participantes;//participantes es un String por que son personas es decir palabras

    //creamos el contructor añadiendo las correspondientes variables ej: String dia
    public Reunion(String dia, Integer hora, String duracion, String participantes) {
        this.setDia(dia);//esto comprueba el setDia
        this.setHora(hora);// esto comprueba el setHora
        this.duracion = duracion.toLowerCase();//aqui le decimos que duracion siempre tiene 
        //que ser en minusculas para que funcione nuestro metodo sin depender de lo que introduzca el usuario
        this.participantes = participantes;//a participantes no le ponemos tolowercase ya que la persona tiene la primera letra en mayuscula
    }
//creamos el metodo findeReunion con un void ya que no queremos que regrese nada
    public void finReunion() {
        if (duracion.equals("mediahora")) {//este if se encarga de que si duracion es igual a mediahora
            System.out.println("La reunion termino a las " + hora + " y media.");//nos dice la hora de fin de reunion
        } else if (duracion.equals("unahora")) {//este otro si la reunion dura unahora
            int tiempo = hora + 1;//nos crea la variable tiempo que es la hora mas una hora mas
            System.out.println("La reunion termino a las " + tiempo);// y nos muestra la duraccion de la reunion
        }
    }
//creamos el metodo recordatorioReunion con un void ya que no queremos que regrese nada
    public void recordatorioReunion() {
        //este metodo es como el toString ya que nos regresa los datos de la reunion con un mensaje
        //en este caso de recordatorio
        System.out.println("Tiene una reunion el " + dia + " a las " + hora + " con " + participantes + " durante " + duracion);
    }
//ahora creamos los getter y los setter y vamos a cambiar el sethora y set dia
    public String getDia() {
        return dia;
    }

    public void setDia(String dia) {//el setdia se encarga con un switch de que si dia no es:
        //ni lunes, ni martes, ni miercoles, ni jueves, ni viernes nos dira que el dia tiene que ser uno de estos
        //y si lo es nos dara el dia sin problemas
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

    public void setHora(Integer hora) {//El setHora se encarga de que si la hora no esta entre las 8 y las 17
        //este nos lanzara un mensaje de error de que la hora tienen que ser entre estas
        //y si lo son nos dara la hora sin problema
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
    //los getter y los setter se crean ya que hemos encapsulado nuestros datos
//Y por ultimo creamos el toString que nos muestra los datos en el mein si se lo pedimos.
    @Override
    public String toString() {
        return "Reunion{" + "dia=" + dia + ", hora=" + hora + ", duracion=" + duracion + ", participantes=" + participantes + '}';
    }

}
