package utiles;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

public class BD {
   private static Connection conn = null;
   private int ultimo = 0;
   private int ultBD = 0;
   
   public BD(){
       
   }
   
   public int getUltBD(){
       return this.ultBD;
   }
   
   public void setUltBD( int ultBD ) throws SQLException{
       
        BD conexion = new BD();
        conexion.conectar("root","usuario","jdbc:mysql://localhost/Chat");

        Statement stm;
        stm = conn.createStatement();

      String sql = "SELECT id FROM Mensajes ORDER BY id DESC LIMIT 1";
      try (ResultSet rs = stm.executeQuery(sql)) {
        rs.next();
        this.ultBD = rs.getInt("id");
      }
      
      conexion.desconectar();
   }
   
   public int getUltimo(){
       return this.ultimo;
   }
   
   public void setUltimo(int ultimo){
       this.ultimo = ultimo;
   }
   
   public Connection getConn(){
       return conn;
   }
   
   public boolean isNuevosMensajes() throws SQLException{
       boolean nuevos = false;
           
       if ( this.ultBD > this.ultimo ){
            nuevos = true;
       } 

       return nuevos;
   }
   
   public void conectar(String user,String pass,String dburl) {
       try {
           //Cargamos el driver
           Class.forName("com.mysql.jdbc.Driver");
           //url base de datos
           String url = dburl;
           //Creamos la conexión
           
           conn = DriverManager.getConnection(dburl, user, pass);

       } catch (ClassNotFoundException | SQLException ex) {
           Logger.getLogger(BD.class.getName()).log(Level.SEVERE, null, ex);
       }
       
   }
   
   public void desconectar(){
       try {
           conn.close();
       } catch (SQLException ex) {
           Logger.getLogger(BD.class.getName()).log(Level.SEVERE, null, ex);
       }
   }
   
}
