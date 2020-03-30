<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>药品库存</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/plugin/sweetalert/resource/css/sweetalert2.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/plugin/sweetalert/resource/css/mui.min.css" />
<%@ include file="/common/commoncss.jsp" %>
<%@ include file="/common/commonjs.jsp" %>
</head>
<body> 
<div id="toolbar" style="float: left;width: 100%;">
        <button id="btn_add" type="submit" class="btn btn-default">
           <span class="glyphicon glyphicon-plus" style="color: rgb(0, 0, 0); font-size: 16px;margin-top: -5px;">&nbsp;添加</span>
        </button>
</div>
  <table id="table">
</table>
<script type="text/javascript">
  $(function(){
	  $('#table').bootstrapTable({
		  url: '${pageContext.request.contextPath}/DrugStorage/getAllDrugStorage.action',//访问后台（json）的地址
		  pagination: true,//允许分页
		  search: true,//可以搜索
		  pageSize:3,//每页显示3条数据
		  pageList:[2,3,5,8,10],//每页显示的条数列表
		  showColumns:true,//选择显示的列
		  showRefresh:true,//允许刷新
		  showExport:true,//允许导出
		  exportDataType:'all',
		  exportTypes:['txt','doc','excel'],
		  columns: [
		  {
		    field: 'drugstorageid',//字段名称    对应json中的key
		    align: 'center',
		    valign:'middle',
		    title: '编号'
		  },{
		    field: 'drugs.drugsname',
		    align: 'center',
		    valign:'middle',
		    title: '药品名称'
		  },{
		    field: 'snumber',
		    align: 'center',
		    valign:'middle',
		    title: '剩余数量/盒'
		  },{
		    field: 'user.username',
		    align: 'center',
		    valign:'middle',
		    title: '负责人名称'
			    	
		  },{
			  title:'操作',
			  align: 'center',
			  valign:'middle',
			  formatter:function(value,row,index){
				  var updateButton = "<button onclick=\"myUpdateClick("+row.drugstorageid+")\" type=\"button\" class=\"btn btn-link\"><span class=\"glyphicon glyphicon-edit\" style=\"color: rgb(0, 0, 60); font-size: 17px;\"> </span></button>";
				  var deleteButton = "<button onclick=\"myDeleteClick("+row.drugstorageid+")\" type=\"button\" class=\"btn btn-link\"><span class=\"glyphicon glyphicon-trash\" style=\"color: rgb(0, 0, 60); font-size: 17px;\"> </span></button>";
				  return updateButton+deleteButton;
				  }
		   }]
		})
  })
  

</script>
</body>
</html>