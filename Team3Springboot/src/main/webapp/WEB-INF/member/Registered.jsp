<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>註冊新會員</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.10.3/sweetalert2.css" />
<%@ include file="/template/front/head.jsp"%>
</head>
<body>
<%@ include file="/template/front/header.jsp"%>

<div id="all">
      <div id="content">
        <div class="container">
          <div class="row">
            <div class="col-lg-12">
              <!-- breadcrumb-->
              <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item"><a href="<c:url value='/home' />">首頁</a></li>



                  <li aria-current="page" class="breadcrumb-item active">註冊新會員</li>

                </ol>
              </nav>
            </div>
            <div class="col-lg-12">
              <div class="box">
                <h1>註冊新會員</h1>
                <p class="lead">還沒有帳號嗎? 註冊過程只需一分鐘且能為您帶來更多優惠與服務!</p>
                <p class="text-muted">有任何疑問時請<a href="contact.html">聯絡我們</a>，我們會盡速為您服務!</p>
                <hr>
                <!-- <form action="" method="post"> -->
                <div class="row">
                	<div class="col-lg-6">
                		<div class="form-group">
                    		<label for="account">帳號</label><span style="color:red" id="accounttext"></span>
                    		<input id="account" type="text" class="form-control">
                  		</div>
                  		<div class="form-group">
		                    <label for="password">密碼</label><span style="color:red" id="passwordtext"></span>
		                    <input id="password" type="password" class="form-control">
		                </div>
		                <div class="form-group">
		                    <label for="chkpassword">密碼確認</label><span style="color:red" id="chkpasswordtext"></span>
		                    <input id="chkpassword" type="password" class="form-control">
		                </div>
		                <div class="form-group">
		                    <label for="memberName">姓名</label><span style="color:red" id="memberNametext"></span>
		                    <input id="memberName" type="text" class="form-control">
		                </div>
		                <div class="form-group">
		                    <div><label for="gender">性別</label><span style="color:red" id="gendertext"></span></div>
		                    <input id="gender" type="hidden" class="form-control">
			                <div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" name="sex" id="male" value="male">
								<label class="form-check-label" for="male">男</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" name="sex" id="female" value="female">
								<label class="form-check-label" for="female">女</label>
							</div>
		                </div>
		                <div class="form-group">
		                    <label for="memberBirth">生日</label><span style="color:red" id="memberBirthtext"></span>
		                    <input id="memberBirth" type="date" class="form-control">
		                </div>
		                <div class="form-group">
		                    <label for="email">Email</label><span style="color:red" id="emailtext"></span>
		                    <input id="email" type="text" class="form-control">
		                </div>
		                <div class="form-group">
		                    <label for="address">地址</label><span style="color:red" id="addresstext"></span>
		                    <input id="address" type="text" class="form-control">
		                </div>
	                </div>
	                <div class="col-lg-6">
	                	<div class="form-group">
		                    <label for="photo">圖片</label>
		                    <input id="photo" type="file" class="form-control">
		                </div>
		                <div class="form-group">
		                    <img id="previewPhoto" width='100%'>
		                    <img id="returnPhoto" width='100%'>
		                </div>
	                </div>
	                <div class="col-lg-12">
	                	<div class="text-center">
		                    <button type="button" class="btn btn-primary" id="register"><i class="fa fa-user-md"></i> 註冊</button>
		                    <button type="button" class="btn btn-primary" id="quickenter">一鍵輸入</button>
		                    <button type="button" class="btn btn-primary" id="googleRegister" style="display:none"><i class="fa fa-google"></i> 使用GOOGLE註冊</button>
		                    <button type="button" class="btn btn-primary" id="googledisconnect" style="display:none"><i class="fa fa-google"></i> 取消GOOGLE註冊</button>
		                </div>
	                </div>
                </div>
                <!-- </form> -->
              </div>
            </div>
            
          </div>
        </div>
      </div>
    </div>

