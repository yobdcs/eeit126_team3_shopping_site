<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!-- <!DOCTYPE html> -->
<!-- <html> -->
<!--   <head> -->
<!--     <meta charset="utf-8"> -->
<!--     <title>Obaju : e-commerce template</title> -->
<%-- 	<%@ include file="/distribution/head.jsp"%> --%>
<!--   </head> -->
<!--   <body> -->
    <!-- navbar-->
<%--     <%@ include file="/distribution/header.jsp"%> --%>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.10.3/sweetalert2.css" />
  <link href="https://cdn.bootcss.com/animate.css/3.5.2/animate.min.css" rel="stylesheet">
  <script src="https://cdn.bootcss.com/wow/1.1.2/wow.min.js"></script>
  
    <div id="all">
      <div id="content">
        <div class="container" >
          <div class="row">
            <div class="col-lg-12" style="background-image: radial-gradient( circle farthest-corner at 10% 20%,  rgba(255,246,236,1) 39.5%, rgba(100,46,122,0.23) 100.2% );">
              <!-- breadcrumb-->
<!--               <nav aria-label="breadcrumb"> -->
<!--                 <ol class="breadcrumb"> -->
<!--                   <li class="breadcrumb-item"><a href="#">Home</a></li> -->
<!--                   <li aria-current="page" class="breadcrumb-item active">Q&A</li> -->
<!--                 </ol> -->
<!--               </nav> -->
              <div id="error-page" class="row" >
                <div class="col-md-12 mx-auto" >
                  <div class="box1 text-lg-left py-5" style="border-radius: 20px; border: 5px groove;">
<!--                     <p class="text-lg-left"><img src="../img/logo.png" alt="Obaju template"></p> -->
                    
<!--                     <strong>請在此輸入提問</strong> -->
                    <!-- /#comments-->
                    <div id="comment-form" class="wow rotateInUpLeft" data-wow-duration="1s">
                      <div>
                        
                        <div class="row">
                          <div class="col-md-9">
                            <div class="form-group">
                              <label for="" class="label-warnong" style="color:brown;">輸入提問內容: </label>
                              <textarea id="inputContent" name="content" rows="4" class="form-control"></textarea>
                            </div>
                          </div>
                        </div>
                        <div class="row">
                          <div class="col-md-12 text-right">
                            <button class="btn btn-danger" type="button" onclick="btnClear()"><i class="fa fa-trash"></i>清除</button>
                            <button class="btn btn-primary" onclick="btnSR()"><i class="fa fa-comment-o"></i>送出</button>
                            <button class="btn btn-secondary" onclick="quickEnter()">一鍵帶入</button>
			                      <div style="height: 40px;" id="resp"></div>
			                      <div id="backDown" style="z-index: 9999; position: fixed ! important; right: 5px; bottom: 30px;">
					                  <button class="btn btn-primary"><i class="fa fa-chevron-down"></i></button>
					              </div>
                          </div>
                        </div>
                      </div>
                    </div>
                    <!-- /#post-content-->
                    <!--forEach-->
