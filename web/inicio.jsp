<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <jsp:directive.include file="head.jsp"/>
        <script src="gestionMensajes.js"></script>
    </head>
    
    <body onload="enviar()">
        
        <div class="container-fluid">
        <!-- Ejercicio 2 boletín 3 --> 
            
            <jsp:directive.include file="cabecera.jsp" />
            
            <c:set var="ultMensaje" scope="session" value="0"/>
            <%-- <c:out value="Primer valor de ultimo mensaje: ${ultMensaje}"/> --%>
            
            <div class="row conversacion">
                <div id="chat" class="chat col-md-10 col-md-offset-1">

                </div>
            </div>

            <div class="row envio">
                <div class="subenvio col-md-10 col-md-offset-1">
                <div class="input-group">
                    <input class="form-control" placeholder="Mensaje ..." type="text" id="texto" name="texto"/>
                    <span class="input-group-btn">
                        <button class="btn btn-default" id="enviar" onclick="enviar()" disabled="true">Enviar</button>
                    </span>
                </div>
                </div>
            </div>
            
        </div>
        
    </body>
</html>
