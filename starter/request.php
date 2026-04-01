<?php defined('BX_DOL') or die('hack attempt');
/**
 * UNA CMS 15.0.0-B — Routing entry point
 * File: modules/vendor/starter/request.php
 */
require_once(BX_DIRECTORY_PATH_INC . 'design.inc.php');
check_logged();
BxBaseModTextRequest::processAsAction($GLOBALS['aModule'], $GLOBALS['aRequest']);
