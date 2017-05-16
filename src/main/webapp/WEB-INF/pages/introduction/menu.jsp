<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="lt" tagdir="/WEB-INF/tags/layout" %>
<%@taglib prefix="wg" tagdir="/WEB-INF/tags/widget" %>

<c:url var="introductionInReactJSUrl" value="introduction-in-reactjs"/>
<c:url var="installationUrl" value="installation"/>
<c:url var="devToolsUrl" value="devtools"/>

<lt:layout cssClass="menu-sidebar">
    <div class="black-line"></div>
    <nav class="menu-sidebar__nav">
        <ul class="menu-sidebar__nav-links nav nav-pills nav-stacked">
            <li class="menu-sidebar__nav-link">
                <a href="${introductionInReactJSUrl}">Введение в React JS</a>
            </li>
            <li class="menu-sidebar__nav-link active">
                <a href="${installationUrl}">Установка</a>
            </li>
            <li class="menu-sidebar__nav-link">
                <a href="${devToolsUrl}">Инструменты разработчика</a>
            </li>
        </ul>
    </nav>
</lt:layout>
