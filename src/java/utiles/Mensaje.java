package utiles;

import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Mensaje {
    
   private String usuario;
   private String mensaje;
   private String fechaYHora;
   
   public  Mensaje(){

   }
   
   //método para guardar el mensaje
   public boolean isGuardar() throws SQLException {
       
       BD conexion = new BD();
       conexion.conectar("root","usuario","jdbc:mysql://localhost/Chat");
       
       try {
           java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
           
           this.fechaYHora = date.toString();
           
           PreparedStatement stm;
           stm = conexion.getConn().prepareStatement("INSERT INTO Mensajes(mensaje,nick,fecha) VALUES (?,?,?)");
           stm.setString(1, mensaje);
           stm.setString(2, usuario);
           stm.setTimestamp(3, date);
           stm.executeUpdate();
       } catch (SQLException ex) {
           Logger.getLogger(Mensaje.class.getName()).log(Level.SEVERE, null, ex);
           throw ex;
       }
       
       conexion.desconectar();
       return true;
   }
   
   public void setMensaje(String mensaje){
       this.mensaje = mensaje;
   }
   
   public String getMensaje(){
       return this.mensaje;
   }
   
   public String getFechaYHora(){
       return this.fechaYHora;
   }
   
   public void setFechaYHora(String fecha){
       this.fechaYHora = fecha;
   }
   
   public String getUsuario(){
       return this.usuario;
   }
   
   public void setUsuario(String usuario){
       this.usuario = usuario;
   }
   
}