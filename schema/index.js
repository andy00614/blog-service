const { sequelize } = require("../config/db");
const Sequelize = require("sequelize");

const Blog = sequelize.define(
  "blog",
  {
    id: {
      type: Sequelize.STRING(50),
      primaryKey: true,
      autoIncrement: true
    },
    time: Sequelize.BIGINT(20),
    title: Sequelize.STRING(45),
    articleId: Sequelize.STRING(45),
    content: Sequelize.TEXT("long")
  },
  {
    timestamps: false
  }
);
module.exports = Blog