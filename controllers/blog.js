const {
  getBlogTitlesByDb,
  createArticleByDb,
  removeArticleByDb,
  searchContentFromArticleIdByDb
} = require("../modules/blog");
const { successModule, failModule } = require("./resModule");
const Password = require('../schema/password')

async function getBlogsList(query) {
  try {
    const res = await getBlogTitlesByDb(query);
    return successModule(res);
  } catch (e) {
    return failModule(e);
  }
}

async function getContentById(id) {
  try {
    const res = await searchContentFromArticleIdByDb(id);
    return successModule(res);
  } catch (e) {
    return failModule(e);
  }
}

async function creatArticle(title, content) {
  try {
    const res = await createArticleByDb(title, content);
    return successModule(res);
  } catch (e) {
    return failModule(e);
  }
}

async function testPassword(password) {
  const token = await Password.findOne({
    where: {
      password
    }
  })
  if(!token || !token.password) {
    return Promise.reject('密码错误')
  }
}

async function removeArticle(id,password) {
  try {
    await testPassword(password)
    const res = await removeArticleByDb(id);
    return successModule(res);
  } catch (e) {
    return failModule(e);
  }
}

module.exports = { getBlogsList, getContentById, creatArticle, removeArticle };
