// module写sql的部分
const Blog = require("../schema");

async function getBlogTitlesByDb() {
  const blogs = await Blog.findAll({
    // where: query,
    attributes: ['title','time','articleId']
  });
  return blogs;
}

async function searchContentFromArticleIdByDb(id) {
  const content = await Blog.findOne({
    where: {
      articleId: id
    },
  })
  return content
}

async function createArticleByDb(title,content) {
  const time = new Date().getTime()
  const articleId = `${new Date().toLocaleDateString()}/${title}`
  const res = await Blog.create({
    time,
    title,
    articleId,
    content
  })
  return res
}

module.exports = {
  getBlogTitlesByDb,
  createArticleByDb,
  searchContentFromArticleIdByDb
};
