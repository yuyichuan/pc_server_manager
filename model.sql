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
  m_r TEXT, -- 机房名称
  cabinet TEXT, -- 机柜
  location TEXT, -- 位置
  idrac TEXT, -- iDRAC
  cable_label TEXT, -- 网线标签
  mac TEXT, -- mac
  ip TEXT, -- IP地址
  cpu INTEGER, -- cpu核
  hd INTEGER, -- 硬盘（GB）
  memory REAL, -- 内存（GB）
  op_sys TEXT, -- 操作系统
  bz_name TEXT, -- 使用的业务方
  in_using INTEGER, -- 是否使用
  config TEXT, -- 配置说明
  pc_type TEXT, -- 型号
  pc_code TEXT, -- 服务编码
  remark TEXT, -- 备注
  user_pw TEXT, -- 用户/密码
  monitor_url TEXT --监控地址
);