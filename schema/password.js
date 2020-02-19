const { sequelize } = require("../config/db");
const Sequelize = require("sequelize");

const Password = sequelize.define("password", {
  password: {
    type: Sequelize.STRING(20),
    primaryKey: true
  }
},{
  timestamps: false
});
module.exports = Password;
