<?php
define('ACC', true);
require './include/init.php';

$user = new Usermodel();


//自动检验
if (!$user->_validate($_POST)) {
   echo $msg = implode('<br />',$user->getErr());
    include(ROOT . 'view/front/msg.html');
    exit;
}





//检车用户是否存在
if ($user->checkuser($_POST['username'])) {
    $msg = '用户已经存在';
    include(ROOT . 'view/front/msg.html');
    exit;
}

 // 自动填充
$data = $user->_autoFill($_POST); 
 // 自动过滤
$data = $user->_facade($data); 

if ($user->reg($data)) {
     $msg = "用户注册成功";
}else {
     $msg = "用户注册失败";
}

include(ROOT . 'view/front/msg.html');
?>