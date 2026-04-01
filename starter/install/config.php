<?php defined('BX_DOL') or die('hack attempt');
/**
 * UNA CMS 15.0.0-B — Installer metadata
 * File: modules/vendor/starter/install/config.php
 */
$aConfig = array(
    'type'              => 'module',
    'name'              => 'starter',
    'title'             => 'Vendor Starter',
    'version'           => '1.0.0',
    'vendor'            => 'vendor',
    'home_dir'          => 'vendor/starter/',
    'home_uri'          => 'starter',
    'db_prefix'         => 'bx_vendorstarter_',
    'class_prefix'      => 'VendorStarter',
    'language_category' => 'Vendor Starter',
    'compatible_with'   => array('15.0.0'),
    'install'  => array(
        'check_tables'      => array('bx_vendorstarter_entries'),
        'install_files'     => true,
        'install_languages' => true,
        'run_sql'           => true,
        'add_admin_tools'   => false,
    ),
    'uninstall' => array(
        'delete_tables' => array('bx_vendorstarter_entries'),
        'delete_files'  => true,
        'run_sql'       => true,
    ),
    're_enable'  => array('run_sql' => true),
    're_disable' => array('run_sql' => true),
);
