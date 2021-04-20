/**
 * 
 */
const jsonUrl = '/Team03ShoppingSite/gotochathistory2';
	const content = document.getElementById('content');
	const pageid = document.getElementById('pageid');	
	let jsonData = {};	
	
	fetch(jsonUrl, {method: 'get'})
	  .then((response) => {
		  
	  return response.json();
	  
	}).then((data) => {
	  jsonData = data;
	  pagination(jsonData,1);
	})

	function pagination(jsonData,nowPage) {
	  console.log(nowPage);
	  // 取得資料長度
	  const dataTotal = jsonData.length;
	
	  // 要顯示在畫面上的資料數量，預設每一頁只顯示五筆資料。
	  const perpage = 4;
	 
	  // page 按鈕總數量公式 總資料數量 / 每一頁要顯示的資料
	  // 這邊要注意，因為有可能會出現餘數，所以要無條件進位。
	  const pageTotal = Math.ceil(dataTotal / perpage);
	  
	  // 當前頁數
	  let currentPage = nowPage;  

	  // 當"當前頁數"比"總頁數"大的時候，"當前頁數"就等於"總頁數"
	  if (currentPage > pageTotal) {
	    currentPage = pageTotal;
	  }
	  
	  const minData = (currentPage * perpage) - perpage + 1 ;
	  const maxData = (currentPage * perpage) ;
	  
	  // 先建立新陣列
	  const data = [];
	  // 這邊將會使用 ES6 forEach 做資料處理
	  // 首先必須使用索引來判斷資料位子，所以要使用 index
	  jsonData.forEach((item, index) => {
	    // 獲取陣列索引，但因為索引是從 0 開始所以要 +1。
	    const num = index + 1;
	    // 這邊判斷式會稍微複雜一點
	    // 當 num 比 minData 大且又小於 maxData 就push進去新陣列。
	    if ( num >= minData && num <= maxData) {
	      data.push(item);
	    }
	  })
	  
	  // 用物件方式來傳遞資料
	  const page = {
	    pageTotal,
	    currentPage,
	    hasPage: currentPage > 1,
	    hasNext: currentPage < pageTotal,
	  }
	  	displayData(data);
	  	pageBtn(page);

	}
	
	function displayData(data) {
		  let str = '';
		  data.forEach((item) => {
			 console.log(item.fromLogin)
			
		    str +=  `
		    <div id="blog-listing" class="col-lg-9 wow fadeIn" data-wow-delay="0.5s" data-wow-iteration:"infinite" dara-wow-duration="1s">
     
              
              <div class="post">            
                <h2 class="author-category">By 使用者 &nbsp;&nbsp;<a href="#">${item.fromLogin} &nbsp;&nbsp;&nbsp;</a><img class="img-fluid rounded-circle"src="${item.image}" width="50" height="50"></h2>
                             
                
                <hr>
                <p strong="date-comments"><i class="fa fa-calendar-o"></i> ${item.time}&nbsp;&nbsp;&nbsp;<i class="fa fa-comment-o"></i>To:&nbsp;&nbsp;&nbsp;${item.acceptor}</strong>
                <p class="intro" style="font-size: 30px"> ${item.message}</p>
              </div>

            </div>`;
		  });
		  content.innerHTML = str;
		}  
	
	function pageBtn (page){
		  let str = '';
		  const total = page.pageTotal;
		  
		  if(page.hasPage) {
		    str += `<li class="page-item"><a class="page-link" href="#" data-page="${Number(page.currentPage) - 1}">Previous</a></li>`;
		  } else {
		    str += `<li class="page-item disabled"><span class="page-link">Previous</span></li>`;
		  }
		  

		  for(let i = 1; i <= total; i++){
		    if(Number(page.currentPage) === i) {
		      str +=`<li class="page-item active"><a class="page-link" href="#" data-page="${i}">${i}</a></li>`;
		    } else {
		      str +=`<li class="page-item"><a class="page-link" href="#" data-page="${i}">${i}</a></li>`;
		    }
		  };

		  if(page.hasNext) {
		    str += `<li class="page-item"><a class="page-link" href="#" data-page="${Number(page.currentPage) + 1}">Next</a></li>`;
		  } else {
		    str += `<li class="page-item disabled"><span class="page-link">Next</span></li>`;
		  }

		  pageid.innerHTML = str;
		}

		function switchPage(e){
		  e.preventDefault();
		  if(e.target.nodeName !== 'A') return;
		  const page = e.target.dataset.page;
		  pagination(jsonData, page);
		}

		pageid.addEventListener('click', switchPage);
		
		$(document).ready(function(){
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
		
		
		