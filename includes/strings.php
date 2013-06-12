<?php /**/ ?><?php

include_once('../config.php');

class strings {

  public $s;

  function __construct ($file) {

    global $path;

    $this->s = simplexml_load_file($path . '/files/' . $file);

    //var_dump($this->s);
  }
}