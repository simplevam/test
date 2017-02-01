<?php
/****

php学习记录--商场框架

****/

define('ACC',true);
require('./include/init.php');

$goods_id = isset($_GET['goods_id'])?$_GET['goods_id']+0:0;


// 先查询这个商品信息
$goods = new GoodsModel();
$g = $goods->find($goods_id);



$cat = new CatModel();
$nav = $cat->getTree($g['cat_id']);

include(ROOT . 'view/front/shangpin.html');
