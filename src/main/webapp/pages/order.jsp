<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>订单管理</title>
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
		  url: '${pageContext.request.contextPath}/order/getAllorder.action',//访问后台（json）的地址
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
			    field: 'orderid',//字段名称    对应json中的key
			    align: 'center',
			    valign:'middle',
			    title: '编号'
		      },{
			    field: 'supplier.name',
			    align: 'center',
			    valign:'middle',
			    title: '供应商名称'
		      },{
			    field: 'orderdetails.drugs.drugsname',
			    align: 'center',
			    valign:'middle',
			    title: '药品名称' 
		      },{
			    field: 'orderdetails.drugamount',
			    align: 'center',
			    valign:'middle',
			    title: '订货数量'
		      },{
			    field: 'orderdate',
			    align: 'center',
			    valign:'middle',
			    title: '订货日期'    	
			  },{	  
			    field: 'deliverydate',
			    align: 'center',
			    valign:'middle',
			    title: '交货日期'
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
					  var updateButton = "<button  onclick=\"myUpdateClick("+row.drugsid+")\" type=\"button\" class=\"btn btn-link\"><span class=\"glyphicon glyphicon-edit\" style=\"color: rgb(0, 0, 60); font-size: 17px;\"> </span></button>";
					  var deleteButton = "<button onclick=\"myDeleteClick("+row.drugsid+")\" type=\"button\" class=\"btn btn-link\"><span class=\"glyphicon glyphicon-trash\" style=\"color: rgb(0, 0, 60); font-size: 17px;\"> </span></button>";
					  return updateButton+deleteButton;
				  }
			  }
			  ]
		})
		
		//负责人员下拉列表动态读取数据
		$.ajax({
			type:'post',//提交方式
			url:'${pageContext.request.contextPath}/user/getUser.action',//访问后台的地址 
			async:false,//  true：异步     false:同步
			dataType: "json",//数据类型
			success: function(data){
				 
				if(data != null){
					var optionhtml = '';//定义一个字符串变量
					
					for(var i=0;i<data.length;i++){
						
						optionhtml +='<option value="'+data[i].userid+'">'+data[i].username+'</option>';
						
					}
				   
					$("#myUpdateUser").html(optionhtml);
					$("#myAddUser").html(optionhtml);
				}
			}
		})
		
		$.ajax({
		type:'post',//提交方式
		url:'${pageContext.request.contextPath}/supplier/getAllsupplier.action',//修改的地址
		dataType:'json',
		success:function(data){

			if(data != null){
				var supid = '';//定义一个字符串变量
				
				for(var i=0;i<data.length;i++){
					
					supid +='<option value="'+data[i].supplierid+'">'+data[i].name+'</option>';			
				}
				$("#myAddSupid").html(supid);
				$("#myUpdateSupid").html(supid);
			}				
		}
  })
  //药品下拉列表动态读取数据
		$.ajax({
			type : 'post',//提交方式
			url : '${pageContext.request.contextPath}/drugs/queryDrugs.action',//访问后台的地址   查询所有的岗位信息
			async : false,//  true：异步     false:同步
			dataType : "json",//数据类型
			success : function(data) {

				if (data != null) {
					var optionhtml = '';//定义一个字符串变量

					for (var i = 0; i < data.length; i++) {

						optionhtml += '<option value="'+data[i].drugsid+'">'
								+ data[i].drugsname + '</option>';

					}
					$("#myAddDrugs").html(optionhtml);
					$("#myUpdateDrugs").html(optionhtml);
				}
			}
		})
})
  
   /* 修改  预先查询员工信息显示于页面  */
  function myUpdateClick(orderid){
	  
	  
  	$.ajax({
  		 type:"post",//请求方式
  		 url:"${pageContext.request.contextPath}/order/updateorder.action",//根据编号查询用户的信息
  		 data:{orderid:orderid},//传参数到后台
  		 dataType:"json",//以json格式传递数据
  		 success:function(data){
  			 //data：指后台查询后返回来的用户信息
  			     $('#myUpdateModal').modal().on('shown.bs.modal',
  					    function() {
  			    	 $("#orderid").val(data.orderid);
                     $("#myUpdateSupid").val(data.supplierid);
                     $("#drugsname").val(data.drugsname);
                     $("#occupation").val(data.occupation);
                     $("#telephone").val(data.telephone);
  			    
  			     })
  		 }
  	})
  }
  
  function updateorder(){
	  	
	  	//获取表单中的所有值
	  	var data = $("#myUpdateForm").serializeArray();
	  	
	  	$.ajax({
	  		type:'post',//提交方式
	  		url:'${pageContext.request.contextPath}/order/saveorder.action',//修改的地址
	  		data:data,
	  		dataType:'json',
			success:function(data){
				 
				$("#table").bootstrapTable("refresh");
				
				$("#updateBtn").click(); 
				swal({
						text: "修改成功！",
						type: "success",
						confirmButtonText: '确认',
						confirmButtonColor: '#4cd964',
				  })  
				}
	  	})	
	}
  
     
  function myDeleteClick(orderid){
	  
	  var orderid=orderid;
	  
	  	$.ajax({
	  		 type:"post",//请求方式
	  		 url:"${pageContext.request.contextPath}/order/delinfo.action",//根据编号查询用户的信息
	  		 data:{orderd:orderid},//传参数到后台
	  		 dataType:"json",//以json格式传递数据
	  		 success:function(data){
	  			if(data==1){ 
	  			$("#table").bootstrapTable("refresh");
			  	//给出提示信息
				swal({
					text: "删除成功！",
					type: "success",
					confirmButtonText: '确认',
					confirmButtonColor: '#4cd964',
				})
	  		}
  		 }
  	})  
 } 
  
  $("#btn_add").click(function () {
	  	//模态框清空内容

	  	 $('#myAddModal').modal().on('shown.bs.modal', function() {
	  	
	  	  })
	  })
  
  function addorder() {
  
	 var data = $("#myAddForm").serializeArray();
	 	$.ajax({
			type:'post',//提交方式
			url:'${pageContext.request.contextPath}/order/addorder.action',
			data:data,
			dataType:'json',
			success:function(data){
				$("#table").bootstrapTable("refresh");
				 
				$("#addBtn").click();
				swal({
						text: "添加成功！",
						type: "success",
						confirmButtonText: '确认',
						confirmButtonColor: '#4cd964',
				  }) 
			}
		})
}
  

