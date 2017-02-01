
<?php


/***
后台登陆页面
***/


define('ACC',true);
require('../include/init.php');
print_r($_SESSION);
var_dump ($_POST);


if(isset($_POST['act'])) {


    $u = $_POST['username'];
    $p = $_POST['password'];

    $user = new UserModel();
    
    // 检验用户名,密码
    $row = $user->checkAdmin($u,$p);
    if(empty($row)) {
        $msg = '用户名密码不匹配!';
    } else {
        $msg = '登陆成功!';
		
       print_r($_SESSION = $row);

        if(isset($_POST['remember'])) {
            setcookie('remuser',$u,time()+14*24*3600);
        } else {
            setcookie('remuser','',0);
        }


    }

    include(ROOT . '/view/admin/templates/msg.html');

    exit;


} else {

    $remuser = isset($_COOKIE['remuser'])?$_COOKIE['remuser']:'';
	
	if(isset($_SESSION['username']) && !empty($_SESSION['username']) && $_SESSION['username'] =='admin' )
		{	header("Location:./index.php");
	}else {
		
		include(ROOT . 'view/admin/templates/login.html');
		
	}
    
}

