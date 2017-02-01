<?php
/**
 * @Author: Vam
 * @Date:   2016-11-09 17:26:16
 * @Last Modified by:   Vam
 * @Last Modified time: 2016-11-10 21:34:36
 */

define('ACC',true);
require('../include/init.php');

// 调用model
$cat = new CatModel();
$catlist = $cat->select();

$catlist = $cat->getCatTree($catlist,0);
//print_r($catlist);



if(isset($_SESSION['username']) && !empty($_SESSION['username']) && $_SESSION['username'] =='admin' )
{
	
	include(ROOT . 'view/admin/templates/catelist.html');
	}else {
		header("Location:./login.php");
		exit;
	}
 
?>
