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

  <link rel="apple-touch-icon" sizes="76x76" href="../assets/img/apple-icon.png">
  <link rel="icon" type="image/png" href="../assets/img/favicon.png">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <title>  管理者留言首頁 </title>
  <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
  <!--     Fonts and icons     -->
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
  <link href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
  <!-- CSS Files -->
  <link href="../assets/css/bootstrap.min.css" rel="stylesheet" />
  <link href="../assets/css/paper-dashboard.css?v=2.0.1" rel="stylesheet" />
  <!-- CSS Just for demo purpose, don't include it in your project -->
  <link href="../assets/demo/demo.css" rel="stylesheet" />
  
</head>

<body class="">
  <div class="wrapper ">
    <div class="sidebar" data-color="white" data-active-color="danger">
      <div class="logo">
        <a href="https://www.creative-tim.com" class="simple-text logo-mini">
          <!-- <div class="logo-image-small">
            <img src="./assets/img/logo-small.png">
          </div> -->
          <!-- <p>CT</p> -->
        </a>
        <a href="https://www.creative-tim.com" class="simple-text logo-normal">
        		  商城Logo
          <!-- <div class="logo-image-big">
            <img src="../assets/img/logo-big.png">
          </div> -->
        </a>
      </div>
      <div class="sidebar-wrapper">
        <ul class="nav">
          <li class="active ">
            <a href="javascript:;">
              <i class="nc-icon nc-bank"></i>
              <p>管理者資訊</p>
            </a>
          </li>
          <li>
            <a href="javascript:;">
              <i class="nc-icon nc-diamond"></i>
              <p>商城管理</p>
            </a>
          </li>
          <li>
            <a href="javascript:;">
              <i class="nc-icon nc-pin-3"></i>
              <p>活動管理</p>
            </a>
          </li>
        </ul>
      </div>
    </div>
    <div class="main-panel" style="height: 100vh;">
      <!-- Navbar -->
      <nav class="navbar navbar-expand-lg navbar-absolute fixed-top navbar-transparent">
        <div class="container-fluid">
          <div class="navbar-wrapper">
            <div class="navbar-toggle">
              <button type="button" class="navbar-toggler">
                <span class="navbar-toggler-bar bar1"></span>
                <span class="navbar-toggler-bar bar2"></span>
                <span class="navbar-toggler-bar bar3"></span>
              </button>
            </div>
            <a class="navbar-brand font-weight-bold" href="javascript:;">管理者頁面</a>
            <button class="btn btn-warning"><a href="<c:url value='/BackFirst'/>"><i class="fa fa-home"></i>回首頁</a></button>
          </div>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navigation" aria-controls="navigation-index" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-bar navbar-kebab"></span>
            <span class="navbar-toggler-bar navbar-kebab"></span>
            <span class="navbar-toggler-bar navbar-kebab"></span>
          </button>
          <div class="collapse navbar-collapse justify-content-end" id="navigation">
            <form>
              <div class="input-group no-border">
                <input type="text" value="" class="form-control" placeholder="Search...">
                <div class="input-group-append">
                  <div class="input-group-text">
                    <i class="nc-icon nc-zoom-split"></i>
                  </div>
                </div>
              </div>
            </form>
            <ul class="navbar-nav">
              <li class="nav-item btn-rotate dropdown">
                <a class="nav-link dropdown-toggle" href="http://example.com" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  <i class="nc-icon nc-bell-55"></i>
                  <p>
                    <span class="d-lg-none d-md-block">Some Actions</span>
                  </p>
                </a>
                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink">
                  <a class="dropdown-item" href="#">Action</a>
                  <a class="dropdown-item" href="#">Another action</a>
                  <a class="dropdown-item" href="#">Something else here</a>
                </div>
              </li>
            </ul>
          </div>
        </div>
      </nav>
      <!-- End Navbar -->
      <div class="content">
        <div class="row">
          <div class="col-md-12">
            <h3 class="alert alert-default">Welcome to MsgBoard Admin Page!</h3>
            <div class="table-responsive"> 
              <table class="table" id="tbl_result"> 
                <thead class=" text-primary">
                  <tr>
                    <th> ID </th>
                    <th> Name </th> 
                    <th> Title </th>
                    <th> Content</th>
                    <th class="text-lg-center">Time</th>
                    <th class="text-lg-right">Option</th>
                  </tr>
                </thead> 
                <c:forEach var="i" begin="0" end="${list2.size()-1}">
                <tbody> 
                  <tr id="showallMsg">
                	<input type="hidden" id="idNum${i}" value=${list2.get(i).id} >
                    <td> ${list2.get(i).id} </td>
                    <td> ${list2.get(i).username} </td>
                    <td> ${list2.get(i).title} </td>
                    <td> ${list2.get(i).content} </td>
                    <td class="text-lg-center">${list2.get(i).time} </td>
                    <td class="text-lg-right">
                    	<button class="btndel btn-sm btn-outline-danger" value=${i}>Del<i class="fa fa-trash" aria-hidden="true"></i></button>
                    	<button class="btnupd btn-sm btn-outline-info" value=${i}>Upd<i class="fa fa-pencil" aria-hidden="true"></i></button>
                    </td>
                  </tr>
                </tbody>
                </c:forEach>
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
            <div class="form-horizontal" method="post" id="UpdateMsgform">
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
                          <input id="updTitle" name="updTitle" type="text" placeholder="Title" class="form-control">
                      </div>
                  </div>

                  <div class="form-group">
                      <span class="col-md-1 col-md-offset-2 text-center"><i class="fa fa-user bigicon"></i></span>
                      <div class="col-md-8">
                          <input id="updUsername" name="updUsername" type="text" placeholder="User Name" class="form-control">
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
      <footer class="footer" style="position: absolute; bottom: 0; width: -webkit-fill-available;">
        <div class="container-fluid">
          <div class="row">
            <nav class="footer-nav">
              <ul>
                <li><a href="https://www.creative-tim.com" target="_blank">Creative Tim</a></li>
                <li><a href="https://www.creative-tim.com/blog" target="_blank">Blog</a></li>
                <li><a href="https://www.creative-tim.com/license" target="_blank">Licenses</a></li>
              </ul>
            </nav>
            <div class="credits ml-auto">
              <span class="copyright">
                © 2020, made with <i class="fa fa-heart heart"></i> by Creative Tim
              </span>
            </div>
          </div>
        </div>
      </footer>
    </div>
  </div>
  <!--   Core JS Files   -->
  
  
  <script src="../assets/js/core/jquery.min.js"></script>
  <script src="../assets/js/core/popper.min.js"></script>
  <script src="../assets/js/core/bootstrap.min.js"></script>
  <script src="../assets/js/plugins/perfect-scrollbar.jquery.min.js"></script>
  <!--  Google Maps Plugin    -->
  <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
  <!-- Chart JS -->
  <script src="../assets/js/plugins/chartjs.min.js"></script>
  <!--  Notifications Plugin    -->
  <script src="../assets/js/plugins/bootstrap-notify.js"></script>
  <!-- Control Center for Now Ui Dashboard: parallax effects, scripts for the example pages etc -->
  <script src="../assets/js/paper-dashboard.min.js?v=2.0.1" type="text/javascript"></script>
  <script>
    $(document).ready(function() {
      
      $("#UpdateMsgform").hide(); 
      
      $('.btndel').click(function(){
        
      	var btndel = window.confirm('確定要刪除嗎?');
        if (btndel) {
          var idNum = $('#idNum'+this.value).val();
          
          $.ajax({
            type: "POST",
            contentType: "application/x-www-form-urlencoded;",
            dataType: "text",
            url: "adminDeleteOneAjax",
            data: "id="+idNum,
            success: function (data) {
				console.log(data);	
            },
            error:function(){
				alert("刪除失敗")
            }
          });
          
        } else {
          alert('cancel');
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
        $('#uMsgID').val(updValue)
    })
      
    $('#ResetButt').click(function(){
        
        $('#updTitle').val('')
        $('#updUsername').val('')
        $('#updContent').val('')
    })
	
	
	
    
    $('#UpdSubButt').click(function(){
        var UserId = $('#uMsgID').val();
        var MsgTitle =$('#updTitle').val();
        var MsgUserName=$('#updUsername').val();
        var MsgContent=$('#updContent').val();

		var d = {
			"id":UserId,
			"username":MsgUserName,
			"title":MsgTitle,
			"content":MsgContent
		}
		
		
        $.ajax({
          type: "POST",
          contentType: "application/json;",
          dataType: "json",
          url: "adminUpdateOneProcess",
          data: JSON.stringify(d),
          success: function (data) {
            console.log(data)
            
          },
          error:function(){
              alert("修改失敗")
          }
        });
      })
	 
  </script>

</body>


</html>
