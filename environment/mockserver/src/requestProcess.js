const path = require("path");
const mockserver = require('./mockserver');
function requestProcess(req, res) {
    mockserver(path.resolve('../data'), true, null)(req, res)
}
module.exports = requestProcess;
