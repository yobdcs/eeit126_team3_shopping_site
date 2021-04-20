<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>留言統計</title>
    <%@ include file="/template/manager/head.jsp"%>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.10.3/sweetalert2.css" />
  <script src="https://cdn.jsdelivr.net/npm/chart.js@3.1.0/dist/chart.min.js"></script>
  <script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
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
            <h3 class="alert alert-default">統計數據圖</h3>
            
<!--             <div class="table-responsive">  -->
              
<!--             </div> -->
            <!-- Example single danger button -->
            <div class="btn-group dropup">
			  <button type="button" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
			    看不同圖表
			  </button>
			  <div class="dropdown-menu">
			    <!-- Dropdown menu links -->
			    <a class="dropdown-item" href="#" id="BarChart">長條圖</a>
			    <a class="dropdown-item" href="#" id="PieChart">圓餅圖</a>
			    <div class="dropdown-divider"></div>
			    <a class="dropdown-item" href="#" id="RaderChart">雷達圖</a>
			  </div>
			</div>
            <br>
            <div id="BarChartShow">
            	<div>
            		<h3 style="color:red;">月份銷售數量統計</h3>
            		<canvas id="myChart1" width="100" height="40"></canvas>
            		
            	</div>
            </div>
      		<div id="chartContainer" align="left" >
         		
        	</div>
            <div id="RaderChartShow">
            	<div>
            		<canvas id="myChart3" width="100" height="40"></canvas>
            	</div>
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
</body>
<script type="text/javascript">
$(document).ready(function(){

	var xhr = new XMLHttpRequest();
	xhr.open("GET", "<c:url value='/MessageBoard/getOrders.controller'/>", true);
	xhr.send();
	
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && xhr.status == 200){
			var olist = JSON.parse(xhr.responseText);

			dec = 0; jan = 0; feb = 0; mar = 0; apr = 0;
			
			for(let i = 0 ; i < olist.length ; i ++){
				var temp = olist[i].slice(5, 7);
				switch (Number(temp)) {
				case 12:
					dec ++;
					break;
				case 1:
					jan ++;
					break;
				case 2:
					feb ++;
					break;
				case 3:
					mar ++;
					break;
				case 4:
					apr ++;
					break;
				default :
					break;
				}
			}

			var barChart = new Chart(ctx1, {
			    type: 'bar',
			    data: {
			        labels: ['12月', '1月', '2月', '3月', '4月'],
			        datasets: [{
			            backgroundColor: [
			                'rgba(255, 99, 132, 0.2)',
			                'rgba(54, 162, 235, 0.2)',
			                'rgba(255, 206, 86, 0.2)',
			                'rgba(75, 192, 192, 0.2)',
			                'rgba(153, 102, 255, 0.2)'
			            ],
			            borderColor: [
			                'rgba(255, 99, 132, 1)',
			                'rgba(54, 162, 235, 1)',
			                'rgba(255, 206, 86, 1)',
			                'rgba(75, 192, 192, 1)',
			                'rgba(153, 102, 255, 1)'
			            ],
			            borderWidth: 10,
			            label:'銷售量',
			            data:[dec, jan, feb, mar, apr]
			        },{
			           type:'line',
			           label:'用戶人數',
			           data:[0,0,0,0,0]    
			        }]
			    },  
			    options: {
			        scales: {
			            yAxes: [{
			                id:'main-axis',
			                ticks: {stepSize: 2}
			                   }]
			        }
			    }
			});
	}	
	}


	$('#RaderChartShow').hide();
	$('#chartContainer').hide();
	
	var ctx1 = document.getElementById('myChart1').getContext('2d');
	var ctx3 = document.getElementById('myChart3').getContext('2d');

	$('#BarChart').click(function(){
		$('#RaderChartShow').hide();
		$('#BarChartShow').show();
		$('#chartContainer').hide();
	})
	
	$('#PieChart').click(function(){
		$('#RaderChartShow').hide();
		$('#BarChartShow').hide();

		var xhr = new XMLHttpRequest();
		xhr.open("GET", "<c:url value='/MessageBoard/getProducts.controller'/>", true);
		xhr.send();
		
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200){
				var catelist = JSON.parse(xhr.responseText);

				c = 0; fur = 0; clo = 0; toys = 0; exe = 0; pets = 0; lux = 0; cos = 0; foods = 0; others = 0;
				for(let j = 0 ; j < catelist.length ; j ++){
					var cate = catelist[j];
					switch (cate) {
					case "3C":
						c ++;
						break;
					case "furnitures":
						fur ++;
						break;
					case "clothes":
						clo ++;
						break;
					case "toys":
						toys ++;
						break;
					case "exercise":
						exe ++;
						break;
					case "pets":
						pets ++;
						break;
					case "luxuries":
						lux ++;
						break;
					case "cosmetics":
						cos ++;
						break;
					case "foods":
						foods ++;
						break;
					case "others":
						others ++;
						break;
					default :
						break;
					}
				}

				var chart2 = new CanvasJS.Chart("chartContainer", {
					animationEnabled: true,
					title:{
						text: "商品分類",
						horizontalAlign: "left"
					},
					data: [{
						type: "doughnut",
						startAngle: 60,
						//innerRadius: 60,
						indexLabelFontSize: 17,
						indexLabel: "{label} - #percent%",
						toolTipContent: "<b>{label}:</b> {y} (#percent%)",
						dataPoints: [
							{ y: c, label: "3C" },
							{ y: clo, label: "服飾"},
							{ y: fur, label: "家電"},
							{ y: foods, label: "食品"},
							{ y: exe, label: "運動"},
							{ y: cos, label: "美妝"},
							{ y: lux, label: "精品"},
							{ y: pets, label: "寵物"},
							{ y: toys, label: "玩具"},
							{ y: others, label: "其他"}
						]
					}]
				});
				chart2.render();
				
			}
		}

		$('#chartContainer').show();
		
	})
	
	$('#RaderChart').click(function(){
		$('#BarChartShow').hide();
		$('#chartContainer').hide();
		
		var xhr = new XMLHttpRequest();
		xhr.open("GET", "<c:url value='/MessageBoard/getGender.controller'/>", true);
		xhr.send();
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				var list = JSON.parse(xhr.responseText);

				cmale = 0; furmale = 0; clomale = 0; toysmale = 0;
				exemale = 0; petsmale = 0; luxmale = 0; cosmale = 0;
				foodsmale = 0; othersmale = 0;
					
				cfemale = 0; furfemale = 0; clofemale = 0; toysfemale = 0;
				exefemale = 0; petsfemale = 0; luxfemale = 0; cosfemale = 0;
				foodsfemale = 0; othersfemale = 0;

				for(let i = 0 ; i < list.length ; i ++){
					for(let j = 0 ; j < list[i].itemList.length ; j ++){
						if(list[i].itemList[j].product.productCategory === "3C" && list[i].buyer.gender === "male")
							cmale ++;
						if(list[i].itemList[j].product.productCategory === "3C" && list[i].buyer.gender === "female")
							cfemale ++;
						
						if(list[i].itemList[j].product.productCategory === "furnitures" && list[i].buyer.gender === "male")
							furmale ++;
						if(list[i].itemList[j].product.productCategory === "furnitures" && list[i].buyer.gender === "female")
							furfemale ++;
						
						if(list[i].itemList[j].product.productCategory === "clothes" && list[i].buyer.gender === "male")
							clomale ++;
						if(list[i].itemList[j].product.productCategory === "clothes" && list[i].buyer.gender === "female")
							clofemale ++;		
						
						if(list[i].itemList[j].product.productCategory === "toys" && list[i].buyer.gender === "male")
							toysmale ++;
						if(list[i].itemList[j].product.productCategory === "toys" && list[i].buyer.gender === "female")
							toysfemale ++;
						
						if(list[i].itemList[j].product.productCategory === "exercise" && list[i].buyer.gender === "male")
							exemale ++;
						if(list[i].itemList[j].product.productCategory === "exercise" && list[i].buyer.gender === "female")
							exefemale ++;		
						
						if(list[i].itemList[j].product.productCategory === "pets" && list[i].buyer.gender === "male")
							petsmale ++;
						if(list[i].itemList[j].product.productCategory === "pets" && list[i].buyer.gender === "female")
							petsfemale ++;		
						
						if(list[i].itemList[j].product.productCategory === "luxuries" && list[i].buyer.gender === "male")
							luxmale ++;
						if(list[i].itemList[j].product.productCategory === "luxuries" && list[i].buyer.gender === "female")
							luxfemale ++;		
						
						if(list[i].itemList[j].product.productCategory === "cosmetics" && list[i].buyer.gender === "male")
							cosmale ++;
						if(list[i].itemList[j].product.productCategory === "cosmetics" && list[i].buyer.gender === "female")
							cosfemale ++;		
						
						if(list[i].itemList[j].product.productCategory === "foods" && list[i].buyer.gender === "male")
							foodsmale ++;
						if(list[i].itemList[j].product.productCategory === "foods" && list[i].buyer.gender === "female")
							foodsfemale ++;		
						
						if(list[i].itemList[j].product.productCategory === "others" && list[i].buyer.gender === "male")
							othersmale ++;
						if(list[i].itemList[j].product.productCategory === "others" && list[i].buyer.gender === "female")
							othersfemale ++;
					}
				}
				
				var radarChart = new Chart(ctx3, {
				    type: 'radar',
				    data: {
				    
			   		  labels: [
			   			    '3C',
			   			    '家電',
			   			    '服飾',
			   			    '玩具',
			   			    '運動',
			   			    '寵物',
			   			    '精品',
			   			    '美妝',
			   			    '食品',
			   			    '其他'
			   			    
			   			  ],datasets: [{
			   			    label: '用戶性別(女)',
			   			    data: [cfemale, furfemale, clofemale, toysfemale, exefemale, petsfemale, luxfemale,
			   			    	cosfemale, foodsfemale, othersfemale],
			   			    fill: true,
			   			    backgroundColor: 'rgba(255, 99, 132, 0.2)',
			   			    borderColor: 'rgb(255, 99, 132)',
			   			    pointBackgroundColor: 'rgb(255, 99, 132)',
			   			    pointBorderColor: '#fff',
			   			    pointHoverBackgroundColor: '#fff',
			   			    pointHoverBorderColor: 'rgb(255, 99, 132)'
			   			  }, {
			   			    label: '用戶性別(男)',
			   			    data: [cmale, furmale, clomale, toysmale, exemale, petsmale, luxmale,
			   			    	cosmale, foodsmale, othersmale],
			   			    fill: true,
			   			    backgroundColor: 'rgba(99, 123, 235, 0.2)',
			   			    borderColor: 'rgb(54, 162, 235)',
			   			    pointBackgroundColor: 'rgb(54, 162, 235)',
			   			    pointBorderColor: '#fff',
			   			    pointHoverBackgroundColor: '#fff',
			   			    pointHoverBorderColor: 'rgb(54, 162, 235)'
			   			  }]
				    },
					    options:{
					     
					        scales:{
						        r:{
						     
							    	pointLabels:{
										font:{
											size:20,
											
										}
									}
							    }
						    }
			   				
					      },
					});

			
						
				}
		}
		
		
		$('#RaderChartShow').show();

	})
	
		})
</script>

</html>