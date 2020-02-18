const {
  searchContentFromArticleIdByDb,
  getBlogTitlesByDb
} = require("../modules/blog");

async function getBlogsList(query) {
  try {
    const res = await getBlogTitlesByDb(query);
    return {
      errno: 0,
      message: "",
      data: res
    };
  } catch (e) {
    return {
      errno: 1,
      message: "get Blog error",
      data: e
    };
  }
}

module.exports = { getBlogsList };
