<?php
defined('ACC') || exit('Acc Deined');


class UserModel extends Model {
    protected $table = 'user';
    protected $pk = 'user_id';
    protected $fields = array('user_id','username','email','passwd','regtime','lastlogin');
/*

1,必须检查
 */

    protected $_valid = array(
                            array('username',1,'用户名必须在4-6字符内','require'),
                             array('username',0,'用户名必须在4-6字符内','length','4,16'),
                            array('email',1,'Email非法','require'),
                            array('passwd',1,'password不能为空','require')
        );

    public function reg($data){
        if ($data['passwd']) {
            $data['passwd'] = $this->encPasswd($data['passwd']);
        }
        return $this->add($data);
    }

    protected function encPasswd($p){
        return md5($p);
    }

      public function checkUser($username,$passwd='') {
        if($passwd == '') {
            $sql = 'select count(*) from ' . $this->table . " where username='" .$username . "'";
            return $this->db->getOne($sql);
        } else {
            $sql = "select user_id,username,email,passwd from " . $this->table . " where username= '" . $username . "'";

            $row = $this->db->getRow($sql);

            if(empty($row)) {
                return false;
            }

            if($row['passwd'] != $this->encPasswd($passwd)) {
                return false;
            }

            unset($row['passwd']);
            return $row;
        }
    }
	
	public function checkAdmin($username,$password='') {
        if($password == '') {
            $sql = 'select count(*) from adminVam where username=' ."'" .$username . "'";
            return $this->db->getOne($sql);
        } else {
            $sql = "select user_id,username,email,password from adminVam where username= '" . $username . "'";

            $row = $this->db->getRow($sql);

            if(empty($row)) {
                return false;
            }

            if($row['password'] != $this->encPasswd($password)) {
                return false;
            }

            unset($row['password']);
            return $row;
        }
    }
}



?>