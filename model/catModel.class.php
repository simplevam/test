<?php
/****

php学习记录--商场框架

****/

class CatModel extends Model{
    //表名
    protected $table = 'category';
    //传入一个数组，add方法插入数据库
    public function add($data){
        return $this->db->autoExecute($this->table,$data,'insert');
    }
    //获取本表下的所有数据
    public function select(){
        $sql = 'select * from '.$this->table;
        return $this->db->getAll($sql);
    }


    //取得一行数据
    public function find($cat_id){
        $sql = 'select * from category where cat_id='.$cat_id;
        return $this->db->getRow($sql);
    }

    //返回$id 的子孙树
    public function getCatTree($arr,$id = 0,$lev=0) {
        $tree = array();

        foreach($arr as $v) {
            if($v['parent_id'] == $id) {
                $v['lev'] = $lev;
                $tree[] = $v;

                $tree = array_merge($tree,$this->getCatTree($arr,$v['cat_id'],$lev+1));
            }
        }

        return $tree;
    }
//找子栏目
    public function getTree($id=0){
        $tree = array();
        $cats = $this->select();
        while ($id>0) {
            foreach($cats as $v ){
                $tree[] = $v;
                $id = $v['parent_id'];
                break;
            }
        }
        return $tree;
    }

    //删除栏目
    public function delete ($cat_id=0){
        $sql = 'delete from '.$this->table . ' where cat_id=' .$cat_id;
        $this->db->query($sql);
        return $this->db->affected_rows();

    }
     public function getSon($id){
        $sql = 'select cat_id,cat_name,parent_id from '. $this->table.' where parent_id='.$id;
        return $this->db->getAll($sql);
    }

    public function update($data,$cat_id=0){
        $this->db->autoExecute($this->table,$data,'update','where cat_id='.$cat_id);
        return $this->db->affected_rows();
    }
}
?>
