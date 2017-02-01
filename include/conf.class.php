<?php
/**
file conf.class.php
配置文件读写类
**/
defined('ACC') ||exit('ACC denied');
class conf {
    protected static $ins =null;
    protected $data = array();
    final protected function __construct(){
        //一次性把配置信息读进来。赋值给data
        include ROOT.'/include/conf.inc.php';
        $this->data = $_CFG;

    }
    final protected function __clone(){

    }
    public static function getIns(){
        if (self::$ins instanceof self) {
            return self::$Ins;
        }else{
            self::$ins = New self();
            return self::$ins;
        }
    }
    //用魔术方法读取data内信息
    public function __get($key){
        if (array_key_exists($key, $this->data)) {
            return $this->data[$key];
        }else{
            return null;
        }
    }
    public function __set($key,$value){
        $this->data[$key] = $value;
    }
}
/***
$conf = conf::getIns();
//var_dump($conf);
echo $conf->host."<br>";//读取
$conf->temp_dir = 'd:\www';
echo $conf->temp_dir;//追加

**/
















?>