// const { path } = require("../routes/crudsampah")

const logRequest = (req, res, next) => {
    console.log('path: ', req.path);
    next();
}

module.exports = logRequest;