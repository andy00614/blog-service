const router = require("koa-router")();

const { getBlogs } = require("../controllers/blog");

router.get("/getList", async (ctx, next) => {
  const { query } = ctx.request;
  const response = await getBlogs(query);
  ctx.body = response;
});

module.exports = router;
