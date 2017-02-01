<?php
/**
 * @Author:Vam
 * @Date:   2016-11-10 15:33:16
 * @Last Modified by: Vam
 */
define('ACC',true);
require('../include/init.php');

$cat_id = $_GET['cat_id'] + 0 ;

$cat = new CatModel();
$sons = $cat->getSon($cat_id);
if (!empty($sons)) {
    exit('有子栏目,不允许删除');
}

if($cat->delete($cat_id)){

    echo "删除成功";
}else {

    echo "删除失败" ;
}
