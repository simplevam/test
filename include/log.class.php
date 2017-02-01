<?php
/*
  file log.class.php
    记录Sql语句到日志
*/
defined('ACC') ||exit('ACC denied');
class log {
    const LOGFILE = 'debug_log.log';//定义常量，代表日志文件的名称
    //写日志
    public static function write($cont){
        $cont .="\r\n";
        $log = self::isBak();//计算出日志文件的地址
        $fh = fopen($log, 'ab');
        fwrite($fh, $cont);
        fclose($fh);
    }
    //备份日志
    public static function bak(){
        //日志形式为明月日随机.bak
        $log = ROOT.'\data\log\\'.self::LOGFILE;
        $bak = ROOT . '\data\log\\'.date('ymd').mt_rand(10000,99999).'.bak';

        return rename($log, $bak);
    }
    //读取日志并且判断大小
    public static function isBak(){
         $log = ROOT.'/data/log/'.self::LOGFILE;
         if (!file_exists($log)) {
             touch($log);//不存在则创建
             return $log;
         }


    //清除缓存
    clearstatcache(true,$log);

    //要是存在则判断大小


    $size = filesize($log);
    if ($size <= 1024 *1024) {
        return $log;
    }
    //大于1m
    if (!self::Bak()) {
        return $log;
    }else {
        touch($log);
        return $log;
        }
    }
}

?>
