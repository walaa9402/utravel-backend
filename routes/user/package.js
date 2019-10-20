var express = require('express');
var router = express.Router();
var pool = require('../../config/config');

// for testing
router.get('/', function(req, res, next) {
    res.send('respond with a resource in app company api');
});

module.exports = router;