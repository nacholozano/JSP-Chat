<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

        
        <c:set var="fechaAnti" value="0"/>
        
        <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
                url="jdbc:mysql://localhost/Chat"
                user="root"  password="usuario"/>
            
            <sql:query dataSource="${snapshot}" var="result">
                SELECT * FROM Mensajes ORDER BY id DESC LIMIT 1;
            </sql:query>
 
            <c:forEach var="row" items="${result.rows}">    
                <c:set var="ultMensaje" value="${ row.id }" scope="session"/>
            </c:forEach>
        
            <sql:query dataSource="${snapshot}" var="result">
                (SELECT * FROM Mensajes ORDER BY fecha DESC LIMIT 150) ORDER BY fecha ASC;
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

