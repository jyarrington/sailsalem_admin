<?php
/**
 * Created by JetBrains PhpStorm.
 * User: jason
 * Date: 6/12/13
 * Time: 9:27 AM
 * To change this template use File | Settings | File Templates.
 */

include('../config.php');
include ('db.php') ;
include ('message.php');

class MessageTest extends PHPUnit_Framework_TestCase {

    /*
     * Test functionality of send_message;
     */
    public function testSend_message()
    {

        $m = new message;

        $a = array();
        $t = 'test_template.html';

        $a["email1"] = 'jasonyarrington@gmail.com';
        $a["email2"] = 'jason.yarrington@gmail.com';
        $a["my_token"] = 'Text to replace in token';
        $a["subject"] = 'This is the test subject line';

        $m->send_message($a, $t);

        $this->assertEquals(0, 0);
    }
}