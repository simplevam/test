<?php

          //
  //    �˳�        //
//      ��½      //


define('ACC',true);
require('../include/init.php');
//����session
session_destroy();


$msg = '�˳���¼�ɹ���';

include(ROOT . 'view/admin/templates/msg.html');

