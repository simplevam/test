<?php
/**
 * @Author: Vam
 * @Date:   2016-11-10 16:24:39
 * @Last Modified by:   Vam
 */

define('ACC',true);
require('../include/init.php');

$cat_id = $_GET['cat_id'] + 0;

$cat = new CatModel();
$catinfo = $cat->find($cat_id);


$catlist = $cat->select();
$catlist = $cat->getCatTree($catlist);
//print_r($catlist);

include(ROOT . 'view/admin/templates/catedit.html');


?>
