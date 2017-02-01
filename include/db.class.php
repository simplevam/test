<?php
/***
file db.class.php  Mysql抽象类
***/
defined('ACC') ||exit('ACC denied');
abstract class db {

    public abstract function connect($h,$u,$p);


    public abstract function query($sql);

    public abstract function getAll($sql);


    public abstract function getRow($sql);

    public abstract function getOne($sql);

//自动执行  
    public abstract function autoExecute($table,$data,$act='insert',$where='');


}

?>
