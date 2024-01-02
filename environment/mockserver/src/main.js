const http = require('http');
const mockserver = require('./mockserver');
const requestProcess = require('./requestProcess');
const path = require("path");

try {
    run_port = 9001;
    http.createServer(mockserver(path.resolve('../data'), true, requestProcess)).listen(run_port);
    console.log(`Server started on port ${run_port} ...`)
} catch (e) {
    console.log(e);
}
