<%@ page import="java.util.Map" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8"/>
  <title>模板</title>
  <link href="assets/css/bootstrap.min.css" rel="stylesheet"/>
  <link rel="stylesheet" href="assets/css/font-awesome.min.css"/>
  <link rel="stylesheet" href="assets/css/ace.min.css"/>
  <link rel="stylesheet" href="assets/css/ace-rtl.min.css"/>
  <link rel="stylesheet" href="assets/css/ace-skins.min.css"/>
  <script src="assets/js/ace-extra.min.js"></script>
  <script src="assets/js/jquery-2.0.3.min.js"></script>
  <script src="assets/js/bootstrap.js"></script>
  <script src="assets/js/jquery.dataTables.min.js"></script>
  <script src="assets/js/jquery.dataTables.bootstrap.js"></script>
  <%--表格js，需要单独添加--%>
  <script src="tableStyle.js"></script>
</head>
<body>
<%--用户权限判断--%>
<%
  Map<String, String> userInfo = (Map<String, String>) request.getSession().getAttribute("userInfo");
  if (userInfo == null) {
    out.println("用户的权限是anon");
//    out.write("<style> #projectManagement,#projectManagements{display:none}</style>");
  } else if (userInfo.get("permission").equals("user")) {
    out.println("用户的权限是user");
  } else if (userInfo.get("permission").equals("admin")) {
    out.println("用户的权限是admin");
  } else if (userInfo.get("permission").equals("superAdmin")) {
    out.println("用户的权限是superAdmin");
  } else {
    out.println("wrong");
  }
%>
<div class="page-content">
  <div class="tabbable">
    <%--导航栏--%>
    <ul class="nav nav-tabs padding-12 tab-color-blue background-blue" id="myTab4">
      <li class="" id="projectManagements">
        <a data-toggle="tab" href="#projectManagement">**项目管理</a>
      </li>
      <li class="active">
        <a data-toggle="tab" href="#mainFunction">主功能界面</a>
      </li>
      <li class="">
        <a data-toggle="tab" href="#wordEdit">Word编辑</a>
      </li>
      <li class="">
        <a data-toggle="tab" href="#help">使用说明</a>
      </li>
    </ul>
    <%--项目管理栏--%>
    <div class="tab-content">
      <div id="projectManagement" class="tab-pane active">
        <%if (userInfo != null && userInfo.get("permission").equals("user")) {%>
        <jsp:include page="/jsp/projectDataManagement/appData.jspf"/>
        <%} else if (userInfo != null && userInfo.get("permission").equals("admin")) {%>
        <jsp:include page="/jsp/projectDataManagement/templetData.jspf"/>
        <%}%>
      </div>
      <%--主功能界面--%>
      <div id="mainFunction" class="tab-pane active">
        <jsp:include page="/jsp/navigationBar/mainFunction.jsp"></jsp:include>
      </div>
      <%--word编辑区--%>
      <div id="wordEdit" class="tab-pane">
        <jsp:include page="/jsp/navigationBar/wordEdit.jsp"></jsp:include>
      </div>
      <%--帮助文档--%>
      <div id="help" class="tab-pane">
        <jsp:include page="/jsp/navigationBar/help.jsp"></jsp:include>
      </div>
    </div>
  </div>
</div>
</body>
</html>