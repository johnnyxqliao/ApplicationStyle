// 表格初始化
$(document).ready(function () {
  $('#sample').DataTable({
    "order": [[2, "desc"]]
  });
});

// 移除项目函数
function removeProject() {
  var table = $('#sample').DataTable();
  $("input[name='checkBox']:checked").each(function () { // 遍历选中的checkbox
    table.row($(this).parents("tr")).remove().draw(false);
  });
}

// 添加项目函数
function addProject() {
  var t = $('#sample').DataTable();
  var counter = 1;
  t.row.add([
    counter + '.1',
    counter + '.2',
    counter + '.3',
    counter + '.4',
    counter + '.5'
  ]).draw(false);
}