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
<div class="page-content">
  <div class="tabbable">
    <ul class="nav nav-tabs padding-12 tab-color-blue background-blue" id="myTab4">
      <li class="active">
        <a data-toggle="tab" href="#projectManagement">**项目管理</a>
      </li>
      <li class="">
        <a data-toggle="tab" href="#mainFunction">主功能界面</a>
      </li>
      <li class="">
        <a data-toggle="tab" href="#wordExport">Word导出</a>
      </li>
      <li class="">
        <a data-toggle="tab" href="#help">使用说明</a>
      </li>
    </ul>

    <div class="tab-content">
      <div id="projectManagement" class="tab-pane active">
        <div style=" padding-bottom: 10px;">
          <%--功能按钮--%>
          <button class="btn btn-xs">
            <i class="icon-bolt bigger-110"></i>
            新建项目
          </button>
        </div>

        <div class="table-responsive">
          <div id="sample-table-2_wrapper" class="dataTables_wrapper" role="grid">
            <div class="row">
              <div class="table-responsive">
                <table id="sample-table-2" class="table table-striped table-bordered table-hover">
                  <thead>
                  <tr>
                    <th class="center">
                      <label>
                        <input type="checkbox" class="ace"/>
                        <span class="lbl"></span>
                      </label>
                    </th>
                    <th>序号</th>
                    <th>项目名</th>
                    <th>时间</th>
                    <th></th>
                  </tr>
                  </thead>
                  <tbody role="alert" aria-live="polite" aria-relevant="all">
                  <tr>
                    <td class="center">
                      <label>
                        <input type="checkbox" class="ace"/>
                        <span class="lbl"></span>
                      </label>
                    </td>
                    <td>1</td>
                    <td>DMAIC中的思维导图</td>
                    <td>Feb 12</td>
                    <td>
                      <div class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
                        <a class="blue" href="#">
                          <i class="icon-zoom-in bigger-130"></i>
                        </a>
                        <a class="red" href="#">
                          <i class="icon-trash bigger-130"></i>
                        </a>
                      </div>
                    </td>
                  </tr>
                  <tr>
                    <td class="center">
                      <label>
                        <input type="checkbox" class="ace"/>
                        <span class="lbl"></span>
                      </label>
                    </td>
                    <td>1</td>
                    <td>DMAIC中的直方图</td>
                    <td>Feb 12</td>
                    <td>
                      <div class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
                        <a class="blue" href="#">
                          <i class="icon-zoom-in bigger-130"></i>
                        </a>
                        <a class="red" href="#">
                          <i class="icon-trash bigger-130"></i>
                        </a>
                      </div>
                    </td>
                  </tr>
                  <tr>
                    <td class="center">
                      <label>
                        <input type="checkbox" class="ace"/>
                        <span class="lbl"></span>
                      </label>
                    </td>
                    <td>2</td>
                    <td>DMAIC中的柏拉图</td>
                    <td>Feb 12</td>
                    <td>
                      <div class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
                        <a class="blue" href="#">
                          <i class="icon-zoom-in bigger-130"></i>
                        </a>
                        <a class="red" href="#">
                          <i class="icon-trash bigger-130"></i>
                        </a>
                      </div>
                    </td>
                  </tr>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>
      </div>

      <div id="mainFunction" class="tab-pane">
        <p>程序的操作区域，自定义</p>
      </div>
      <div id="wordExport" class="tab-pane">
        <p>word编辑区域</p>
      </div>
      <div id="help" class="tab-pane">
        <p>帮助文档</p>
      </div>
    </div>
  </div>
</div>
<%
  Map<String, String> userInfo = (Map<String, String>) request.getSession().getAttribute("userInfo");
  if (userInfo.get("username") == null) {
    out.println("有户名是空");
  } else if (userInfo.get("username") != null && userInfo.get("permission").equals("user")) {
    out.println("用户的权限是user");
  }else if (userInfo.get("username") != null && userInfo.get("permission").equals("admin")) {
    out.println("用户的权限是admin");
  } else if (userInfo.get("username") != null && userInfo.get("permission").equals("superAdmin")) {
    out.println("用户的权限是superAdmin");
  }else {
     out.println("wrong");
  }
//  String permission = userInfo.get("permission");
//  out.println("用户名是：" + userInfo.get("username"));
%>
<%--<script src="userPermission.js"></script>--%>
</body>
</html>