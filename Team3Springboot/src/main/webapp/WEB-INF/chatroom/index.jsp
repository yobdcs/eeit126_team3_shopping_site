<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>聊天室</title>
    <%@ include file="/template/front/head.jsp"%>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.0/handlebars.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/list.js/1.1.1/list.min.js"></script>
    <!--    libs for stomp and sockjs-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.4.0/sockjs.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
    <!--    end libs for stomp and sockjs-->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" rel="stylesheet"
          type="text/css">
    <link href="${pageContext.request.contextPath}/js/style.css" rel="stylesheet">
    <link href="https://cdn.usebootstrap.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.bootcss.com/animate.css/3.5.2/animate.min.css" rel="stylesheet">
</head>
<style>
	.pAd {
		font-family: cursive;
		font-weight: bolder;
		-webkit-animation:TestMove3 0.5s infinite alternate; 
	}
	
	@-webkit-keyframes TestMove3{
	    from {color:green;}
	    to {color:red;}
	}


</style>
<body style="background-color: f0f0f0">

<%@ include file="/template/front/header.jsp"%>

<div class="row" >
    <div class="col-lg-12" style="position: relative;">
      <!-- breadcrumb-->
      <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="<c:url value='/'/>">商城首頁</a></li>
          <li aria-current="page" class="breadcrumb-item active">私人聊天室</li>
        </ol>
      </nav>
    </div>
</div>


<div id="adBlock" style="position: fixed;z-index: 2;">
	<button  class="btn-dark"  id="closeAd">x</button>
	<div>
		<a href="#"><img alt="" src="https://img.ruten.com.tw/s2/7/75/b2/22114543968690_515_m.jpg" ></a>
		<p class="pAd">&nbsp;&nbsp;GSC黏土人限量販售中!!</p>
	</div>
	
</div>

<div class="container1 clearfix wow fadeIn" data-wow-delay="1s" data-wow-iteration="infinte" dara-wow-duration="1s">
    <div class="people-list" id="people-list">
        <div class="search">     	
        	<h3><i class="fa fa-user" aria-hidden="true"></i></h3>
        	<c:choose>
        		<c:when test="${ loginBean.account.equals('manager') }">
		            <input value="${ loginBean.account }(賣家)"  readonly />
		            <input id="userName" type="hidden" value="${ loginBean.account }"  readonly />
        		</c:when>
        		<c:when test="${ loginBean.account.equals('yobdcs') }">
		            <input value="${ loginBean.account }(買家)"  readonly />
		            <input id="userName" type="hidden" value="${ loginBean.account }"  readonly />
        		</c:when>
        		<c:otherwise>
        			<input id="userName" value="${ loginBean.account }"  readonly />
        		</c:otherwise>
        	</c:choose>
<!--             <button  class="btn " onclick="registration()">Enter the chat</button> -->
            <button style="margin-top: 10px;background-image: linear-gradient( 135deg, #A0FE65 10%, #FA016D 100%);" class="btn btn-warning" onclick="fetchAll()"><i class="fa fa-refresh" aria-hidden="true"></i>Refresh</button>
<!--             <button onclick="disconnect()">Disconnect</button> -->
        </div>
        <ul class="list" id="usersList">


        </ul>
    </div>
    <div class="chat">
        <div class="chat-header clearfix">
            <img alt="avatar" height="55px" class="rounded-circle"
                 src="https://cdn.stocksnap.io/img-thumbs/960w/cat-pet_XHBLQZQP6J.jpg"
                 width="55px"/>

            <div class="chat-about">
                <div class="chat-with" id="selectedUserId"></div>
                <div class="chat-num-messages"></div>
            </div>
            
            <i class="fa fa-reddit"><i class="fa fa-twitter"></i><i class="fa fa-stack-overflow"></i>
            <i class="fa fa-twitch"></i><i class="fa fa-youtube"></i></i>
            
            
            
        </div> <!-- end chat-header -->

        <div class="chat-history">
            <ul>
				
            </ul>
        </div> <!-- end chat-history -->

        <div class="chat-message clearfix">
            <textarea id="message-to-send" name="message-to-send" placeholder="Type your message" rows="3"></textarea>

            <span>📖</span> &nbsp;&nbsp;&nbsp;
            <span>🖼</span>

            <button id="sendBtn">送出</button>

        </div> <!-- end chat-message -->
		
    </div> <!-- end chat -->

</div> <!-- end container -->



<script>
	$(document).ready(function(){
		registration();
		fetchAll();
		wow = new WOW(
				{
					boxClass:'wow',					
					animateClass:'animated',
					offset:0,
					mobile:true,
					live:true
				
				}
			);
			wow.init();
	})

</script>
<script id="message-template" type="text/x-handlebars-template">
    <li class="clearfix">
        <div class="message-data align-right">
            <span class="message-data-time">{{time}}, Today</span> &nbsp; &nbsp;
            <span class="message-data-name">使用者</span> <i class="fa fa-circle me"></i>
        </div>
        <div class="message other-message float-right">
            {{messageOutput}}
        </div>
    </li>
</script>
<script id="message-response-template" type="text/x-handlebars-template">
    <li>
        <div class="message-data">
            <span class="message-data-name"><i class="fa fa-circle online"></i> {{userName}}</span>
            <span class="message-data-time">{{time}}, Today</span>
        </div>
        <div class="message my-message">
            {{response}}
        </div>
    </li>
</script>
<script type="text/javascript">
	$('#closeAd').click(function () {
		$('#adBlock').hide();
	})


</script>
<%@ include file="/template/front/footer.jsp"%>
</body>
<script src="${pageContext.request.contextPath}/js/custom.js"></script>
<script src="${pageContext.request.contextPath}/js/chat.js"></script>
<script src="https://cdn.bootcss.com/wow/1.1.2/wow.min.js"></script>

</html>
