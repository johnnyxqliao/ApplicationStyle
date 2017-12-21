<%@ page import="java.util.Map" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
<head>
  <title>模板</title>
  <%--css--%>
  <link href="assets/css/bootstrap.min.css" rel="stylesheet"/>
  <link rel="stylesheet" href="assets/css/ace.min.css"/>
  <link rel="stylesheet" href="assets/css/font-awesome.min.css"/>
  <link rel="stylesheet" href="assets/css/ace-rtl.min.css"/>
  <link rel="stylesheet" href="assets/css/ace-skins.min.css"/>
  <%--js--%>
  <script src="assets/js/ace-extra.min.js" type="text/javascript"></script>
  <script src="assets/js/jquery-2.0.3.min.js" type="text/javascript"></script>
  <script src="assets/js/ace.min.js" type="text/javascript"></script>
  <script src="assets/js/bootstrap.min.js" type="text/javascript"></script>
  <script src="//cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js" type="text/javascript"></script>
  <script src="assets/js/jquery.dataTables.bootstrap.js" type="text/javascript"></script>
  <%--需要单独添加的js、css--%>
  <script src="tableStyle.js" type="text/javascript"></script>
  <script src="buttonAction.js" type="text/javascript"></script>
  <link rel="stylesheet" href="css/TablePosition.css"/>
</head>
<body>
<%--用户权限判断--%>
<%
  Map<String, String> userInfo = (Map<String, String>) request.getSession().getAttribute("userInfo");
  if (userInfo == null) {
    out.write("<style> #projectManagement,#projectManagementBar,#saveProject{display:none}</style>");
  }
%>

<div class="main-container">
  <div class="main-container-inner">
    <%--侧边栏--%>
    <%@include file="./jsp/sideBar.jspf" %>
    <%--功能显示区--%>
    <div class="main-content">
      <div class="breadcrumbs" id="breadcrumbs">
        <ul class="breadcrumb">
          <li>
            <i class="icon-home home-icon"></i>
            <a href="#">Home</a>
          </li>
        </ul>
      </div>
      <div class="tab-content">
        <%--项目管理--%>
        <div id="projectManagement" class="tab-pane">
          <div id="table-position">
            <div id="button-position">
              <button class="btn btn-success" data-toggle="modal"  id="asd" onclick="addProject()">新建项目</button>
              <button class="btn btn-success" data-toggle="modal" data-target="#deleteProject">删除项目</button>
            </div>
            <%if (userInfo != null && userInfo.get("permission").equals("user")) {%>
            <%@include file="./jsp/projectDataManagement/appData.jspf" %>
            <%} else if (userInfo != null && userInfo.get("permission").equals("admin")) {%>
            <%@include file="./jsp/projectDataManagement/templetData.jspf" %>
            <%}%>
          </div>
        </div>
        <%--主功能区--%>
        <div id="mainFunction" class="tab-pane active">
          <jsp:include page="/jsp/navigationBar/mainFunction.jsp"/>
        </div>
        <%--word编辑区--%>
        <div id="wordEdit" class="tab-pane">
          <jsp:include page="/jsp/navigationBar/wordEdit.jsp"/>
        </div>
        <%--帮助文档--%>
        <div id="help" class="tab-pane">
          <jsp:include page="/jsp/navigationBar/help.jsp"/>
        </div>
      </div>
    </div>
  </div>
</div>
<%@include file="./jsp/modalFrame.jspf" %>
</body>
</html>