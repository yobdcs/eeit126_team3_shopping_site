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
    <div id="all">
      <div id="content">
        <div class="container">
          <div class="row">
            <div class="col-lg-12">
              <!-- breadcrumb-->
<!--               <nav aria-label="breadcrumb"> -->
<!--                 <ol class="breadcrumb"> -->
<!--                   <li class="breadcrumb-item"><a href="#">Home</a></li> -->
<!--                   <li aria-current="page" class="breadcrumb-item active">Q&A</li> -->
<!--                 </ol> -->
<!--               </nav> -->
              <div id="error-page" class="row">
                <div class="col-md-12 mx-auto">
                  <div class="box text-lg-left py-5">
<!--                     <p class="text-lg-left"><img src="../img/logo.png" alt="Obaju template"></p> -->
                    
<!--                     <strong>請在此輸入提問</strong> -->
                    <!-- /#comments-->
                    <div id="comment-form" class="">
                      <div>
                        <div class="row">
                          <div class="col-md-6">
                            <div class="form-group">
                              <label for="inputTitle">標題: <span class="required">*</span></label>
                              <input id="inputTitle" name="title" type="text" class="form-control">
                            </div>
                          </div>
                        </div>
                        <div class="row">
                          <div class="col-md-6">
                            <div class="form-group">
                              <label for="inputName">使用者名: <span class="required">*</span></label>
                              <input id="inputName" name="username" type="text" class="form-control">
                            </div>
                          </div>
                        </div>
                        <div class="row">
                          <div class="col-md-9">
                            <div class="form-group">
                              <label for="inputContent">內容: <span class="required">*</span></label>
                              <textarea id="inputContent" name="content" rows="4" class="form-control"></textarea>
                            </div>
                          </div>
                        </div>
                        <div class="row">
                          <div class="col-md-12 text-right">
                            <button class="btn btn-danger" type="button" onclick="btnClear()"><i class="fa fa-trash"></i>清除</button>
                            <button class="btn btn-primary" onclick="btnSR()"><i class="fa fa-comment-o"></i>送出</button>
			                      <div style="height: 40px;" id="resp"></div>
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
                      <div class="box">
                        <div class="col-md-3 col-lg-2 text-center text-md-center">
                          <p><img src="../img/snoopy.png" alt="" class="img-fluid rounded-circle"></p>
                        </div>
                        <div class="col-md-9 col-lg-10">
                        <h3>第  ${i+1} 筆</h3>
                          <h5>${requestScope.productComment.get(i).account}</h5>
                          <h5>${productComment.get(i).title}</h5>
                          <p class="posted"><i class="fa fa-clock-o"></i>${productComment.get(i).time}</p>
                          <p>${productComment.get(i).content}</p>
                        </div>
                      </div>
                      <br>
                      <c:choose>
                      <c:when test="${productComment.get(i).msgList !=null && productComment.get(i).msgList.size()>0}">
                      <c:forEach var="j" begin="0" end="${productComment.get(i).msgList.size()-1}">
                      <!--/#post-reply-->
                        <div class="box">
                          <div class="col-md-2 col-lg-1 text-center text-md-center">
                            <p><img src="../img/giphy.gif" alt="" class="img-fluid rounded-circle"></p>
                          </div>
                          <div class="col-md-9 col-lg-10 text-right">
                            <h5>${productComment.get(i).msgList.get(j).username}</h5>
                            <p class="posted"><i class="fa fa-clock-o"></i>${productComment.get(i).msgList.get(j).time}</p>
                            <p>${productComment.get(i).msgList.get(j).content}</p>
                            <p>第 ${j+1}筆回覆</p>
                            <br>
                          </div>
                        </div>
                      </c:forEach>
                      </c:when>
                      </c:choose>
                      <button class="btnexample  btn btn-outline-info" value=${i}><i class="fa fa-reply"></i> 回覆</button>
                          <div class="hide" id=${i}>
                            <div class="col-lg text-right">
                              <strong  style="background-color: blanchedalmond;font-size: 1.5em;">*為保障交易安全請勿將個人資料洩漏於留言內容中*</strong><br>
                              <label for="input-title${i}">標題:<span class="required"></span></label>  
                              <input  id="input-title${i}" type="text" placeholder="請輸入標題" value="" required><br>
                            </div>
                            <div class="col-lg text-right">
                              <label for="input-username${i}">暱稱:<span class="required"></span></label>
                              <input  id="input-username${i}"type="text" placeholder="請輸入暱稱" value="" required><br>
                            </div>
                            <div class="col-md-12 text-right">
                              <textarea id="input-question${i}" name="question" rows="4" cols="50" required="required"></textarea><br>     	       
                              <button class="btnsubmit btn-success"  value=${i}><i class="fa fa-comment-o"></i>送出</button>
                              <button class="btnreset btn-secondary"  value=${i}><i class="fa fa-trash"></i>重新填寫</button>         
                            </div>
                          </div>
                    </div>
                    </c:forEach> 
                    </c:when>
                    
                    
                    <c:otherwise>
                    	<h4>尚無提問! </h4>
                    </c:otherwise>
                    
                    
                  </c:choose>
                    
                    <p class="buttons"><a href="<c:url value='/BackFirst'/>" class="btn btn-outline-dark"><i class="fa fa-home"></i> 回商品頁</a></p>
                    <!-- Load Facebook SDK for JavaScript -->
						<div id="fb-root"></div>
						<script>(function(d, s, id) {
							var js, fjs = d.getElementsByTagName(s)[0];
							if (d.getElementById(id)) return;
							js = d.createElement(s); js.id = id;
							js.src = "https://connect.facebook.net/en_US/sdk.js#xfbml=1&version=v3.0";
							fjs.parentNode.insertBefore(js, fjs);
							}(document, 'script', 'facebook-jssdk'));</script>
							
							<!-- Your share button code -->
							<div class="fb-share-button" 
							data-href="http://localhost:8080/Team03ShoppingSite/MessageBoard/GetAllMsg.controller" 
							data-layout="button_count">
						</div>
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

    <!--js程式-->
    <script>
            function btnClear(){
                document.getElementById("inputTitle").value="";
                document.getElementById("inputName").value="";
                document.getElementById("inputContent").value="";
            }
            
            function btnSR(){		
              var buildresult = document.getElementById("resp");
              var inputTitleVal=document.getElementById("inputTitle").value;
              var inputNameVal=document.getElementById("inputName").value;
              var inputContentVal = document.getElementById("inputContent").value;
              var productid = $('#msgProductId').val();

              console.log(productid)
              console.log(inputContentVal)
              var xhr = new XMLHttpRequest();
              
              if (xhr !=null) {
                xhr.open('post',"<c:url value='/MessageBoard/insertSuccessAjax' />");
                xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
                xhr.send("title="+inputTitleVal+"&username="+inputNameVal+"&content="+inputContentVal+"&productId="+productid);
              } else {
                buildresult.innerHTML = "<h3>您的瀏覽器不支援Ajax</h3>";
              }                
              xhr.onreadystatechange = function(){
                if(xhr.readyState ==4 &&xhr.status == 200){
                  
                  buildresult.innerHTML = "<h3>" +xhr.responseText+"</h3>";
                  window.location.reload();
                }
              }
            }
            
            $(document).ready(function(){

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
                            alert('查詢失敗');
                        }
                    },
                    error:function(xhr, status, error){
                        var errorMessage = xhr.status + ': ' + xhr.statusText
                        alert('Error - ' + errorMessage);
                    },
                });





                
                function dateFormat(fmt, date) {
                  let ret;
                  const opt = {
                      "Y+": date.getFullYear().toString(),        // 年
                      "m+": (date.getMonth() + 1).toString(),     // 月
                      "d+": date.getDate().toString(),            // 日
                      "H+": date.getHours().toString(),           // 时
                      "M+": date.getMinutes().toString(),         // 分
                      "S+": date.getSeconds().toString()          // 秒
                      // 有其他格式化字符需求可以继续添加
                  };
                  for (let k in opt) {
                      ret = new RegExp("(" + k + ")").exec(fmt);
                      if (ret) {
                          fmt = fmt.replace(ret[1], (ret[1].length == 1) ? (opt[k]) : (opt[k].padStart(ret[1].length, "0")))
                      };
                  };
                  return fmt;
                }
        	      let date = new Date()
                var formatDate=dateFormat("YYYY-mm-dd HH:MM:SS", date)
     
                $('.hide').hide();
                  
                $('.btnexample').click(function(){
                      var iii = document.getElementById(this.value);
                      $(iii).slideToggle(250);
                  })
                  
                $('.btnreset').click(function(){			
                  $('#input-title'+this.value).val("");        
                  $('#input-username'+this.value).val("");
                  $('#input-question'+this.value).val("");
                })
                
                $(".btnsubmit").click(function(){
                    var title=$('#input-title'+this.value).val();
                    var username=$('#input-username'+this.value).val();
                    var content=$('#input-question'+this.value).val();
                    var fkid=$('#fkid'+this.value).val();
                
	                $.ajax({
	                    type: "post",
	                    url: "/Team03ShoppingSite/MessageBoard/insertReplyAjax",
	                    data: 'id='+fkid+'&title='+title+'&username='+username+'&content='+content+'&time='+formatDate,                    	
	                    cache : true,
	                    async: true,
	                    dataType: "text",
	                    contentType:"application/x-www-form-urlencoded",
	                    success: function (data) {
	                        if (data.title != '') {
	                            alert('提問成功');
	                            window.location.reload();
	                        }else{
	                            alert('提問失敗');
	                        }
	                    },
	                    error:function(xhr, status, error){
	                        var errorMessage = xhr.status + ': ' + xhr.statusText
	                        alert('Error - ' + errorMessage);
	                    },
	                });
	            })
        	})
    </script>

<!--   </body> -->
<!-- </html> -->