<%--                     <%@ page import="MessageBoard.model.MessageBean"%> --%>
<%--                     <%@ page import="java.util.*"%> --%>
<%--                     <% List<MessageBean> a = (List<MessageBean>) request.getAttribute("productComment"); %> --%>
<%--                     <% System.out.println(a.size()); %> --%>
                    
                   <c:choose>
                   	<c:when test="${ productComment != null }">

                    <c:forEach var="i" begin="0" end="${productComment.size()-1}">
                    <input type="hidden" class="index" value=${i}>
                    <input type="hidden" name="id" id="fkid${i}" value=${productComment.get(i).id}>
                    <div id="comments">
                      <div style="border-radius: 20px;background-image: linear-gradient(to right, #ffecd2 0%, #fcb69f 100%);" class="box1 wow slideInLeft" data-wow-duration="1s" data-wow-delay="1s">
                        
                        <div>
                          <strong style="font-size: 150%;">第  ${i+1} 筆提問</strong>
                   		  <p style="text-align:right;float:right;"><img src="https://tse2.mm.bing.net/th?id=OIP.GtRwIViejiFqeXvy2k4bogHaIu&pid=Api&P=0&w=100&h=100" alt="" class="img-fluid rounded-circle"></p>
                          <h5><i class="fa fa-user" aria-hidden="true">&nbsp;&nbsp;&nbsp;${requestScope.productComment.get(i).account}</i></h5>
                          <p class="posted"><i class="fa fa-clock-o"></i>&nbsp;&nbsp;&nbsp;${productComment.get(i).time}</p>
                          <p><i class="fa fa-comment-o" aria-hidden="true">&nbsp;&nbsp;&nbsp;${productComment.get(i).content}</i></p>
                        </div>
                      </div>
                      
                      <br>
                      <c:choose>
                      <c:when test="${productComment.get(i).msgList !=null && productComment.get(i).msgList.size()>0}">
                      <c:forEach var="j" begin="0" end="${productComment.get(i).msgList.size()-1}">
                      <!--/#post-reply-->
                        <div style="border-radius: 20px;background-image: linear-gradient( 90.5deg,  rgba(255,207,139,0.50) 1.1%, rgba(255,207,139,1) 81.3% );
                        " class="box1 wow slideInRight" data-wow-duration="2s" data-wow-delay="1s">
                          <div class="col-md-9 col-lg-12 text-right">
                          <strong >第  ${j+1} 筆回覆</strong><br>
                            <strong><i class="fa fa-user-circle-o" aria-hidden="true">
                            ${productComment.get(i).msgList.get(j).account}</i></strong>
                            <p style="text-align:left;float:left;width:80px;height:80px;" ><img src="https://thumbs.dreamstime.com/z/small-person-word-answer-isolated-white-d-rendered-31575831.jpg" alt="" class="img-fluid rounded-circle"></p>
                            <p class="posted"><i class="fa fa-clock-o"></i>${productComment.get(i).msgList.get(j).time}</p>
                            <p><i class="fa fa-comment" aria-hidden="true">
                            ${productComment.get(i).msgList.get(j).content}</i></p>
                            
                            <br>
                          </div>
                        </div>
                      </c:forEach>
                      </c:when>
                      </c:choose>
                      
                      <button class="btnexample  btn btn-outline-info" value=${i} ><i class="fa fa-reply"></i> 回覆</button>
                          <div class="hide" id=${i}>
                            <div class="col-lg text-right">
                              <strong  style="background-color: blanchedalmond;font-size: 1.5em;">*為保障交易安全請勿將個人資料洩漏於留言內容中*</strong><br>
                    
                            </div>
                           
                            <div class="col-md-12 text-right">
                              <textarea id="input-question${i}" name="question" rows="4" cols="50" required="required"></textarea><br>     	       
                              <button class="btnsubmit btn-success"  value=${i}><i class="fa fa-comment-o"></i>送出</button>
                              <button id="quickres" class="btn-info" onclick="quickResponse(this)" value=${ i }>一鍵帶入</button>
                              
                              <button class="btnreset btn-secondary"  value=${i}><i class="fa fa-trash"></i>重新填寫</button>         
                            </div>
                          </div>
                          <p style="border:1px"></p>
                    </div>
                    </c:forEach> 
                    </c:when>
                    
                    
                    <c:otherwise>
                    	<h4>尚無提問! </h4>
                    </c:otherwise>
                    
                    
                  </c:choose>
                    
                    <p class="buttons"><a href="<c:url value='/home'/>" class="btn btn-outline-danger"><i class="fa fa-home"></i> 回商品頁</a></p>
                    
						
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!--
    *** FOOTER ***
    _________________________________________________________
    -->
<%--     <%@ include file="/distribution/footer.jsp"%> --%>

