<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/WEB-INF/view/admin/common/header.jsp"></jsp:include>

<div class="container-fluid">
	<div class="row">
	    <div class="col-lg-12">
	        <h1 class="page-header">菜品信息管理</h1>
	    </div><!-- /.col-lg-12 -->
	</div><!-- /.row -->
	<div class="row">
	    <div class="col-lg-12">
	        <div class="panel panel-default">
	            <div class="panel-heading">
			        <div class="btn-group btn-group-sm pull-right" role="group" aria-label="...">
			          <button type="button" class="btn btn-default" id="btnAdd">新增菜品</button>
			          <button type="button" class="btn btn-default" id="btnReload">刷新列表</button>
			        </div>
			        <div class="panel-title">菜品列表</div>
	            </div><!-- /.panel-heading -->
	            <div class="panel-body">
		            <table id="table" class="table table-hover table-striped table-bordered table-condensed" cellspacing="0" width="100%">
		              <thead>
		                <tr>
		                  <th>名称</th>
		                  <th>介绍</th>
		                  <th>关键字</th>
		                  <th>类型</th>
		                  <th>添加时间</th>
		                  <th></th>
		                </tr>
		              </thead>
		            </table>
	   			</div><!-- /.panel-body -->
	        </div><!-- /.panel -->
	    </div><!-- /.col-lg-12 -->
	</div><!-- /.row -->
</div><!-- /.container-fluid -->

<script>
var table;
$(function() {
	table = $('#table').DataTable({
		ajax : {
			url: '${ctx}/admin/cuisineList'
		},
		serverSide: true,
		columns : [
			{data : "name"},
			{data : "intro"},
			{data : "keyword"},
			{data : "catid"},
			{data : "time", type: "date"},
			{data : "id"}
		],
        columnDefs: [{
	        targets: -2,
	        render: function (data, type, row, meta) {
	            return new Date(data).format("yyyy-MM-dd hh:mm:ss");
	        }
	    },{
	        targets: -1,
	        render: function (a, b, c, d) {
	            var html = " ";
	            html += '<button type="button" class="btn btn-primary btn-xs" onclick="view(\'' + c.id + '\')">修改</button> ';
	            html += '<button type="button" class="btn btn-danger btn-xs" data-id="'+c.id+'" onclick="del(this)">删除</button> ';
	            return html;
	        }
	    }]
	});
	
	$("#btnAdd").on("click", function(){
		window.location.href="${ctx}/admin/addCuisine";
	});
	
	$("#btnReload").on("click", function(){
		table.ajax.reload(null, false);
	});
	
});

function view(id){
	window.location.href="${ctx}/admin/viewCuisine?id="+id;
}

function del(obj){
	$.ajax({
		url:"${ctx}/admin/delCuisine",
		method:"post",
		data:$(obj).data(),
		dataType:"json",
		success:function(r){
			alert(r.message);
			if(r.status=="SUCCESS"){
				table.ajax.reload(null, false);
			}
		}
	});
	return false;
}
</script>
<jsp:include page="/WEB-INF/view/admin/common/footer.jsp"></jsp:include>
