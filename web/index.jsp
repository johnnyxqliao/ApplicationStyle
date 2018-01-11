<%--<%@ page import="java.util.Map" %>--%>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
  //  服务器路径
//  String sourcePath = "http://innovation.xjtu.edu.cn/webresources/ace-master/assets";
  // 本地路径
  String sourcePath = "assets";
%>
<html lang="en">
<head>
  <title>创新方法工作平台</title>
  <meta name="description" content="overview &amp; stats"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <%--前台样式css（必须）--%>
  <link rel="stylesheet" href="<%=sourcePath%>/css/bootstrap.min.css"/>
  <link rel="stylesheet" href="<%=sourcePath%>/css/ace.min.css"/>
  <link rel="stylesheet" href="<%=sourcePath%>/font-awesome/4.5.0/css/font-awesome.min.css"/>
  <link rel="stylesheet" href="<%=sourcePath%>/css/ace-rtl.min.css"/>
  <link rel="stylesheet" href="<%=sourcePath%>/css/ace-skins.min.css"/>
  <link rel="stylesheet" href="<%=sourcePath%>/css/fonts.googleapis.com.css"/>
  <%--前台样式js（必须）--%>
  <script type="text/javascript" src="<%=sourcePath%>/js/ace-extra.min.js"></script>
  <script type="text/javascript" src="<%=sourcePath%>/js/jquery-2.1.4.min.js"></script>
  <script type="text/javascript" src="<%=sourcePath%>/js/ace.min.js"></script>
  <script type="text/javascript" src="<%=sourcePath%>/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="<%=sourcePath%>/js/jquery.dataTables.min.js"></script>
  <script type="text/javascript" src="<%=sourcePath%>/js/jquery.dataTables.bootstrap.min.js"></script>
  <script type="text/javascript" src="<%=sourcePath%>/js/jquery-ui.custom.min.js"></script>
  <script type="text/javascript" src="<%=sourcePath%>/js/jquery.ui.touch-punch.min.js"></script>
  <script type="text/javascript" src="<%=sourcePath%>/js/jquery.easypiechart.min.js"></script>
  <script type="text/javascript" src="<%=sourcePath%>/js/jquery.sparkline.index.min.js"></script>
  <script type="text/javascript" src="<%=sourcePath%>/js/jquery.flot.min.js"></script>
  <script type="text/javascript" src="<%=sourcePath%>/js/jquery.flot.pie.min.js"></script>
  <script type="text/javascript" src="<%=sourcePath%>/js/jquery.flot.resize.min.js"></script>
  <script type="text/javascript" src="<%=sourcePath%>/js/ace-elements.min.js"></script>
  <%--需要单独添加的js、css--%>
  <script type="text/javascript" src="./js/buttonAction.js"></script>
  <script type="text/javascript" src="./js/logout.js"></script>
  <script type="text/javascript" src="./js/resultReport.js"></script>
  <link rel="stylesheet" href="css/Extra.css"/>
</head>
<body class="no-skin">
<%@include file="jsp/jspf/banner.jspf" %>
<div class="main-container ace-save-state" id="main-container">
  <%--侧边栏--%>
  <%@include file="jsp/jspf/sideBar.jspf" %>
  <%--功能显示区--%>
  <div class="main-content">
    <div class="breadcrumbs ace-save-state" id="breadcrumbs">
      <ul class="breadcrumb">
        <li>
          <i class="ace-icon fa fa-home home-icon"></i>
          <a href="#" style="font-weight: bold">创新方法工具平台</a>
        </li>
        <li class="active">此处改为app名字</li>
      </ul>
    </div>
    <div class="tab-content">
      <%--主功能区--%>
      <div id="mainFunction" class="tab-pane">
        <%@include file="/jsp/navigationBar/mainFunction.jspf" %>
      </div>
      <%--项目管理--%>
      <%
        if (userInfo == null) {
          out.write("<style> " +
                "#projectManagement,#projectManagementBar,#saveProject" +
                "{display:none}" +
                "</style>");
          out.write("<script>" +
                "console.log('demo');" +
                "$('#mainFunction').addClass('active');" +
                "$('#mainId').addClass('active');" +
                "</script>");
        }
      %>
      <div id="projectManagement" class="tab-pane active">
        <div id="table-position">
          <div class="btn-group btn-group-sm">
            <button id="buttonNew" class="btn btn-success" data-toggle="modal" data-target="#newProjectModal">
              <span class="menu-icon fa fa-folder"></span>新建项目
            </button>
          </div>
          <%@include file="jsp/jspf/tableData.jspf" %>
        </div>
      </div>
      <%--word编辑区--%>
      <div id="wordEdit" class="tab-pane">
        <%@include file="/jsp/navigationBar/wordEdit.jspf" %>
      </div>
      <%--帮助文档--%>
      <div id="help" class="tab-pane">
        <%@include file="/jsp/navigationBar/help.jspf" %>
      </div>
    </div>
  </div>
  <%@include file="jsp/jspf/copyright.jspf" %>
</div>
<%@include file="jsp/jspf/modalFrame.jspf" %>
</body>
</html>