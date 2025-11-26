<?php
session_start();

$_SESSION = array();

session_destroy();

header("Location: ../Index.html?session_cleared=1"); 
exit;
?>