const { getBlogsInDb } = require('../modules/blog')

async function getBlogs(query) {
  try {
    const res = await getBlogsInDb(query)
    return {
      errno: 0,
      message: '',
      data: res
    }
  } catch(e) {
    return {
      errno: 1,
      message: 'get Blog error',
      data: e
    }
  }
}

module.exports = {getBlogs}