<?php
/**
 * @Author: Vam
 * @Date:   2016-11-10
 * @Last Modified by:   Vam
 */



define('ACC',true);
require("../include/init.php");

$cat = new CatModel();
$catlist = $cat->select();
$catlist = $cat->getCatTree($catlist);
if(isset($_SESSION['username']) && !empty($_SESSION['username']) && $_SESSION['username'] =='admin' )
{
	
	include(ROOT . 'view/admin/templates/goodsadd.html');
	}else {
		header("Location:./login.php");
	}
 



