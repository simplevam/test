<?php



define('ACC',true);
require('../include/init.php');


// 接POST
// 判断合法性,同学们自己做.


$data = array();
if(empty($_POST['cat_name'])) {
    exit('栏目名不能为空');
}
$data['cat_name'] = $_POST['cat_name'];
$data['parent_id'] = $_POST['parent_id'] + 0;
$data['intro'] = $_POST['intro'];

$cat_id = $_POST['cat_id'] + 0;


$cat = new CatModel();

$trees = $cat->getTree($data['parent_id']);
//print_r($trees);
$flag = true;
foreach($trees as $v ){
    if ($v['cat_id'] == $cat_id) {
        $flag = false;
        break;
    }
}
if (!$flag) {
    echo "父栏目选择错误";
    exit;
}
if($cat->update($data,$cat_id)) {
    echo '修改成功';
} else {
    echo '修改失败';
}
