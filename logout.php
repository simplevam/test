<?php

          //
  //    退出        //
//      登陆      //


define('ACC',true);
require('./include/init.php');
//销毁session
session_destroy();


$msg = '退出成功';

include(ROOT . 'view/front/msg.html');
