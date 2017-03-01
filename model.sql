CREATE TABLE pc_user(
    id INTEGER PRIMARY KEY,
    u_name VARCHAR(100) NOT NULL,
    u_pwd VARCHAR(100) NOT NULL
);

CREATE TABLE pc_server
(
  ind INTEGER PRIMARY KEY, -- 序号
  i_level INTEGER NOT NULL, --层级， 1,物理机， 2,虚拟机或服务， 3,服务
  ind_prent INTEGER NOT NULL, --所在机器id
  e_time DATE, -- 质保
  s_time DATE, -- 投入使用
  m_r VARCHAR(64), -- 机房名称
  cabinet VARCHAR(256), -- 机柜
  location VARCHAR(256), -- 位置
  idrac VARCHAR(256), -- iDRAC
  cable_label VARCHAR(256), -- 网线标签
  mac VARCHAR(256), -- mac
  ip VARCHAR(256), -- IP地址
  cpu INTEGER, -- cpu核
  hd INTEGER, -- 硬盘（GB）
  memory INTEGER, -- 内存（GB）
  op_sys VARCHAR(256), -- 操作系统
  bz_name VARCHAR(256), -- 使用的业务方
  in_using INTEGER, -- 是否使用
  config VARCHAR(256), -- 配置说明
  pc_type VARCHAR(64), -- 型号
  pc_code VARCHAR(64), -- 服务编码
  remark VARCHAR(512), -- 备注
  user_pw VARCHAR(256), -- 用户/密码
  monitor_url VARCHAR(256) --监控地址
);