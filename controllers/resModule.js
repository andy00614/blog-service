const module = (errno, message, data) => ({
  errno,
  message,
  data
});

function successModule(res, message = "") {
  return module(0, message, res);
}

function failModule(res, message = "") {
  return module(1, message, res);
}

export { successModule, failModule };
