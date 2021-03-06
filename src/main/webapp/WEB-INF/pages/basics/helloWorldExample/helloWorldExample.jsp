<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="lt" tagdir="/WEB-INF/tags/layout" %>
<%@taglib prefix="wg" tagdir="/WEB-INF/tags/widget" %>
<%@taglib prefix="code-example" tagdir="/WEB-INF/tags/application/basics/hello-world-example" %>
<%@taglib prefix="app" tagdir="/WEB-INF/tags/application" %>

<c:url var="helloWorldUrl" value="https://reactjs.org/redirect-to-codepen/hello-world"/>
<c:url var="installationUrl" value="/introduction/installation"/>

<a name="pageStart"></a>
<lt:layout cssClass="black-line"/>
<lt:layout cssClass="page hello-world-example-page">
    <h1>2.2 Hello, World!</h1>

    <wg:p>Самый простой путь начать использовать React состоит в том, что сперва нужно ознакомиться с
        <wg:link href="${helloWorldUrl}">данным примером «Hello, World!»</wg:link>.
        В этом случае нет необходимости что-либо устанавливать: достаточно просто открыть этот пример в новой
        вкладке. Далее следует продолжать знакомиться с примерами, приведенными в следующих разделах.
        Если же вы предпочитаете использовать локальную среду разработки,
        то вам следует изучить <wg:link href="${installationUrl}">главу «Установка»</wg:link>.</wg:p>

    <wg:p>Самый маленький пример на React имеет следующий вид:</wg:p>

    <code-example:code-example-1/>

    <wg:p>Он отрисовывает заголовок на странице, выводя «Hello, world!».</wg:p>

    <wg:p>Последующие разделы будут постепенно знакомить вас с React. Мы рассмотрим
        строительные блоки приложения React: элементы и компоненты. Однажды овладев ими, вы сможете
        создавать сложные приложения из маленьких переиспользуемых частей.</wg:p>
</lt:layout>

<c:url var="prevPageUrl" value="note-to-javascript"/>
<c:url var="nextPageUrl" value="introduction-to-jsx"/>
<app:page-navigate prevPageUrl="${prevPageUrl}"
                   pageStartAncor="pageStart"
                   nextPageUrl="${nextPageUrl}"/>