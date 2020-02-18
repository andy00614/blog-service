const {
  searchContentFromArticleIdByDb,
  getBlogTitlesByDb
} = require("../modules/blog");
const { successModule, failModule } = require("./resModule");

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

module.exports = { getBlogsList, getContentById };
