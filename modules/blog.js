// module写sql的部分
const Blog = require("../schema");

async function getBlogTitles() {
  const blogs = await Blog.findAll({
    // where: query,
    attributes: ['title','time','articleId']
  });
  return blogs;
}

// async function searchContentFromArticleId(id) {
//   const content = await Blog.findAll({
//     where: {
//       select
//     }
//   })
// }

module.exports = {
  getBlogTitles
};
