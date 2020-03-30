<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>病历</title>
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
		  url: '${pageContext.request.contextPath}/medicalrecord/queryMedicalrecord.action',//访问后台（json）的地址
		  pagination: true,//允许分页
		  search: true,//可以搜索
		  toolbar:"#toolbar",
		  pageSize:3,//每页显示3条数据
		  pageList:[2,3,5,8,10],//每页显示的条数列表
		  showColumns:true,//选择显示的列
		  showRefresh:true,//允许刷新
		  showExport:true,//允许导出
		  exportDataType:'all',
		  exportTypes:['txt','doc','excel'],
		  columns: [
			  {
				field: 'SerialNumber',
				title: '序号',
				valign:'middle',
			    align: 'center',
				formatter: function (value, row, index) {
				    return index+1;
			  }
		  },{
			    field: 'medicalrecordid',//字段名称    对应json中的key
			    align: 'center',
			    valign:'middle',
			    visible: false,
			    title: '病历编号'
		  },{
			    field: 'patient.name',
			    align: 'center',
			    valign:'middle',
			    title: '病人姓名'
		  },{
		        field: 'category',
		        align: 'center',
		        valign:'middle',
		        title: '病名'
		  },{
			    field: 'anamnesis',
			    align: 'center',
			    valign:'middle',
			    title: '既往病史'
		  },{
			    field: 'doctoradvice',
			    align: 'center',
			    valign:'middle',
			    title: '医嘱内容'
		  },{
			    field: 'department.departmentname',
			    align: 'center',
			    valign:'middle',
			    title: '就诊科室'
		  },{
				  title:'操作',
				  align: 'center',
				  valign:'middle',
				  formatter:function(value,row,index){
					  var updateButton = "<button  onclick=\"myUpdateClick("+row.medicalrecordid+")\" type=\"button\" class=\"btn btn-link\"><span class=\"glyphicon glyphicon-edit\" style=\"color: rgb(0, 0, 60); font-size: 17px;\"> </span></button>";					 
					  var deleteButton = "<button onclick=\"myDeleteClick("+row.medicalrecordid+")\" type=\"button\" class=\"btn btn-link\"><span class=\"glyphicon glyphicon-trash\" style=\"color: rgb(0, 0, 60); font-size: 17px;\"> </span></button>";
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
				
		//科室下拉列表动态读取数据
		$.ajax({
			type:'post',//提交方式
			url:'${pageContext.request.contextPath}/department/queryDepartment.action',//访问后台的地址   查询所有的岗位信息
			async:false,//  true：异步     false:同步
			dataType: "json",//数据类型
			success: function(data){		
				
				if(data != null){
					var optionhtml = '';//定义一个字符串变量
					
					for(var i=0;i<data.length;i++){
						
						optionhtml +='<option value="'+data[i].departmentid+'">'+data[i].departmentname+'</option>';				
					}
					$("#myAddDepartment").html(optionhtml);
					$("#myUpdateDepartment").html(optionhtml);
				}
				 
			}
		})
})
  
/*删除*/
function myDeleteClick(id){
	 
	  var medicalrecordid = id;	
	
	  $.ajax({
		  type:"post",
		  url:"${pageContext.request.contextPath}/medicalrecord/deleteById.action",
		  data:{medicalrecordid:medicalrecordid},
		  dataType:"json",
		  success:function(){
			  
				$("#table").bootstrapTable("refresh");
			  	给出提示信息
				swal({
					text: "科室删除成功！",
					type: "success",
					confirmButtonText: '确认',
					confirmButtonColor: '#4cd964',
				})
		  }
	  })  
}
  
/* 修改  预先查询病历信息显示于页面  */
function myUpdateClick(medicalrecordid){
	  
	$.ajax({
		 type:"post",//请求方式
		 url:"${pageContext.request.contextPath}/medicalrecord/getById.action",//根据编号查询用户的信息
		 data:{mid:medicalrecordid},//传参数到后台
		 dataType:"json",//以json格式传递数据
		 success:function(data){
			 //data：指后台查询后返回来的用户信息
			     $('#myUpdateModal').modal().on('shown.bs.modal',
					    function() {	    	 
			    	 //输入框赋初始值
			    	 
			    	 //给隐藏框赋值
			    	 $("#myUpdateMedicalRecordId").val(data.medicalrecordid);
			    	 
			    	 $("#anamnesis").val(data.anamnesis);			    			  	
			    	 //给下拉列表赋初始值
			    	 $("#doctoradvice").val(data.doctoradvice);   
			     })
		 }
	})
}
  
  
//修改事件
  function updateMedicalrecord(){
  	
  	//获取表单中的所有值
  	var data = $("#myUpdateForm").serializeArray();
  	
  	$.ajax({
  		type:'post',//提交方式
  		url:'${pageContext.request.contextPath}/medicalrecord/saveUpdateMedicalRecord.action',//修改的地址
  		data:data,
  		dataType:'json',
  		success:function(data){
  			$("#table").bootstrapTable("refresh");
			 swal({
					text: "修改成功！",
					type: "success",
					confirmButtonText: '确认',
					confirmButtonColor: '#4cd964',
			  })
  		}	
  	})
  }
  
/*添加*/
//添加事件
$("#btn_add").click(function () {
	 
	$('#myAddModal').modal().on('shown.bs.modal', function() {

		 $("#myAddForm")[0].reset();
	  })
})

  function addMedicalrecord(){
	  
	  var data = $("#myAddForm").serializeArray();
    
	  	$.ajax({
			type:'post',//提交方式
			url:'${pageContext.request.contextPath}/medicalrecord/addMedicalrecord.action',
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

<!-- 添加模态框（Modal） -->
<div class="modal fade" id="myAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">添加挂号</h4>
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
					    <!--  <div class="form-group">
					    <label class="col-sm-2 control-label">医嘱:</label>
					    <div class="col-sm-7">
					      <input type="text" class="form-control" name="doctoradvice" id="doctoradvice" placeholder="">
					      <label id="doctoradvice-error" class="error" for="doctoradvice" style="margin-top: 4px;color: red;font-size: 15px;"></label>
					    </div>
					  </div>	-->			  
					    <div class="form-group">
					    <label class="col-sm-2 control-label">既往病史:</label>
					    <div class="col-sm-7">
					      <input type="text" class="form-control" name="anamnesis" id="anamnesis" placeholder="">
					      <label id="anamnesis-error" class="error" for="anamnesis" style="margin-top: 4px;color: red;font-size: 15px;"></label>
					    </div>
					  </div>				  					  
					   <div class="form-group">
							<label class="col-sm-2 control-label"></label>
							<div class="col-sm-7">
								<input type="hidden" class="form-control" name="iddelete"
									id="iddelete" value="0"> <label
									id="iddelete-error" class="error" for="iddelete"
									style="margin-top: 4px; color: red; font-size: 15px;"></label>
							</div>
						</div>		
                 </form>
            </div>
            <div class="modal-footer">
                <button type="button" id="addBtn" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button onclick="addMedicalrecord()" type="button" class="btn btn-primary">添加</button>
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
                      <input type="hidden" name="medicalrecordid" id="myUpdateMedicalRecordId">	  
					    <!--  <div class="form-group">
					   <label class="col-sm-2 control-label">医嘱:</label>
					    //<div class="col-sm-7">
					      <input type="text" class="form-control" name="doctoradvice" id="doctoradvice" placeholder="">
					      <label id="doctoradvice-error" class="error" for="doctoradvice" style="margin-top: 4px;color: red;font-size: 15px;"></label>
					    </div>
					  </div> -->			  
					    <div class="form-group">
					    <label class="col-sm-2 control-label">既往病史:</label>
					    <div class="col-sm-7">
					      <input type="text" class="form-control" name="anamnesis" id="anamnesis1" placeholder="(必填项)">
					      <label id="anamnesis1-error" class="error" for="anamnesis" style="margin-top: 4px;color: red;font-size: 15px;"></label>
					    </div>
					  </div>			  			  
                 </form>
            </div>
            <div class="modal-footer">
                <button type="button" id="updateBtn" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button onclick="updateMedicalrecord()" type="button" class="btn btn-primary">修改</button>
            </div>
        </div>
    </div>
</div>

</body>
</html>