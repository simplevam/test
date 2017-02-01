<?php
/**
 * @Author: Vam
 * @Date:   2016-11-11 20:29:59
 * @Last Modified by:   Vam
 */

define('ACC',true);
require('../include/init.php');
// 第二步,检验数据
$data = array();
if(empty($_POST['cat_name'])) {
    exit('栏目名不能为空');
}
$data['cat_name'] = $_POST['cat_name'];

// 同理判断intro及父栏目id是否合法

$data['parent_id'] = $_POST['parent_id'];
$data['intro'] = $_POST['intro'];



// 第三步,实例化model
// 并调用model的相关方法

$cat = new CatModel();

if($cat->add($data)) {
    echo '栏目添加成功';
    exit;
} else {
    echo '栏目添加失败';
    exit;
}
