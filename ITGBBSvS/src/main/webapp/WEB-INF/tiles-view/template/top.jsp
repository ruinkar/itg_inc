<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
div#leftMenu {
    width: 400px;
    height: 80px;
    float: left;
}

</style>

    <div id="leftMenu">
        <input type="button"
            style="width: 60px; height: 60px; background-color: hotpink" name="postButton" value="포스트형" onclick="window.location='../evinfo/list.do'" />
            <input type="button"
            style="width: 60px; height: 60px; background-color: cyan" name="mapButton" value="지도형" onclick="window.location='../evinfo/eventMap.do'" />
    </div>
    