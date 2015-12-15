CREATE TABLE IF NOT EXISTS `tp_new_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `loginname` varchar(50) DEFAULT NULL COMMENT '用户名',
  `username` varchar(50) DEFAULT NULL COMMENT '登录名',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  `phone` varchar(50) DEFAULT NULL COMMENT '手机',
  `email` varchar(500) DEFAULT NULL COMMENT '邮箱',
  `role` varchar(255) DEFAULT NULL COMMENT '角色',
  `avatarId` varchar(255) DEFAULT NULL COMMENT '头像',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

INSERT INTO `tp_new_user` (`id`, `loginname`, `username`, `password`, `phone`, `email`, `role`, `avatarId`) VALUES
(1, 'admin1', '管理员1', 'E10ADC3949BA59ABBE56E057F20F883E', '123', 'admin1@cooking.com', 'ADMIN', NULL),
(2, 'admin2', '管理员2', 'E10ADC3949BA59ABBE56E057F20F883E', '123', 'admin2@cooking.com', 'ADMIN', NULL);

