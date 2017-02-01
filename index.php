<?php


define('ACC',true);
require('./include/init.php');

// 最新5条
$goods = new GoodsModel();
$newlist = $goods->getNew(5);



// 取出女士栏
$female_id = 4;
$felist = $goods->catGoods($female_id);



include(ROOT . 'view/front/index.html');