<%@ include file="/template/front/footer.jsp"%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.10.3/sweetalert2.js" type="text/javascript"></script>
<script>
window.onload = function(){
	var sex = document.getElementsByName("sex");
	for(let i=0;i<sex.length;i++){
		sex[i].addEventListener("click",sexonclick);
    }
    function sexonclick(){
		console.log(this.value);
		var sexchosen=document.getElementById("gender");
		sexchosen.value=this.value;
    }
	var register = document.getElementById("register");
	register.onclick = function(){
		var flag = 0;
		var account = document.getElementById("account");
		var password = document.getElementById("password");
		var chkpassword = document.getElementById("chkpassword");
		var memberName = document.getElementById("memberName");
		var gender = document.getElementById("gender");
		var memberBirth = document.getElementById("memberBirth");
		var email = document.getElementById("email");
		var address = document.getElementById("address");
		//輸入提示
		var accounttext = document.getElementById("accounttext");
		var passwordtext = document.getElementById("passwordtext");
		var chkpasswordtext = document.getElementById("chkpasswordtext");
		var memberNametext = document.getElementById("memberNametext");
		var gendertext = document.getElementById("gendertext");
		var memberBirthtext = document.getElementById("memberBirthtext");
		var emailtext = document.getElementById("emailtext");
		var addresstext = document.getElementById("addresstext");
		
		
		if(account.value == ""){
			console.log(account.value);
			accounttext.innerHTML=" 請輸入帳號";
			flag++;
		}else{
			checkAccExis(account.value, flag);
		}
		
		if(memberName.value == ""){
			memberNametext.innerHTML=" 請輸入姓名";
			flag++;
		}else memberNametext.innerHTML="";
		
		if(gender.value == ""){
			gendertext.innerHTML=" 請選擇性別";
			flag++;
		}else gendertext.innerHTML="";
		
		if(memberBirth.value == ""){
			memberBirthtext.innerHTML=" 請輸入生日";
			flag++;
		}else memberBirthtext.innerHTML="";
		
		if(email.value == ""){			
			emailtext.innerHTML=" 請輸入信箱";
			flag++;
		}else emailtext.innerHTML="";
		
		if(address.value == ""){			
			addresstext.innerHTML=" 請輸入地址";
			flag++;
		}else addresstext.innerHTML="";
		
		if(password.value == ""){			
			passwordtext.innerHTML=" 請輸入密碼";
			flag++;
		}else passwordtext.innerHTML="";
		if(password.value != chkpassword.value){
			chkpasswordtext.innerHTML=" 您輸入的兩個密碼並不相符。";
			flag++;
		}
		if(flag === 0){
			registeredNewMember();
		}else{
			swal({ title:"註冊失敗",
          	   html:"請檢查輸入的資料",
          	   type:"error",
          	   timer:2000,
             }).catch(function(timeout) { });
		}
	}
	
	var photo = document.getElementById("photo");
	photo.onchange = function(){
		var previewPhoto = document.getElementById("previewPhoto");
		//previewPhoto.src = window.URL.createObjectURL(this.files[0]);
		var fr1 = new FileReader();
		fr1.readAsDataURL(photo.files[0]);
		fr1.onload = function (){
			previewPhoto.src = this.result;
	    }
	}

	//一鍵輸入
	document.getElementById("quickenter").onclick=function(){
		document.getElementById("account").value="vhessel";
		document.getElementById("password").value="asd123";
		document.getElementById("chkpassword").value="asd123";
		document.getElementById("memberName").value="周嘉";
		document.getElementById("female").checked=true;
		document.getElementById("gender").value="female";
		document.getElementById("memberBirth").value="1961-10-17";
		document.getElementById("email").value="vhessel@gmail.com";
		document.getElementById("address").value="新竹市北區中庄東路二段642巷206號14樓";
	};
}

function checkAccExis(account, flag){
	var xhrcheckAcc= new XMLHttpRequest();
	xhrcheckAcc.open("POST","<c:url value='/checkAccExis' />",true);
	xhrcheckAcc.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	xhrcheckAcc.send("account="+account);
	
	xhrcheckAcc.onreadystatechange = function() {
		if (xhrcheckAcc.readyState == 4 && (xhrcheckAcc.status == 200 || xhrcheckAcc.status == 201) ) {
			var accounttext = document.getElementById("accounttext");
			//alert(xhrcheckAcc.responseText);
			if(xhrcheckAcc.responseText === "sucess"){
				accounttext.innerHTML=" 帳號可用";
			}else{
				accounttext.innerHTML=" 帳號重複";
				flag++;
			}
		}
	}
}

