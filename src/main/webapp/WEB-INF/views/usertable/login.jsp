<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<body>
    <div id="loginform">
        <h3 class="text-center text-white pt-5">Login</h3>
        <div class="container">
            <div id="login-row" class="row justify-content-center align-items-center">
                <div id="login-column" class="col-md-6">
                    <div id="login-box" class="col-md-12">
                        <form id="login-form" class="form" action="" method="post">
                            <h3 class="text-center text-info">Login</h3>
                            <div class="form-group">
                                <label for="id" class="text-info">ID:</label><br>
                                <input type="text" name="id" id="id" class="form-control">
                            </div>
                            <div class="form-group">
                                <label for="passwd" class="text-info">Password:</label><br>
                                <input type="password" name="passwd" id="passwd" class="form-control">
                            </div>
                            <div class="form-group">
                                <input type="button" name="login" id="login" class="btn btn-info btn-md" value="Login">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
    
    $(document).ready(function(){
    	
    	// 로그인
    	$("#login").on("click", function(){

    	      let id = $("#id");
    	      let passwd = $("#passwd");

    	      if(id.val() == "" || id.val() == null){
    	        alert("아이디를 입력하세요");
    	        id.focus();
    	        return;
    	      }
    	      
    	      if(passwd.val() == "" || passwd.val() == null){
      	        alert("비밀번호를 입력하세요");
      	        passwd.focus();
      	        return;
      	      }
    	      
    	      $.ajax({
    	        url: '/usertable/login',
    	        type: 'POST',
    	        dataType: 'text',
    	        data: { id : id.val(), passwd : passwd.val() },
    	        success: function(data){
    	          
    	          if(data == "success"){
    	          	location.href = "/";
    	          }else if(data == "idFail"){
    	        	alert("아이디를 확인해주세요");
    	        	id.focus();
    	          }else if (data == "pwFail"){
    	        	alert("비밀번호를 확인해주세요")
    	          	passwd.focus();
    	          }
    	          
    	          }
    	        
    	        });
      
    	      });

    });
    
    
    </script>
</body>
