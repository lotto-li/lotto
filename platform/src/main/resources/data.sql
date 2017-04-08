-- 创建用户
DELETE FROM `sys_user` WHERE `id` in (1, 2);

INSERT INTO `sys_user` (`id`, `password`, `username`) VALUES ('1', '123456', 'adm');
INSERT INTO `sys_user` (`id`, `password`, `username`) VALUES ('2', '123456', 'usr');
