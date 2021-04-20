<!--
=========================================================
* Paper Dashboard 2 - v2.0.1
=========================================================

* Product Page: https://www.creative-tim.com/product/paper-dashboard-2
* Copyright 2020 Creative Tim (https://www.creative-tim.com)

Coded by www.creative-tim.com

 =========================================================

* The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
-->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!doctype html>
<html lang="en">

<head>
  <meta charset="utf-8" />
  <title>  管理者留言首頁 </title>
  <%@ include file="/template/manager/head.jsp"%>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.10.3/sweetalert2.css" />
  
</head>

<body>
  <div class="wrapper ">
  <%@ include file="/template/manager/left.jsp"%> 
  	<div class="main-panel" style="min-height: 100vh;">
  	<%@ include file="/template/manager/navbar.jsp"%> 
   
      <!-- End Navbar -->
      <div class="content">
        <div class="row">
          <div class="col-md-12">
            <h3 class="alert alert-default">留言管理</h3>
            <a href="<c:url value='/MessageBoard/getMsgChart.controller'/>"><i class="far fa-chart-bar"></i>顯示圖表</a>
            <div class="table-responsive"> 
              <table class="table" id="tbl_result"> 
                <thead class=" text-primary">
                  <tr>
                    <th> ID </th>
                    <th> 帳號名稱 </th> 
                    <th> 商品編號 </th>
                    <th> 提問內容</th>
                    <th class="text-lg-center">時間</th>
                    <th class="text-lg-right">選項</th>
                  </tr>
                </thead>
                
                <tbody> 
                <c:forEach var="i" begin="0" end="${list2.size()-1}">
                  <tr id="showallMsg">
                	<input type="hidden" id="idNum${i}" value=${ list2.get(i).id } >
                	<input type="hidden" id="AccountNum${i}" value=${ list2.get(i).account } >
                	<input type="hidden" id="productNum${i}" value=${ list2.get(i).productId } >
                	
                    <td> ${list2.get(i).id} </td>
                    <td> ${list2.get(i).account} </td>
                    <td> ${list2.get(i).productId} </td>
                    <td> ${list2.get(i).content} </td>
                    <td class="text-lg-center">${list2.get(i).time} </td>
                    <td class="text-lg-right">
                    	<button class="btndel btn-sm btn-outline-danger" value=${ i }>Del<i class="fa fa-trash" aria-hidden="true"></i></button>
                    	<button class="btnupd btn-sm btn-outline-info" value=${ i }>Upd<i class="fa fa-pencil" aria-hidden="true"></i></button>
                    </td>
                  </tr>
                </c:forEach>
                </tbody>
                </table>
            </div>
            <!-- Example single danger button -->
            <div class="btn-group">
              <button type="button" class="btn btn-danger dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                		按此來檢視其他功能
              </button>
              <div class="dropdown-menu">
                <a class="dropdown-item" href="#" id="UpdateMsg">修改留言</a>
                <div class="dropdown-divider"></div>
              </div>
            </div>

            
            <br>
            <div class="post"  id="UpdateMsgform" >
              <fieldset>
                  <div class="form-group">
                      <span class="col-md-1 col-md-offset-2 text-center"><i class="fa fa-id-card" aria-hidden="true"></i></span>
                      <div class="col-md-8">
                          <input id="uMsgID" name="uMsgID" type="text" placeholder="MsgID" class="form-control" readonly="readonly">
                      </div>
                  </div>

                  <div class="form-group">
                      <span class="col-md-1 col-md-offset-2 text-center"><i class="fa fa-header" aria-hidden="true"></i></span>
                      <div class="col-md-8">
                          <input id="updAccount" name="updAccount" type="text"  class="form-control" readonly="readonly">
                      </div>
                  </div>

                  <div class="form-group">
                      <span class="col-md-1 col-md-offset-2 text-center"><i class="fa fa-user bigicon"></i></span>
                      <div class="col-md-8">
                          <input id="updProductid" name="updProductid" type="text"  class="form-control" readonly="readonly">
                      </div>
                  </div>


                  <div class="form-group">
                    <span class="col-md-1 col-md-offset-2 text-center"><i class="fa fa-comment" aria-hidden="true"></i></span>
                    <div class="col-md-8">
                        <input id="updContent" name="updContent" type="text" placeholder="Contents" class="form-control">
                    </div>
                  </div>

                  <div class="form-group">
                      <div class="col-md-12 text-center">
                          <button  type="submit" class="btn btn-sm btn-primary btn-lg" id="UpdSubButt">Submit</button>
                          <button type="reset" class="btn btn-sm btn-success btn-lg" id="ResetButt">Reset</button>
                        </div>
                  </div>
              </fieldset>
          </div>
        
      </div>
      </div>
      </div>
      
    </div>
  </div>
  
	<%@ include file="/template/manager/scriptlink.jsp"%> 
  <!-- sweetalert api -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.10.3/sweetalert2.js" type="text/javascript"></script>
  <script src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js" type="text/javascript"></script>
  <script src="https://cdn.datatables.net/1.10.24/js/dataTables.bootstrap4.min.js"></script>

  
  <script>
    $(document).ready(function() {
      
      $("#UpdateMsgform").hide(); 
      
      $('#tbl_result').DataTable({
    	"paging":true,
    	"lengthMenu":[4,8],
      });
      
    })
    
      $('.btndel').click(function(){
          var idNum = $('#idNum'+this.value).val();

          swal({
                title: '確定刪除嗎', 
                text: '刪除就無法復原', 
                type: 'warning',
                showCancelButton: true, 
                confirmButtonText: '確定刪除', 
                cancelButtonText: '取消删除！',
                confirmButtonClass: 'btn btn-success',
                cancelButtonClass: 'btn btn-danger',
                buttonsStyling: false
              }).then(function() {
                $.ajax({
                    type: "POST",
                    contentType: "application/x-www-form-urlencoded;",
                    dataType: "text",
                    url: "adminDeleteOneAjax",
                    data: "id="+idNum,
                    success: function (data) {
                      swal(
                        '已刪除！',
                        '你的文件已經被刪除。',
                        'success',
                      ).then(function(){
                    	  window.location.reload()
                      })
                      
                    },
                    error:function(){
                      swal("刪除失敗")
                    }
                  });
                     
                
              }, function(dismiss) {
                // dismiss的值可以是'cancel', 'overlay',
                // 'close', 'timer'
                if (dismiss === 'cancel') {
                  swal(
                    '已取消！',
                    '刪除動作已取消!',
                    'error'
                  ); 
                } 
              })
          
        })     

    $("#UpdateMsg").click(function(){
      $("#UpdateMsgform").toggle("fast");
    })

    
    $(".alert").hover(function () {
        // over
        $(this).css('opacity',0.5);
      }, function () {
        // out
        $(this).css('opacity',1);
      }
    );


	
    $('.btnupd').click(function(){
        $("#UpdateMsgform").show("fast");
        var updValue=$('#idNum'+this.value).val()  
        var updAcoount = $('#AccountNum'+this.value).val()
        var updPrdouct = $('#productNum'+this.value).val()
        $('#uMsgID').val(updValue)
        $('#updAccount').val(updAcoount)
        $('#updProductid').val(updPrdouct)
    })
      
    $('#ResetButt').click(function(){
        

        $('#updContent').val('')
    })
	
	
	
    
    $('#UpdSubButt').click(function(){
        var UserId = $('#uMsgID').val();
        var Account = $('#updAccount').val();
        var Pid = $('#updProductid').val();
        var MsgContent=$('#updContent').val();

		var d = {
			"id":UserId,
			"acc":Account,
			"pid":Pid,
			"content":MsgContent
		}
		
		
        $.ajax({
          type: "POST",
          contentType: "application/json;",
          dataType: "json",
          url: "adminUpdateOneProcess",
          data: JSON.stringify(d),
          success: function (data) {
            swal(
               '修改成功！',
               '已完成修改。',
               'success',
             ).then(function(){
           	  window.location.reload()
             })
          },
          error:function(){
              swal("修改失敗")
          }
        });
      })
	 
  </script>

</body>


</html>
