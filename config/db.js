const Sequelize = require("sequelize");

var config = {
  database: "blog_service", // 使用哪个数据库
  username: "root", // 用户名
  password: "jzm870708", // 口令
  host: "localhost", // 主机名
  port: 3306 // 端口号，MySQL默认3306
};

const sequelize = new Sequelize(
  config.database,
  config.username,
  config.password,
  {
    host: config.host,
    dialect: "mysql",
    port: config.port,
    pool: {
      max: 5,
      min: 0,
      idle: 30000
    }
  }
);

module.exports = {
  sequelize
};
