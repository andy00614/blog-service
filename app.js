const Koa = require('koa')
const app = new Koa()
const views = require('koa-views')
const json = require('koa-json')
const onerror = require('koa-onerror')
const bodyparser = require('koa-bodyparser')
const logger = require('koa-logger')

const index = require('./routes/index')
const users = require('./routes/users')
const articles = require('./routes/article')

const {sequelize} = require('./config/db')
const Blog = require('./schema')
const cors = require('koa-cors');

// error handler
onerror(app)

// async function testSql() {

//   try {
//     await sequelize.authenticate();
//     console.log('Connection has been established successfully.');
//     const blogs = await Blog.findAll()
//     console.log("All users:", JSON.stringify(blogs,null,2))
//   } catch (error) {
//     console.error('Unable to connect to the database:', error);
//   }
// }

// testSql()

// middlewares
app.use(cors())
app.use(bodyparser({
  enableTypes:['json', 'form', 'text']
}))
app.use(json())
app.use(logger())
app.use(require('koa-static')(__dirname + '/public'))

app.use(views(__dirname + '/views', {
  extension: 'pug'
}))

// logger
app.use(async (ctx, next) => {
  const start = new Date()
  await next()
  const ms = new Date() - start
  console.log(`${ctx.method} ${ctx.url} - ${ms}ms`)
})

// routes
app.use(index.routes(), index.allowedMethods())
app.use(users.routes(), users.allowedMethods())
app.use(articles.routes(), users.allowedMethods())

// error-handling
app.on('error', (err, ctx) => {
  console.error('server error', err, ctx)
});

module.exports = app