function registeredNewMember(){
	var account = document.getElementById("account");
	var password = document.getElementById("password");
	var memberName = document.getElementById("memberName");
	var gender = document.getElementById("gender");
	var memberBirth = document.getElementById("memberBirth");
	var email = document.getElementById("email");
	var address = document.getElementById("address");
	var previewPhoto = document.getElementById("previewPhoto");
	
	var xhr = new XMLHttpRequest();
	xhr.open("POST","<c:url value='/insert' />",true);
	var jsonMember = {
		"account": account.value, 	
		"password": password.value,
		"memberName": memberName.value,
		"gender": gender.value,
		"memberBirth": memberBirth.value,
		"email": email.value,
		"address": address.value,
		"memberPhoto":previewPhoto.src
   	}
	console.log(jsonMember)
	xhr.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
	xhr.send(JSON.stringify(jsonMember));

	xhr.onreadystatechange = function() {
		// 伺服器請求完成
		if (xhr.readyState == 4 && (xhr.status == 200 || xhr.status == 201) ) {
			var resTex = xhr.responseText;
			if(resTex === "sucess"){
				swal({ title:"註冊成功",
              	   html:"將跳轉至首頁",
              	   type:"success",
                 }).then(function(){
              	   window.location.href="<c:url value='/' />";
                 })
			}else{
				swal({ title:"註冊失敗",
		          	   html:"請檢查輸入的資料",
		          	   type:"error",
		          	   timer:2000,
		             }).catch(function(timeout) { });
			}
		}
	}
}

</script>

<script type="text/javascript">
        let CLIENT_ID = "698466103939-uf16lq1kse4ti37nhmr5v904fcmsconc.apps.googleusercontent.com";
        //let API_KEY = '';//Javascript SDK無須 API 金鑰
        // Array of API discovery doc URLs for APIs
        let DISCOVERY_DOCS = ["https://www.googleapis.com/discovery/v1/apis/people/v1/rest"];
</script>
 <script async defer src="https://apis.google.com/js/api.js"
            onload="this.onload=function(){};GoogleClientInit()"
            onreadystatechange="if (this.readyState === 'complete') this.onload()">
</script>
<script>
$(function () {
    $("#googleRegister").on("click", function () {
    	console.log("1");
        //$("#content").html("");//清空顯示結果
        GoogleLogin();//Google 登入
    });
    $("#googledisconnect").on("click", function () {
        Google_disconnect();//和Google App斷連
    });
});

function GoogleClientInit() {
    //官網範例寫client:auth2，但本人實測由於待會要呼叫gapi.client.init而不是gapi.auth2.init，所以給client即可
    gapi.load('client', function () {
        gapi.client.init({
            //client_id 和 scope 兩者參數必填
            clientId: CLIENT_ID,
            //scope列表參考：https://developers.google.com/people/api/rest/v1/people/get
            //"profile"是簡寫，要用完整scope名稱也可以
            scope: "profile",//"https://www.googleapis.com/auth/userinfo.profile",
            discoveryDocs: DISCOVERY_DOCS
        });


    });//end gapi.load
}//end GoogleClientInit function

function GoogleLogin() {
    let auth2 = gapi.auth2.getAuthInstance();//取得GoogleAuth物件
    auth2.signIn().then(function (GoogleUser) {
        console.log("Google登入成功");
        
        var profile = GoogleUser.getBasicProfile();
        console.log("ID: " + profile.getId());
        
        let user_id = GoogleUser.getId();//取得user id，不過要發送至Server端的話，為了資安請使用id_token，本人另一篇文章有範例：https://dotblogs.com.tw/shadow/2019/01/31/113026
        console.log(`user_id:${user_id}`);
        let AuthResponse = GoogleUser.getAuthResponse(true) ;//true會回傳包含access token ，false則不會
        let id_token = AuthResponse.id_token;//取得id_token
        console.log("id_token "+id_token);
//         let id_token2 = GoogleUser.getAuthResponse().id_token;
//         console.log("id_token2 "+id_token2)
        //people.get方法參考：https://developers.google.com/people/api/rest/v1/people/get
        gapi.client.people.people.get({
            'resourceName': 'people/me',
            //通常你會想要知道的用戶個資↓
            'personFields': 'names,phoneNumbers,emailAddresses,addresses,residences,genders,birthdays,occupations',
        }).then(function (res) {
                //success
                let str = JSON.stringify(res.result);//將物件列化成string，方便顯示結果在畫面上
                console.log("in then "+user_id);
                //顯示授權你網站存取的用戶個資
                //document.getElementById('content').innerHTML = str;
                //↑通常metadata標記primary:true的個資就是你該抓的資料

                //請再自行Parse JSON，可以將JSON字串丟到線上parse工具查看：http://json.parser.online.fr/

        });

    },function (error) {
            console.log("Google登入失敗");
            console.log(error);
        });

}//end function GoogleLogin

function Google_disconnect() {
    let auth2 = gapi.auth2.getAuthInstance(); //取得GoogleAuth物件

    auth2.disconnect().then(function () {
        console.log('User disconnect.');
    });
}
</script>

</body>
</html>