const router = require("koa-router")();

const {
  getBlogsList,
  creatArticle,
  removeArticle,
  getContentById
} = require("../controllers/blog");

router.get("/getList", async (ctx, next) => {
  const { query } = ctx.request;
  const response = await getBlogsList(query);
  ctx.body = response;
});

router.get("/searchContent", async (ctx, next) => {
  const { query } = ctx.request;
  const response = await getContentById(query.id);
  ctx.body = response;
});

router.post("/createArticle", async (ctx, next) => {
  const params = ctx.request.body;
  const response = await creatArticle(params.title, params.content);
  ctx.body = response;
});

router.get('/removeArticle',async(ctx,next) => {
  const {articleId} = ctx.request
  const response = await removeArticle(articleId)
  ctx.body = response
})

module.exports = router;
