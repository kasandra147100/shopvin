<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>free login form -bootstrap</title>

    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- font awesome -->
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <!-- Custom Style -->
    <link href="css/style.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></scri.row>.containerpt>
    <![endif]-->
  </head>
  
  <body>
    <div  class="container">
      <div style="margin-top: 10px"   class="row">
      
        
        
        <div style="margin: auto; right: 120px" class="col-md-3">
          <div style="width: 500px;" class="login-box well">
        <form accept-charset="UTF-8" role="form" method="post" action="">
            <div class="form-group">
                <label for="username-email">아이디</label>
                <input name="user_id" value='' id="username-email" placeholder="Username" type="text" class="form-control" />
            </div>
            <div class="form-group">
                <label for="password">비밀번호</label>
                <input name="password" id="password" value='' placeholder="Password" type="password" class="form-control" />
            </div>
            <div class="form-group">
                <input type="submit" class="btn btn-default btn-login-submit btn-block m-t-md" value="Login" />
            </div>
             <span class='text-center'><a href="/bbs/index.php?mid=index&act=dispMemberFindAccount" class="text-sm">아이디 찾기</a></span>
            <span class='text-center'><a href="/bbs/index.php?mid=index&act=dispMemberFindAccount" class="text-sm">비밀번호 찾기</a></span>
            <hr />
            <div class="form-group">
                <a href="register.jsp" class="btn btn-default btn-block m-t-md"> 회원가입</a>
            </div>
        </form>
          </div>
        </div>
      </div>
    </div>

  <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <!-- Include all compiled plugins (below), or include individual files as needed -->
  <script src="js/bootstrap.min.js"></script>
  </body>
  
  </html>