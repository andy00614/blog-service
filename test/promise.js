// reject的冒泡特性

async function P1() {
  try {
    const p2 = await P2();
    console.log("p2", p2);
  } catch (e) {
    console.log('eeeeeee',e);
  }
}
async function P2() {
  const p3 = await P3();
  console.log("p3", p3);
  return p3;
}
async function P3() {
  // throw new Error(3333);
  // throw等同Promise.reject
  throw 'yes 3333'
  // return Promise.reject('error 3333')
}

P1();
