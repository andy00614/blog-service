const router = require("koa-router")();

const { getBlogsList, getContentById } = require("../controllers/blog");

router.get("/getList", async (ctx, next) => {
  const { query } = ctx.request;
  const response = await getBlogsList(query);
  ctx.body = response;
});

router.get('/searchContent',async (ctx,next) => {
  const { query } = ctx.request
  const response = await getContentById(query.id)
  ctx.body = response;
})

module.exports = router;
