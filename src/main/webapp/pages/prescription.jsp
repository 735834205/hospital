<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>处方表</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/plugin/sweetalert/resource/css/sweetalert2.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/plugin/sweetalert/resource/css/mui.min.css" />  
<%@ include file="/common/commoncss.jsp"%>
<%@ include file="/common/commonjs.jsp"%>
</head>
<body>
<div id="toolbar" style="float: left; width: 100%;">
	<button id="btn_add" type="submit" class="btn btn-default">
		<span class="glyphicon glyphicon-plus"
			style="color: rgb(0, 0, 0); font-size: 16px; margin-top: -5px;">&nbsp;添加</span>
	</button>
</div>
<table id="table">

</table>

<script type="text/javascript">
	$(function() {
		$('#table').bootstrapTable({
		url : '${pageContext.request.contextPath}/prescription/queryPrescription.action',//访问后台（json）的地址
		pagination : true,//允许分页
		search : true,//可以搜索
		toolbar : "#toolbar",
		pageSize : 3,//每页显示3条数据
		pageList : [ 2, 3, 5, 8, 10 ],//每页显示的条数列表
		showColumns : true,//选择显示的列
		showRefresh : true,//允许刷新
		showExport : true,//允许导出
		exportDataType : 'all',
		exportTypes : [ 'txt', 'doc', 'excel' ],
		columns : [
			{
			    field: 'SerialNumber',
			    title: '序号',
			    valign:'middle',
			    align: 'center',
			    formatter: function (value, row, index) {
			        return index+1;
			    }
		  },{
					field : 'patient.name',
					align : 'center',
					valign : 'middle',
					title : '病人'
		  },{
					field : 'drugs.drugsname',
					align : 'center',
					valign : 'middle',
					title : '药品名'
		  },{
					field : 'drugno',
					align : 'center',
					valign : 'middle',
					title : '药品数量/盒'
		  },{
				    field : 'date',
				    align : 'center',
				    valign : 'middle',
				    title : '开药日期'
	      },{
				    field : 'user.username',
				    align : 'center',
				    valign : 'middle',
				    title : '开药医师'
          },{
					title : '操作',
					align : 'center',
					valign : 'middle',
					formatter:function(value,row,index){
						  var updateButton = "<button onclick=\"myUpdateClick("+row.prescriptionnumber+")\" type=\"button\" class=\"btn btn-link\"><span class=\"glyphicon glyphicon-edit\" style=\"color: rgb(0, 0, 60); font-size: 17px;\"> </span></button>";
						  var deleteButton = "<button onclick=\"myDeleteClick("+row.prescriptionnumber+")\" type=\"button\" class=\"btn btn-link\"><span class=\"glyphicon glyphicon-trash\" style=\"color: rgb(0, 0, 60); font-size: 17px;\"> </span></button>";
						  return updateButton+deleteButton;
					  }
				}]
	})

		//病人下拉列表动态读取数据
		$.ajax({
			type:'post',//提交方式
			url:'${pageContext.request.contextPath}/patient/queryPatient.action',//访问后台的地址   查询所有的岗位信息
			async:false,//  true：异步     false:同步
			dataType: "json",//数据类型
			success: function(data){				
				
				if(data != null){
					var optionhtml = '';//定义一个字符串变量
					
					for(var i=0;i<data.length;i++){
						
						optionhtml +='<option value="'+data[i].patientid+'">'+data[i].name+'</option>';					
					}				
					//给下拉列表赋值  text()、val()、html()、attr()等
					$("#myUpdatePatient").html(optionhtml);
					$("#myAddPatient").html(optionhtml);
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
		
		//开药医师下拉列表动态读取数据
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
					$("#myAddUser").html(optionhtml);
				}
			}
})
		
		
		
/* 修改  预先查询处方信息显示于页面  */
function myUpdateClick(prescriptionnumber){
	  
	$.ajax({
		 type:"post",//请求方式
		 url:"${pageContext.request.contextPath}/prescription/getById.action",//根据编号查询用户的信息
		 data:{pid:prescriptionnumber},//传参数到后台
		 dataType:"json",//以json格式传递数据
		 success:function(data){
			 //data：指后台查询后返回来的用户信息
			     $('#myUpdateModal').modal().on('shown.bs.modal',
					    function() {			   
	    	 
			    	 //给隐藏框赋值
			    	 $("#myUpdatePrescriptionNumber").val(data.prescriptionnumber);
			    	
			    	 //给下拉列表赋初始值
			    	 $("#myUpdateDrugs").val(data.drugsid);
			    	 $("#myUpdatePatient").val(data.patientid);
			    	 $("#updatedrugno").val(data.drugno);  
			     })
		 }
	})
}
		
		
//删除
function myDeleteClick(number){
	 
	  var prescriptionnumber =number;	
	
	  $.ajax({
		  type:"post",
		  url:"${pageContext.request.contextPath}/prescription/deleteById.action",
		  data:{prescriptionnumber:prescriptionnumber},
		  dataType:"json",
		  success:function(){
			  $("#table").bootstrapTable("refresh");
			  	//给出提示信息
				swal({
					text: "删除成功！",
					type: "success",
					confirmButtonText: '确认',
					confirmButtonColor: '#4cd964',
				})
		  }
	  })
  }
		
		
		
//修改事件
function updatePrescription(){
  	
  	//获取表单中的所有值
  	var data = $("#myUpdateForm").serializeArray();
  	
  	$.ajax({
  		type:'post',//提交方式
  		url:'${pageContext.request.contextPath}/prescription/saveUpdatePrescription.action',//修改的地址
  		data:data,
  		dataType:'json',
  		success:function(data){
  			$("#table").bootstrapTable("refresh");
  		    //关闭弹框
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
		
		

//添加事件
$("#btn_add").click(function () {
	 
	$('#myAddModal').modal().on('shown.bs.modal', function() {

		// $("#myAddForm")[0].reset();
	  })
})

function addPrescription() {

	var data = $("#myAddForm").serializeArray();

	$.ajax({
		type : 'post',//提交方式
		url : '${pageContext.request.contextPath}/prescription/addPrescription.action',//修改的地址
		data : data,
		dataType : 'json',
		success : function(data) {
			//刷新页面
			  $("#table").bootstrapTable("refresh");
			  //关闭弹框
			  $("#addBtn").click();
	
			  swal({
					text: "添加成功!",
					type: "success",
					confirmButtonText: '确认',
					confirmButtonColor: '#4cd964',
				})
		}

	})
}
</script>



<!-- 添加模态框（Modal） -->
<div class="modal fade" id="myAddModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="myModalLabel">添加处方</h4>
			</div>
			<div class="modal-body">
				<form id="myAddForm" class="form-horizontal" action="">
					<div class="form-group">
					    <label class="col-sm-2 control-label">病人姓名:</label>
					    <div class="col-sm-7">
					     <select id="myAddPatient" class="form-control" name="patientid">
					       		<option value="">请选择</option>
					       </select>       
					 </div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">药品名:</label>
						<div class="col-sm-7">
							<select id="myAddDrugs" class="form-control" name="drugsid">
								<option value="">请选择</option>
							</select>
						</div>
					</div>
					<div class="form-group">
					    <label for="inputEmail3" class="col-sm-2 control-label">药品数量/盒:</label>
					    <div class="col-sm-10">
					      <input type="text"  name="drugno" class="form-control" id="inputdrugno" placeholder="药品数量/盒">
					</div>
					</div>
					<div class="form-group">
					    <label for="inputEmail3" class="col-sm-2 control-label">开药日期:</label>
					    <div class="col-sm-10">
					      <input type="text"  name="date" class="form-control" id="inputdate" placeholder="开药日期">
						  <script>
								laydate.render({
								  elem: '#inputdate' //指定元素
								  ,theme: 'molv'
								});
						  </script>
					    </div>
					</div>
					<div class="form-group">
					    <label for="inputPassword3" class="col-sm-2 control-label">开药医师:</label>
					    <div class="col-sm-10">
					       <select id="myAddUser" class="form-control" name="userid">
					       		<option value="">请选择</option>	
					       </select>
					    </div>
					</div>		
			</form>
		</div>
		<div class="modal-footer">
			<button type="button" id="addBtn" class="btn btn-default"
				data-dismiss="modal">关闭</button>
			<button onclick="addPrescription()" type="button"
					class="btn btn-primary">添加</button>
		</div>
	 </div>
  </div>
</div>

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
            <!-- 隐藏框传值 -->
            <input type="hidden" name="prescriptionnumber" id="myUpdatePrescriptionNumber">		  
		  	<div class="form-group">
		        <label class="col-sm-2 control-label">病人姓名:</label>
		        <div class="col-sm-7">
		           <select id="myUpdatePatient" class="form-control" name="patientid">
		       		   <option value="">请选择</option>
		           </select>       
		       </div>
		    </div>
		  	<div class="form-group">
				<label class="col-sm-2 control-label">药品名:</label>
				<div class="col-sm-7">
					<select id="myUpdateDrugs" class="form-control" name="drugsid">
						<option value="">请选择</option>
					</select>
				</div>
			</div>
		    <div class="form-group">
			    <label for="inputEmail3" class="col-sm-2 control-label">药品数量/盒:</label>
			    <div class="col-sm-10">
			      <input type="text"  name="drugno" class="form-control" id="updatedrugno" placeholder="药品数量/盒">
			    </div>
			</div>	  
            </form>
            </div>
            <div class="modal-footer">
              <button type="button" id="updateBtn" class="btn btn-default" data-dismiss="modal">关闭</button>
              <button onclick="updatePrescription()" type="button" class="btn btn-primary">修改</button>
            </div>
        </div>
    </div>
</div>
</body>
</html>