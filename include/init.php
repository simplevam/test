<?php

/***
 file init.php
框架初始化
 */

defined('ACC')||exit('ACC Denied');


define('ROOT',str_replace('\\','/',dirname(dirname(__FILE__))) . '/');
define('DEBUG',true);

require(ROOT . 'include/lib_base.php');

//自动加载类
function __autoload($class) {
    if(strtolower(substr($class,-5)) == 'model') {
        require(ROOT . 'Model/' . $class . '.class.php');
    } else if(strtolower(substr($class,-4)) == 'tool') {
        require(ROOT . 'tool/' . $class . '.class.php');
    } else {
        require(ROOT . 'include/' . $class . '.class.php');
    }
}




//过滤参数 GET POST COOKIE
$_GET = __addslashes($_GET);
$_POST = __addslashes($_POST);
$_COOKIE = __addslashes($_COOKIE);

//开启session
session_start();

if(defined('DEBUG')){
    error_reporting(E_ALL);
}else{
    error_reporting(0);
}


 


