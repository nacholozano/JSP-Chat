package utiles;

import java.sql.*;

public class Usuario {
   private String pass;
   private String nick;
   
   // <editor-fold defaultstate="collapsed" desc="getter & setter">
   
   public Usuario(){
       
   }
   
   public Usuario( int id,String nick, String nombre, String apellidos, String departamento, String pass,String tipo ){
      this.nick = nick;
      this.pass = pass; 
   }
   
   public boolean isExisteLogin() throws SQLException{
      boolean existe = false;
      BD conectar = new BD();
      conectar.conectar("root","usuario","jdbc:mysql://localhost/Chat");
      
      String sql = "SELECT nick,pass FROM Usuarios WHERE nick='"+this.nick+"' AND pass='"+this.pass+"'";
      Statement stmt = conectar.getConn().createStatement();
      ResultSet rs = stmt.executeQuery(sql);
      
      if(rs.next()){
        existe = true;  
      }
      
      rs.close();
      conectar.desconectar();
      
      return existe;
   }
   
   public boolean isExisteSign() throws SQLException{
      boolean existe = false;
      BD conectar = new BD();
      conectar.conectar("root","usuario","jdbc:mysql://localhost/Chat");
      
      String sql = "SELECT nick,pass FROM Usuarios WHERE nick='"+this.nick+"'";
      Statement stmt = conectar.getConn().createStatement();
      ResultSet rs = stmt.executeQuery(sql);
      
      if(rs.next()){
        existe = true;  
      }
      
      rs.close();
      conectar.desconectar();
      
      return existe;
   }
   
   public boolean isGuardar() throws SQLException{
      boolean guardado = true;
      BD conectar = new BD();
      conectar.conectar("root","usuario","jdbc:mysql://localhost/Chat");
      
      String sql = "INSERT INTO Usuarios(nick,pass) VALUES ('"+this.nick+"','"+this.pass+"')";
      Statement stmt = conectar.getConn().createStatement();
      stmt.executeUpdate(sql);
      
      conectar.desconectar();
      return guardado;
   }
   
   public void setNick(String nick){
       this.nick = nick;
   }
   
   public String getNick(){
       return this.nick;
   }
   
   public void setPass(String pass){
        this.pass = pass;
   }
   
   public String getPass(){
        return pass;
   }
   // </editor-fold>
}