<script src="${pageContext.request.contextPath}/distribution/vendor/jquery/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.10.3/sweetalert2.js" type="text/javascript"></script>


    <!--js程式-->
    <script>
    		function quickEnter(){
    			
    			var inputcon = document.getElementById("inputContent");
    			inputcon.value = '這項商品還有存貨嗎?';
                
    		}

			function quickResponse(btn){
				
				var inputres = document.getElementById("input-question" + btn.value);
				inputres.value = '這項商品還有貨喔!!';
			}

    		
            function btnClear(){
                
                document.getElementById("inputContent").value="";
            }
            
            function btnSR(){		
              var buildresult = document.getElementById("resp");
              var inputContentVal = document.getElementById("inputContent").value;
              var productid = $('#msgProductId').val();

              console.log(productid)
              console.log(inputContentVal)
              var xhr = new XMLHttpRequest();
              console.log("${pInfo.userName}");
              var userName = ${pInfo.userName};
              var productName = "${pInfo.productName}";
              
              if (xhr !=null) {
                xhr.open('post',"<c:url value='/MessageBoard/insertSuccessAjax' />");
                xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
                xhr.send("content="+inputContentVal+"&productId="+productid+"&userName="+userName+"&product="+productName);
              } else {
                buildresult.innerHTML = "<h3>您的瀏覽器不支援Ajax</h3>";
              }                
              xhr.onreadystatechange = function(){
                if(xhr.readyState ==4 &&xhr.status == 200){
                	swal({
                 	   title:"提問成功",
                 	   html:"將跳轉至商品頁",
                 	   type:"success"
                    }).then(function(){
                 	   
                 	   window.location.reload();
                 	   
                    })
                  
                }
              }
            }
            
            $(document).ready(function(){
            	
            	wow = new WOW(
            	        {
            	            boxClass: 'wow',      // 默认属性名
            	            animateClass: 'animated', // 默认触发的动画类(包含在animate css中)
            	            offset: 0,          // 为所有添加wow的元素设置 data-wow-delay属性 的默认值
            	            mobile: true,       // 是否在移动设备中开启动画
            	            live: true        // 持续监测页面中是否插入新的wow元素
            	        }
            	    );
            	    wow.init();
				var productid = $('#msgProductId').val()

            	$.ajax({
                    type: "post",
                    url: "/Team03ShoppingSite/MessageBoard/selectOneAjax",
                    data: 'productId='+productid,                    	
                    cache : true,
                    async: true,
                    dataType: "text",
                    contentType:"application/x-www-form-urlencoded",
                    success: function (data) {
                        if (data != '') {
                            
                            
                        }else{
                        	swal('查詢失敗')
                        }
                    },
                    error:function(xhr, status, error){
                        var errorMessage = xhr.status + ': ' + xhr.statusText
                        swal('發生錯誤',errorMessage,"success")
                        //alert('Error - ' + errorMessage);
                    },
                });


     
                $('.hide').hide();
                  
                $('.btnexample').click(function(){
                      var iii = document.getElementById(this.value);
                      $(iii).slideToggle(250);
                  })
                  
                $('.btnreset').click(function(){			

                  $('#input-question'+this.value).val("");
                })
                
                $(".btnsubmit").click(function(){

                    var content=$('#input-question'+this.value).val();              
                    var fkid=$('#fkid'+this.value).val();
                	
	                $.ajax({
	                    type: "get",
	                    url: "/Team03ShoppingSite/MessageBoard/insertReplyAjax",
	                    data: 'id='+fkid+'&content='+content,                    	
	                    cache : true,
	                    async: true,
	                    dataType: "text",
	                    contentType:"application/x-www-form-urlencoded",
	                    success: function (){
	                    	

	                           
	                           swal({
	                        	   title:"回復成功",
	                        	   html:"將跳轉至商品頁",
	                        	   type:"success",
	                        	  
	                           }).then(function(){
	                        	   
	                        	   window.location.reload();
	                        	   
	                           })

	                        
	                    },
	                    error:function(xhr, status, error){
	                        var errorMessage = xhr.status + ': ' + xhr.statusText
	                        swal('發生錯誤',errorMessage,"success")
	                        //alert('Error - ' + errorMessage);
	                    },
	                });
	            })
	            
        	})
        //卷軸滑動至底	
        $('#backDown').click(function () { $('html,body').animate({ scrollTop: document.getElementsByTagName('BODY')[0].scrollHeight}, 1000); return false; });
            
		
            
            
    </script>

<!--   </body> -->
<!-- </html> -->