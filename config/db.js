const Sequelize = require("sequelize");

var config = {
  database: "mysql", // 使用哪个数据库
  username: "root", // 用户名
  password: "password", // 口令
  host: process.env.DATABASE_HOST || "localhost", // 主机名
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
