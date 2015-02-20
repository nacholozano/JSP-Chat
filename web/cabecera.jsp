<%-- 
    Document   : cabecera
    Created on : 26-ene-2015, 9:09:27
    Author     : usuario
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script>

</script>
        
    </head>
    <body>
        
        <!-- Forma parte del ejercicio 2 -->
        <div class="row cabecera">
        
        <div class="col-md-10 col-md-offset-1">    
                
            <h2 class="col-md-6 welcome">Bienvenid@ <c:out value="${userLogin}"/></h2>
            
            <div class=" pull-right formCerrar">
                <form action="index.jsp" method="POST">
                    <input name="cerrar" type="hidden" value="cerrar">
                    <button class="btn btn-default" type="submit">Cerrar sesión</button>
                </form>
            </div>
            
        </div>
        
        </div>
        
    </body>
</html>
