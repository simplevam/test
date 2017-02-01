<?php


/***
用户登陆页面
***/

define('ACC',true);
require('./include/init.php');
print_r($_SESSION);

if(isset($_POST['act'])) {


    $u = $_POST['username'];
    $p = $_POST['passwd'];

    $user = new UserModel();
    
    // 检验用户名,密码
    $row = $user->checkUser($u,$p);
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

    include(ROOT . 'view/front/msg.html');
    exit;


} else {

    $remuser = isset($_COOKIE['remuser'])?$_COOKIE['remuser']:'';
	
	if(isset($_SESSION['username']) && !empty($_SESSION['username']) )
{
	header("Location:./index.php");
}else {
		
		include(ROOT . 'view/front/denglu.html');
		
	}

	
    
}




