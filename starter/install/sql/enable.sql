-- enable.sql — INSERT system registrations (runs on install + re-enable)

-- 1. PAGES
INSERT INTO `sysobjectspage` (`object`,`uri`,`title_system`,`title`,`module`,`layout_id`,`url`,`meta_title`,`meta_description`,`meta_keywords`,`meta_robots`,`cache_lifetime`,`cache_editable`,`deletable`,`override_class_name`,`override_class_file`,`visible_for_levels`,`visible_for_levels_editable`,`cover`,`cover_image`,`cover_title`,`inj_head`,`inj_footer`,`config_api`) VALUES
('bx_vendorstarter_home','vendor-starter-home','_bx_vendorstarter_page_home','_bx_vendorstarter_page_home','bx_vendorstarter',12,'page.php?i=vendor-starter-home','','','','',0,1,0,'','',2147483647,1,1,0,'','','',''),
('bx_vendorstarter_manage','vendor-starter-manage','_bx_vendorstarter_page_manage','_bx_vendorstarter_page_manage','bx_vendorstarter',12,'page.php?i=vendor-starter-manage','','','','',0,1,0,'','',2147483647,1,0,0,'','','','');

-- 2. PAGE BLOCKS
INSERT INTO `syspagesblocks` (`object`,`cell_id`,`module`,`title_system`,`title`,`designbox_id`,`visible_for_levels`,`type`,`content`,`deletable`,`copyable`,`active`,`order`) VALUES
('bx_vendorstarter_home',1,'bx_vendorstarter','_bx_vendorstarter_block_entries','_bx_vendorstarter_block_entries',11,2147483647,'service','a:2:{s:6:"module";s:16:"bx_vendorstarter";s:6:"method";s:14:"serviceGetHome";}',0,1,1,1);

-- 3. STUDIO PAGE
INSERT INTO `sysstdpages` (`index`,`name`,`header`,`caption`,`icon`) VALUES
(3,'bx_vendorstarter','_bx_vendorstarter_title','_bx_vendorstarter_title','fas fa-puzzle-piece col-green3');
SET @iPageId = LAST_INSERT_ID();
SET @iParentPageId    = (SELECT `id` FROM `sysstdpages` WHERE `name` = 'home');
SET @iParentPageOrder = (SELECT IFNULL(MAX(`order`),0) FROM `sysstdpageswidgets` WHERE `pageid` = @iParentPageId);
INSERT INTO `sysstdwidgets` (`pageid`,`module`,`type`,`url`,`click`,`icon`,`caption`,`cnt_notices`,`cnt_actions`) VALUES
(@iPageId,'bx_vendorstarter','content','url:studio:module.php?name=bx_vendorstarter','','fas fa-puzzle-piece col-green3','_bx_vendorstarter_title','','');
INSERT INTO `sysstdpageswidgets` (`pageid`,`widgetid`,`order`) VALUES
(@iParentPageId,LAST_INSERT_ID(),@iParentPageOrder+1);

-- 4. MENU
SET @iSiteMenuOrder = (SELECT IFNULL((SELECT `order` FROM `sysmenuitems` WHERE `set_name`='sys_site' AND `active`=1 AND `order`<9999 ORDER BY `order` DESC LIMIT 1),0));
INSERT INTO `sysmenuitems` (`set_name`,`module`,`name`,`title_system`,`title`,`link`,`onclick`,`target`,`icon`,`submenu_object`,`visible_for_levels`,`active`,`copyable`,`order`) VALUES
('sys_site','bx_vendorstarter','bx_vendorstarter_home','_bx_vendorstarter_menu_home','_bx_vendorstarter_menu_home','page.php?i=vendor-starter-home','','','far circle','',2147483647,1,0,@iSiteMenuOrder+1);

-- 5. ACL
INSERT INTO `sysaclactions` (`Module`,`Name`,`AdditionalParamName`,`Title`,`Desc`,`Countable`,`DisabledForLevels`) VALUES
('bx_vendorstarter','view','','_bx_vendorstarter_acl_view','',0,''),
('bx_vendorstarter','add','','_bx_vendorstarter_acl_add','',1,''),
('bx_vendorstarter','edit','','_bx_vendorstarter_acl_edit','',0,''),
('bx_vendorstarter','delete','','_bx_vendorstarter_acl_delete','',0,'');

-- 6. ALERTS
INSERT INTO `sysalertshandlers` (`name`,`class`,`file`,`service_call`) VALUES
('bx_vendorstarter','VendorStarterAlertsResponse','modules/vendor/starter/classes/VendorStarterAlertsResponse.php','');
SET @iHandlerId = LAST_INSERT_ID();
INSERT INTO `sysalerts` (`unit`,`action`,`handler_id`) VALUES
('profile','delete',@iHandlerId);

-- 7. OPTIONS
INSERT INTO `sysoptionscategories` (`name`,`caption`,`order`) VALUES
('bx_vendorstarter','_bx_vendorstarter_options',1);
SET @iCategoryId = LAST_INSERT_ID();
INSERT INTO `sysoptions` (`name`,`value`,`category_id`,`caption`,`type`,`extra`,`check`,`check_error`,`order`) VALUES
('bx_vendorstarter_per_page','10',@iCategoryId,'_bx_vendorstarter_option_per_page','digit','','','',1);
