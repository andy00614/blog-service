const commonModule = (errno, message, data) => ({
  errno,
  message,
  data
});

function successModule(res, message = "") {
  return commonModule(0, message, res);
}

function failModule(res, message = "") {
  return commonModule(1, message, res);
}

module.exports = { successModule, failModule };
