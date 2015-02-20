<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
    <c:choose>
        <c:when test="${not empty param.mensaje }">
            <jsp:useBean id="mensaje" class="utiles.Mensaje">
                <jsp:setProperty name="mensaje" property="usuario" value="${userLogin}"/>
                <jsp:setProperty name="mensaje" property="mensaje" value="${param.mensaje}"/>
            </jsp:useBean>
            <c:if test="${mensaje.guardar}">
                <jsp:directive.include file="mostrarMen.jsp"/>
            </c:if>
        </c:when>
        
        <c:when test="${empty param.mensaje }">
            
            <jsp:useBean id="consultaMensajes" class="utiles.BD"/> 
            <c:set target="${consultaMensajes}" property="ultimo" value="${ultMensaje}"/>
            <c:set target="${consultaMensajes}" property="ultBD" value=""/>
            
            <c:if test="${consultaMensajes.nuevosMensajes}">
                
                <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
                url="jdbc:mysql://localhost/Chat"
                user="root"  password="usuario"/>
                <c:set var="ultMensaje" value="${ consultaMensajes.ultBD }" scope="session"/>
                <sql:query dataSource="${snapshot}" var="result" startRow="${consultaMensajes.ultBD-(consultaMensajes.ultBD-consultaMensajes.ultimo)}">
                (SELECT * FROM Mensajes ORDER BY fecha DESC) ORDER BY fecha ASC;
            </sql:query>
                
            <c:forEach var="row" items="${result.rows}">
                
                <fmt:formatDate var="fechaNueva" type="date" timeStyle="full" dateStyle="full" value="${row.fecha}"/>
                
                <c:if test="${ fechaAnti != fechaNueva }">
                    <fmt:formatDate var="fechaAnti" type="date" timeStyle="full" dateStyle="full" value="${row.fecha}"/>
                    <c:set var="fechaMensaje" value="${ row.fecha }"/>
                    <div class="fechaMensaje col-md-8 col-xs-10 col-md-offset-5 col-xs-offset-3">
                        <fmt:formatDate type="date" timeStyle="full" dateStyle="full" value="${row.fecha}"/>
                    </div>
                </c:if>
                
                <div class="mensaje col-md-7 col-xs-7 <c:if test="${row.nick==userLogin}"><c:out value="col-xs-offset-6 col-md-offset-6"/></c:if>">
                <p>
                    <c:if test="${row.nick!=userLogin}">
                        <b><c:out value="${row.nick}"/></b><br>
                    </c:if>
                    
                    <c:out value="${row.mensaje}"/>
                    <br><br>
                    <span class="horaMensaje pull-right">
                        <fmt:formatDate type="time" pattern="HH:mm:ss" timeStyle="medium" dateStyle="medium" value="${row.fecha}"/>
                    </span>
                </p>
                </div>
            
            </c:forEach>
            
            </c:if>
        
        </c:when>
    
    </c:choose>