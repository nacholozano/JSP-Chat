<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:directive.include file="head.jsp"/>
    </head>
        
        <c:if test="${ not empty param.cerrar }">
            <c:remove var="userLogin"/>
        </c:if>

    <div class="container-fluid">
    
        <div class="row rowTitulo">
            
            <div class="titulo col-md-10 col-md-offset-1">Chat</div>
            
        </div>
        
        <div class="row">
        
        <div class="col-md-5 col-md-offset-1">    
            
        <div class="panel panel-default ">
            <div class="panel-heading">Login</div>
            <div class="panel-body">

            <form action="index.jsp" method="POST" class="form-horizontal">
                <div class="form-group col-md-12">
                    <label for="usuLog" class="control-label"> Usuario </label>
                    <input id="usuLog" class="form-control" type="text" name="user" required>
                </div>

                <div class="form-group col-md-12">
                    <label for="passLog" class="control-label">Contraseña</label>
                    <input id="passLog" class="form-control" type="password" name="pass" required>
                </div>

                <div class="form-group col-md-11">
                <button type="submit" class="btn btn-default">Entrar</button>
                </div>

            </form>

            </div>
        </div>
    
        <!--Ejercicio 1 Boletin 3 -->
        
        <c:if test="${not empty param.user}">
            
            <jsp:useBean id="usuLogin" class="utiles.Usuario">
                <jsp:setProperty name="usuLogin" property="nick" param="user"/>
                <jsp:setProperty name="usuLogin" property="pass" param="pass"/>
            </jsp:useBean>
            
            <c:if test="${usuLogin.existeLogin}">
                <c:redirect url="inicio.jsp" >
                    <c:set var="userLogin" value="${param.user}" scope="session"/>
                </c:redirect>
            </c:if>
            
            <c:if test="${!(usuLogin.existeLogin)}">
                <p class="alert alert-danger">
                    <c:out value="Datos incorrectos"/>
                </p>
            </c:if>
            
        </c:if>
            
        </div>
            
        <div class="col-md-5">   
            
        <div class="panel panel-default ">
            <div class="panel-heading">Registro</div>
            <div class="panel-body">
        
            <form action="index.jsp" method="POST" class="form-horizontal">
                <div class="form-group col-md-12">
                    <label for="usuSign" class="control-label">Usuario</label>
                    <input id="usuSign" class="form-control" type="text" name="newUser" required>
                </div>
                <div class="form-group col-md-12">
                    <label for="passSign" class="control-label">Contraseña</label>
                    <input id="passSign" class="form-control" type="password" name="newPass" required>
                </div>
                
                <div class="form-group col-md-11">
                    <button type="submit" class="btn btn-default">Registrar</button>
                </div>
            </form>
                
            </div>
        </div>
            
        <c:if test="${not empty param.newUser}">
            
            <jsp:useBean id="usuSign" class="utiles.Usuario">
                <jsp:setProperty name="usuSign" property="nick" param="newUser"/>
                <jsp:setProperty name="usuSign" property="pass" param="newPass"/>
            </jsp:useBean>
            
            <c:if test="${usuSign.existeSign}">
                <p class="alert alert-danger">
                    <c:out value="Ese usuario ya existe"/>
                </p>
            </c:if>
            
            <c:if test="${!(usuSign.existeSign)}">
                <c:if test="${usuSign.guardar}">
                    <p class="alert alert-success">
                        <c:out value="El usuario ${param.userSign} ha sido creado"/>
                    </p>
                </c:if>
                
                <%-- otra forma 
                    <c:set target="${ [id del bean] }" property="guardar" value="true">
                --%>
            </c:if>
            
        </c:if>
        
        </div>
        
        </div>
        
    </div>    
        
</html>
