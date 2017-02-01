<?php

          //
  //    退出        //
//      登陆      //


define('ACC',true);
require('../include/init.php');
//销毁session
session_destroy();


$msg = '退出登录成功！';

include(ROOT . 'view/admin/templates/msg.html');

