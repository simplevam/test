<?php
/**
 * @Author: Vam
 * @Date:   2016-11-10  15:28
 * @Last Modified by:   Vam
 */


define('ACC',true);


require('../include/init.php');

$cat = new CatModel();
$catlist = $cat->select();
$catlist = $cat->getCatTree($catlist);

include(ROOT . 'view/admin/templates/cateadd.html');
?>
