<?php defined('BX_DOL') or die('hack attempt');
/**
 * UNA CMS 15.0.0-B — Module installer
 * MUST be named installer.php — NOT install.php
 */
bx_import('BxDolStudioInstaller');
class VendorStarterInstaller extends BxDolStudioInstaller
{
    public function __construct($aConfig)
    {
        parent::__construct($aConfig);
    }
}
