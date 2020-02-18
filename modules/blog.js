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
    attributes: ['content']
  })
  return content
}

module.exports = {
  getBlogTitlesByDb,
  searchContentFromArticleIdByDb
};
