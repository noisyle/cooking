<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/WEB-INF/view/admin/common/header.jsp"></jsp:include>

<div class="container-fluid">
	<div class="row">
	    <div class="col-lg-12">
	        <h1 class="page-header">菜品修改</h1>
	    </div><!-- /.col-lg-12 -->
	</div><!-- /.row -->
	<div class="row">
	    <div class="col-lg-12">
	        <div class="panel panel-default">
	            <div class="panel-heading">
	            	<div class="panel-title">菜品信息</div>
	            </div><!-- /.panel-heading -->
	            <div class="panel-body">
                    <form role="form" class="form-horizontal">
		                <input type="hidden" id="id" name="id" value="${cuisine.id}">
	                    <div class="row">
		                    <div class="col-sm-6">
		                        <div class="form-group">
		                            <label for="title" class="col-sm-4 control-label">名称</label>
		                            <div class="col-sm-8">
		                                <input class="form-control" id="name" name="name" value="${cuisine.name}" required autofocus>
		                            </div>
		                        </div>
		                    </div>
		                    <div class="col-sm-6">
		                        <div class="form-group">
		                            <label for="subtitle" class="col-sm-4 control-label">介绍</label>
		                            <div class="col-sm-8">
		                                <input class="form-control" id="intro" name="intro" value="${cuisine.intro}" required>
		                            </div>
		                        </div>
		                    </div>
		                </div>
		                <div class="row">
		                    <div class="col-sm-6">
		                        <div class="form-group">
		                            <label for="content" class="col-sm-4 control-label">分类</label>
		                            <div class="col-sm-8">
		                                <input type="hidden" class="form-control" id="catid" name="catid" value="${cuisine.catid}" required>
		                            </div>
		                        </div>
		                    </div>
		                </div>
		                <div class="row">
		                    <div class="col-sm-6">
		                        <div class="form-group">
		                            <label for="content" class="col-sm-4 control-label">关键词</label>
		                            <div class="col-sm-8">
		                                <input class="form-control" id="keyword" name="keyword" value="${cuisine.keyword}">
		                            </div>
		                        </div>
		                    </div>
		                </div>
		                <div class="row">
		                    <div class="col-sm-12">
			                    <div class="pull-right">
		                        <button class="btn btn-primary">保存菜品</button>
		                        <button type="button" class="btn btn-default" id="btnBack">返回列表</button>
		                        </div>
		                    </div>
	                    </div>
                    </form>
	   			</div><!-- /.panel-body -->
	        </div><!-- /.panel -->
	    </div><!-- /.col-lg-12 -->
	</div><!-- /.row -->
</div><!-- /.container-fluid -->

<script>
$(function() {
	$("#catid").select2({
	    placeholder: "选择一个类型",
	    minimumInputLength: 0,
	    ajax: { // instead of writing the function to execute the request we use Select2's convenient helper
	        url: "${ctx}/admin/cuisineCats",
	        dataType: 'json',
	        quietMillis: 250,
	        data: function (term, page) {
	            return {
	                q: term, // search term
	            };
	        },
	        results: function (data, page) { // parse the results into the format expected by Select2.
	            // since we are using custom formatting functions we do not need to alter the remote JSON data
	            return { results: data };
	        },
	        cache: true
	    },
	    initSelection: function(element, callback) {
	        var id = $(element).val();
	        if (id !== "") {
	            $.ajax("${ctx}/admin/cuisineCat", {
	                dataType: "json",
	                data: {id: id}
	            }).done(function(data) { if(data) callback(data); });
	        }
	    },
	    formatResult: function (row) { return row.name }, // omitted for brevity, see the source of this page
	    formatSelection: function (row) { return row.name },  // omitted for brevity, see the source of this page
	    escapeMarkup: function (m) { return m; } // we do not want to escape markup since we are displaying html in results
	});
	
	$("form").submit(function(){
		$.ajax({
			url:"${ctx}/admin/saveCuisine",
			method:"post",
			data:$("form").serializeObject(),
			dataType:"json",
			success:function(r){
				alert(r.message);
				if(r.status=="SUCCESS"){
					window.location.href="${ctx}/admin/cuisineList";
				}
			}
		});
		return false;
	});
	$("#btnBack").on("click", function(){
		window.location.href="${ctx}/admin/cuisineList";
	});
});
</script>
<jsp:include page="/WEB-INF/view/admin/common/footer.jsp"></jsp:include>
