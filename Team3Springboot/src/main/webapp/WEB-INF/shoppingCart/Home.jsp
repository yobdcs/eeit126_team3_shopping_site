<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
  <head>
<%@ include file="/template/front/head.jsp"%>

  </head>
  <style>
  #pppp{
	  position: fixed;
	  font-size: 15px;
   	  top: auto;
	  left:10px;
	  -webkit-animation:TestMove3 1s infinite alternate; 
  	 
  }
/*   #pppp1{ */
/*   	  position: fixed; */
/*   	  font-size: 15px; */
/*  	  top: auto; */
/*  	  bottom: auto; */
/* 	  left:10px; */
/* 	  -webkit-animation:TestMove3 1s infinite alternate;  */
/*   } */
  @-webkit-keyframes TestMove3{
    from {color:blue;}
    to {color:red;}
	}
	
	.boxbox{
	  top:400px;
      border: 1px blanchedalmond solid;
      border-radius:5px;
      float: left;
      position: fixed;
      box-shadow: 5px 5px 5px #888888;
      font-family:cursive;
      background-color: peachpuff;
      
    }
    
    .masked {
            display: block;
            /*渐变背景*/
            background-image: -webkit-linear-gradient(left, #3498db, #f47920 10%, #d71345 20%, #f7acbc 30%,
            #ffd400 40%, #3498db 50%, #f47920 60%, #d71345 70%, #f7acbc 80%, #ffd400 90%, #3498db);
            color: transparent; /*文字填充色为透明*/
            -webkit-text-fill-color: transparent;
            -webkit-background-clip: text;          /*背景剪裁为文字，只将文字显示为背景*/
            background-size: 200% 100%;            /*背景图片向水平方向扩大一倍，这样background-position才有移动与变化的空间*/
            /* 动画 */
            animation: masked-animation 4s infinite linear;
      }
      @keyframes masked-animation {
            0% {
                background-position: 0 0;   /*background-position 属性设置背景图像的起始位置。*/
            }
            100% {
                background-position: -100% 0;
            }
      }
      
  </style>
  <body>
 <%@ include file="/template/front/header.jsp"%>
    <div id="all">
      <div id="content">
<!--         <div class="container"> -->
<!--           <div class="row"> -->
<!--             <div class="col-md-12"> -->
<!--               <div id="main-slider" class="owl-carousel owl-theme"> -->
<!--                 <div class="item"><img src="img/main-slider1.jpg" alt="" class="img-fluid"></div> -->
<!--                 <div class="item"><img src="img/main-slider2.jpg" alt="" class="img-fluid"></div> -->
<!--                 <div class="item"><img src="img/main-slider3.jpg" alt="" class="img-fluid"></div> -->
<!--                 <div class="item"><img src="img/main-slider4.jpg" alt="" class="img-fluid"></div> -->
<!--               </div> -->
<!--               /#main-slider -->
<!--             </div> -->
<!--           </div> -->
<!--         </div> -->
		<div id="divAdv">
			<button  class="btn-dark" style="position:fixed;top:180px;left:150px;" id="closeAd">關閉</button>
			<div style="position:fixed" id="ad">
				<img alt="" src="https://tse2.mm.bing.net/th?id=OIP.A0G3jK7RfqlRrp9EawwnIgHaHa&pid=Api&P=0&w=150&h=150">
				<h3 id="pppp" >水果相關商品特價中!!<br>快到3C區看看吧~~</h3>
			</div>
	
			<div style="position: fixed"  id="ad2">
				<img alt="" src="https://tse3.mm.bing.net/th?id=OIP.DKp8wTkccyDsJXN4QipX9wHaH6&pid=Api&P=0&w=150&h=150">
				<h3 id="pppp" >水果相關商品特價中!!<br>快到3C區看看吧~~</h3>
			</div>
			
			<div class="boxbox">
		      <img  style="width: 150px;"id="img_ch" src="https://img.ruten.com.tw/s5/00d/3b5/irock/1/16/7b/22109020970619_273_m.jpg" />
		      <p class="masked">&nbsp;商城小物即將發售<br>~~敬請期待~~</p>
		    </div>
 		</div>
		    
			<div style="position: fixed; right:20px; display:none; "  id="qaRemind">
				<img alt="" style="width:50px;"src="https://icons.iconarchive.com/icons/webalys/kameleon.pics/512/Bell-icon.png">
			</div>
        <div id="advantages">
          <div class="container">
            <div class="row mb-4">
            
              <div class="col-md-3">
                <div class="box d-flex flex-column justify-content-center mb-0 h-100">
				  <p>生活家電</p>
				  <a href="/Team03ShoppingSite/product/goCostumerListByCategory?category=家電">
				  <img src="${pageContext.request.contextPath}/image/imaaaage/furniture.jpg" alt="" class="img-fluid"></a>
				  <br>
<!--                   <p>get your own taiko now!!</p> -->
                </div>
              </div>
              
              <div class="col-md-3">
                <div class="box d-flex flex-column justify-content-center mb-0 h-100">
				  <p>玩具</p>
				  <a href="/Team03ShoppingSite/product/goCostumerListByCategory?category=玩具">
				  <img src="${pageContext.request.contextPath}/image/imaaaage/toy.jpg" alt="" class="img-fluid"></a>
				  <br>
<!--                   <p>get your own taiko now!!</p> -->
                </div>
              </div>
              
              <div class="col-md-3">
                <div class="box d-flex flex-column justify-content-center mb-0 h-100">
				  <p>流行服飾</p>
				  <a href="/Team03ShoppingSite/product/goCostumerListByCategory?category=衣服">
				  <img src="${pageContext.request.contextPath}/image/imaaaage/cloth.jpg" alt="" class="img-fluid"></a>
				  <br>
<!--                   <p>get your own taiko now!!</p> -->
                </div>
              </div>
              
              <div class="col-md-3">
                <div class="box d-flex flex-column justify-content-center mb-0 h-100">
				  <p>精品</p>
				  <a href="/Team03ShoppingSite/product/goCostumerListByCategory?category=精品">
				  <img src="${pageContext.request.contextPath}/image/imaaaage/luxr.jpg" alt="" class="img-fluid"></a>
				  <br>
<!--                   <p>get your own taiko now!!</p> -->
                </div>
              </div>
              
            </div>
          </div>
        </div>
        <br>
        <!-- /#advantages-->
        <!-- *** ADVANTAGES END ***-->
        <!--
        *** HOT PRODUCT SLIDESHOW ***
        _________________________________________________________
        -->
        <div id="hot">
          <div class="container">
            	<h3>隨選商品</h3>
            <div class="product-slider owl-carousel owl-theme">
        <c:forEach var="i" begin="0" end="9">
              <div class="item">
                <div class="product">
                  <div class="flip-container">
                    <div class="flipper">
                      <div class="front"><div style="height: 220px; display: flex; align-items: center; justify-content: center; background-color:#f0f0f0; overflow: hidden;"><a href="/Team03ShoppingSite/product/infoProduct/?infoId=${ customerList.get(ranindex.get(i)).productId }&index=${ ranindex.get(i) }&uid=${ customerList.get(ranindex.get(i)).userName }">
                      	<img src="${pageContext.request.contextPath}/image/${ customerList.get(ranindex.get(i)).userName }${ customerList.get(ranindex.get(i)).productName }.jpg" alt="" style="max-width: 100%; max-height: 100%; "></a></div></div>
                      <div class="back"><div style="height: 220px; display: flex; align-items: center; justify-content: center; background-color:#f0f0f0; overflow: hidden;"><a href="/Team03ShoppingSite/product/infoProduct/?infoId=${ customerList.get(ranindex.get(i)).productId }&index=${ ranindex.get(i) }&uid=${ customerList.get(ranindex.get(i)).userName }">
                      	<img src="${pageContext.request.contextPath}/image/${ customerList.get(ranindex.get(i)).userName }${ customerList.get(ranindex.get(i)).productName }.jpg" alt="" style="max-width: 100%; max-height: 100%; "></a></div></div>
                    </div>
                  </div>
                  <div style="height: 220px; display: flex; align-items: center; justify-content: center; background-color:#f0f0f0; overflow: hidden;">
                  <a href="/Team03ShoppingSite/product/infoProduct/?infoId=${ customerList.get(ranindex.get(i)).productId }&index=${ ranindex.get(i) }&uid=${ customerList.get(ranindex.get(i)).userName }" class="invisible">
                  	<img src="${pageContext.request.contextPath}/image/${ customerList.get(ranindex.get(i)).userName }${ customerList.get(ranindex.get(i)).productName }.jpg" alt="" style="max-width: 100%; max-height: 100%; "></a>
                  	</div>
                </div>
              </div>
        </c:forEach>
            </div>
          </div>
        </div>
        
       <div id="hot">
          <div class="container">
          	<h3>隨選分類</h3>
            <div class="product-slider owl-carousel owl-theme">
       	<c:set var="m" value="0" scope="page" />
        <c:forEach var="i" begin="0" end="${ customerList.size() - 1 }">
        	<c:if test="${ customerList.get(i).productCategory.equals(rancate) && m < 10 }">
              <div class="item">
                <div class="product">
                  <div class="flip-container">
                    <div class="flipper">
                      <div class="front"><div style="height: 220px; display: flex; align-items: center; justify-content: center; background-color:#f0f0f0; overflow: hidden;"><a href="/Team03ShoppingSite/product/infoProduct/?infoId=${ customerList.get(i).productId }&index=${ i }&uid=${ customerList.get(i).userName }">
                      	<img src="${pageContext.request.contextPath}/image/${ customerList.get(i).userName }${ customerList.get(i).productName }.jpg" alt="" style="max-width: 100%; max-height: 100%; "></a></div></div>
                      <div class="back"><div style="height: 220px; display: flex; align-items: center; justify-content: center; background-color:#f0f0f0; overflow: hidden;"><a href="/Team03ShoppingSite/product/infoProduct/?infoId=${ customerList.get(i).productId }&index=${ i }&uid=${ customerList.get(i).userName }">
                      	<img src="${pageContext.request.contextPath}/image/${ customerList.get(i).userName }${ customerList.get(i).productName }.jpg" alt="" style="max-width: 100%; max-height: 100%; "></a></div></div>
                    </div>
                  </div>
                  <div style="height: 220px; display: flex; align-items: center; justify-content: center; background-color:#f0f0f0; overflow: hidden;">
                  <a href="/Team03ShoppingSite/product/infoProduct/?infoId=${ customerList.get(i).productId }&index=${ i }&uid=${ customerList.get(i).userName }" class="invisible">
                  	<img src="${pageContext.request.contextPath}/image/${ customerList.get(i).userName }${ customerList.get(i).productName }.jpg" alt="" style="max-width: 100%; max-height: 100%; "></a>
                  	</div>
                </div>
              </div>
       		<c:set var="m" value="${ m + 1 }" scope="page" />
        	</c:if>
        </c:forEach>
            </div>
          </div>
        </div>

      </div>
    </div>


<%@ include file="/template/front/footer.jsp"%>
  </body>
  <script>
  	var memberId = "${ sessionScope.loginBean.memberId }";
  	if(memberId != ""){
  	  	checkReturnCase(Number(memberId));
  		checkProductMessage(Number(memberId));
  		checkReportCase(Number(memberId));
  	}

  	$('#ad').mouseover(function(){
  		$(this).hide()
  		$('#ad2').show()
  	})
  	
  	$('#ad2').mouseout(function(){
  		$(this).hide()
  		$('#ad').show()
  	})
  	
  	$('#closeAd').click(function(){
  		$('#divAdv').hide();
  	})

  	function checkReturnCase(mid){
  		var xhr = new XMLHttpRequest();
		xhr.open("POST", "<c:url value='/shoppingCart/transactionBack/checkReturnCase'/>", true);
		xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		xhr.send("mid=" + mid);

		xhr.onreadystatechange = function(){
			if (xhr.readyState == 4 && xhr.status == 200) {
				var list = JSON.parse(xhr.responseText);
				if(list.length == 0)
					return;

				var str = "";
				for(let i = 0 ; i < list.length - 1 ; i ++)
					str += list[i].order.orderID + ", ";
				str += list[list.length - 1].order.orderID;
				
				swal('您有'+ list.length +'件退貨案件待回覆', '請確認以下訂單 : '+ str , 'warning');
			}
		}
  	}


  	function checkReportCase(mid){
  		var xhr = new XMLHttpRequest();
		xhr.open("POST", "<c:url value='/product/alertReportToMember'/>", true);
		xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		xhr.send("mid=" + mid);

		xhr.onreadystatechange = function(){
			if (xhr.readyState == 4 && xhr.status == 200) {
				var list = JSON.parse(xhr.responseText);
				if(list.length == 0)
					return;

				var str = "";
				for(let i = 0 ; i < list.length - 1 ; i ++)
					str += list[i].productName + ",<br>";
				str += list[list.length - 1].productName;
				
				swal('您有'+ list.length +'件商品被管理員下架', '以下商品不符合網站規定 :<br> '+ str , 'warning');
			}
		}
  	}

  	

  	function checkProductMessage(userid){
  		var xhr = new XMLHttpRequest();
  		xhr.open("POST","<c:url value='/MessageBoard/checkProductMsg'/>",true);
  		xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
  		xhr.send("LoginMemberId=" + userid);
  		
  		xhr.onreadystatechange = function(){
			if (xhr.readyState == 4 && xhr.status == 200) {
				var list = JSON.parse(xhr.responseText);
				if(list.length == 0)
					return;

				var ring = document.getElementById('qaRemind');
				ring.style.display = "";
				
				var str = "";
				for(let i = 0; i<list.length ; i++)
					str += Number(i + 1) + "、" + list[i].product + "<br>";
				$('#qaRemind').click(function(){
					swal('有'+list.length+'人對你的商品提問了', '包括以下商品:'+"<br>"+str,'warning');
					
				})
				
				
				
			}
		}
  	}
  	


  	  var i=0;
  	  var j=1;
  	        function change_the_back(j)
  	        {   
  	            var oChg=document.getElementById('img_ch');
  	            
  	            if(j==1)
  	            {
  	            if(i==4)i=-1;                       
  	                i++;                    
  	            }
  	            else if(j==2){
  	            if(i==0)i=5;                                            
  	                i--;
  	            }
  	                switch (i)
  	                {
  	                    case 0:oChg.src='https://img.ruten.com.tw/s2/a/02/1c/21938915649052_425_m.jpg';
  	                        break;
  	                    case 1:oChg.src='https://img.ruten.com.tw/s1/d/a2/3d/21916978118205_406_m.jpg';
  	                        break;
  	                    case 2:oChg.src='https://img.ruten.com.tw/s2/e/33/ea/21938864543722_871_m.jpg';
  	                        break;
  	                    case 3:oChg.src='https://img.ruten.com.tw/s1/a/02/17/21937815692823_572_m.jpg';
  	                        break;
  	                    case 4:oChg.src='https://img.ruten.com.tw/s1/1/39/0d/21946853572877_371_m.jpg';
  	                        break;                          
  	                }               
  	        }
  	    
  	    window.setInterval(showalert, 5000);
  	      function showalert(){
  	          change_the_back(1);
  	      }
  	      
  </script>
</html>