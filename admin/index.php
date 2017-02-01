<?php
/****
燕十八 公益PHP讲堂

论  坛: http://www.zixue.it
微  博: http://weibo.com/Yshiba
YY频道: 88354001
****/



define('ACC',true);
require('../include/init.php');


if(isset($_SESSION['username']) && !empty($_SESSION['username']) && $_SESSION['username'] =='admin' )
{
	include(ROOT . 'view/admin/templates/index.html');
}else {
		header("Location:./login.php");
		
	}