</script>

<!-- 修改模态框（Modal） -->
<div class="modal fade" id="myUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">修改</h4>
            </div>
            <div class="modal-body">
                <form id="myUpdateForm" class="form-horizontal">                    
                    <input type="hidden" name="orderid" id="orderid">
            <div class="form-group">
			    <label for="inputPassword3" class="col-sm-2 control-label">供应商:</label>
			    <div class="col-sm-10">
			      <select id="myUpdateSupid" class="form-control" name="supplierid">
			       			<option value="">请选择</option>
			      </select>
			    </div>
		    </div>
		    <div class="form-group">
			    <label for="inputPassword3" class="col-sm-2 control-label">药品名称:</label>
			    <div class="col-sm-10">
			      <select id="myUpdateDrugs" class="form-control" name="drugsid">
			       			<option value="">请选择</option>
			      </select>
			    </div>
		    </div>
		    <div class="form-group">
			    <label for="drugamount" class="col-sm-2 control-label">订货数量:</label>
			    <div class="col-sm-10">
			      <input type="text" class="form-control" name="drugamount" id="drugamount" placeholder="请输入">
			    </div>
		    </div> 
		    <div class="form-group">
			    <label for="inputPassword3" class="col-sm-2 control-label">负责人员:</label>
			    <div class="col-sm-10">
			      <select id="myUpdateUser" class="form-control" name="userid">
			       			<option value="">请选择</option>
			      </select>
			    </div>
		    </div>
                 </form>
            </div>
            <div class="modal-footer">
                <button type="button" id="updateBtn" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button onclick="updateorder()" type="button" class="btn btn-primary">修改</button>
            </div>
        </div>
    </div>
</div>


<!-- 添加模态框（Modal） -->
<div class="modal fade" id="myAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">添加信息</h4>
            </div>
            <div class="modal-body">
                  <form id="myAddForm" class="form-horizontal" action="">  
            <div class="form-group">
			    <label for="inputPassword3" class="col-sm-2 control-label">供应商:</label>
			    <div class="col-sm-10">
			      <select id="myAddSupid" class="form-control" name="supplierid">
			       			<option value="">请选择</option>
			      </select>
			    </div>
		    </div>
		    <div class="form-group">
			    <label for="inputPassword3" class="col-sm-2 control-label">药品名称:</label>
			    <div class="col-sm-10">
			      <select id="myAddDrugs" class="form-control" name="drugsid">
			       			<option value="">请选择</option>
			      </select>
			    </div>
		    </div>
		    <div class="form-group">
			    <label for="drugamount" class="col-sm-2 control-label">订货数量:</label>
			    <div class="col-sm-10">
			      <input type="text" class="form-control" name="drugamount" id="drugamount" placeholder="请输入">
			    </div>
		    </div> 
		    <div class="form-group">
		    <label for="inputEmail3" class="col-sm-2 control-label">订货日期:</label>
			    <div class="col-sm-10">
			      <input type="text"  name="orderdate" class="form-control" id="orderdate" placeholder="订货日期">
				  <script>
						laydate.render({
						  elem: '#orderdate' //指定元素
						  ,theme: 'molv'
						});
				  </script>
			    </div>
		  	</div>
		  	<div class="form-group">
			    <label for="inputEmail3" class="col-sm-2 control-label">交货日期:</label>
			    <div class="col-sm-10">
			      <input type="text"  name="deliverydate" class="form-control" id="deliverydate" placeholder="交货日期">
				  <script>
						laydate.render({
						  elem: '#deliverydate' //指定元素
						  ,theme: 'molv'
						});
				  </script>
			    </div>
		  	</div>
		    <div class="form-group">
			    <label for="inputPassword3" class="col-sm-2 control-label">负责人员:</label>
			    <div class="col-sm-10">
			      <select id="myAddUser" class="form-control" name="userid">
			       			<option value="">请选择</option>
			      </select>
			    </div>
		    </div>
                 </form>
            </div>
            <div class="modal-footer">
                <button type="button" id="addBtn" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button onclick="addorder()" type="button" class="btn btn-primary">添加</button>
            </div>
        </div>
    </div>
</div>
</body>
</html>