<?php
/***
 * @Date:   2016-11-06 14:50:56
 * @Last Modified by:   Vam
 * @Last Modified time: 2016-11-06 23:21:27
 ***/
defined('ACC') ||exit('ACC denied');
class mysql extends db {
    private static $ins = NULL;
    private $conn = NULL;
    private $conf = array();

//构造方法
    protected function __construct() {
        $this->conf = conf::getIns();

        $this->connect($this->conf->host,$this->conf->user,$this->conf->pwd);
        $this->select_db($this->conf->db);
        $this->setChar($this->conf->char);
    }

// 析构方法
    public function __destruct() {
    }

    public static function getIns() {
        if(!(self::$ins instanceof self)) {
            self::$ins = new self();
        }

        return self::$ins;
    }

//连接MySql
    public function connect($h,$u,$p) {
        $this->conn = mysql_connect($h,$u,$p);
        if(!$this->conn) {
            $err = new Exception('连接失败');
            throw $err;
        }
    }
//选择数据库
    protected function select_db($db) {
        $sql = 'use ' . $db;
        $this->query($sql);
    }

//选择编码
    protected function setChar($char) {
        $sql = 'set names ' . $char;
        return $this->query($sql);
    }
//执行sql语句方法
    public function query($sql) {

        $rs = mysql_query($sql,$this->conn);

        log::write($sql);

        return $rs;
    }
//启动执行方法，默认为insert
    public function autoExecute($table,$arr,$mode='insert',$where = ' where 1 limit 1') {


        if(!is_array($arr)) {
            return false;
        }

        if($mode == 'update') {
            $sql = 'update ' . $table .' set ';
            foreach($arr as $k=>$v) {
                $sql .= $k . "='" . $v ."',";
            }
            $sql = rtrim($sql,',');//rtrim从字符串右侧移除字符
            $sql .= $where;

            return $this->query($sql);
        }

        $sql = 'insert into ' . $table . ' (' . implode(',',array_keys($arr)) . ')';
        $sql .= ' values (\'';
        $sql .= implode("','",array_values($arr));//implode把数组元素组合为字符串：

        $sql .= '\')';

        return $this->query($sql);

    }
//mysql_fetch_assoc() 函数从结果集中取得一行作为关联数组。  取得所有数据
//返回根据从结果集取得的行生成的关联数组，如果没有更多行，则返回 false。
    public function getAll($sql) {
        $rs = $this->query($sql);

        $list = array();
        while($row = mysql_fetch_assoc($rs)) {
            $list[] = $row;
        }

        return $list;
    }
// 取得单行数据

    public function getRow($sql) {
        $rs = $this->query($sql);

        return mysql_fetch_assoc($rs);
    }
//mysql_fetch_row() 函数从结果集中取得一行作为数字数组。      取得单个数据
//依次调用 mysql_fetch_row() 将返回结果集中的下一行，如果没有更多行则返回 FALSE。
    public function getOne($sql) {
        $rs = $this->query($sql);
        $row = mysql_fetch_row($rs);

        return $row[0];
    }

    // mysql_affected_rows() 函数返回前一次 MySQL 操作所影响的记录行数。

    public function affected_rows() {
        return mysql_affected_rows($this->conn);
    }

    // mysql_insert_id() 函数返回上一步 INSERT 操作产生的 ID。如果上一查询没有产生 AUTO_INCREMENT 的 ID，则 mysql_insert_id() 返回 0。

    public function insert_id() {
        return mysql_insert_id($this->conn);
    }


}

?>
