<?php
//递归转义数组
defined('ACC') ||exit('ACC denied');
function __addslashes($arr){
    foreach ($arr as $k => $v) {
        if (is_string($v)) {
            $arr[$k] = addslashes($v);
        }else if (is_array($v)) {
            $arr[$k] = __addslashes($v);
        }

    }
    return $arr;
}
