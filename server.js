
var createError = require('http-errors');
var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
const app = express()


var http = require('http');
const https = require("https");
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));



var indexRouter = require('./routes/index');
var employeeRouter = require('./routes/employee');
var ccRouter = require('./routes/cc');
var imageRouter = require('./routes/image');
var univRouter = require('./routes/university');
var facultyRouter = require('./routes/faculty');
var studentRouter = require('./routes/student');
var orderRouter = require('./routes/order');

app.use('/', indexRouter);
app.use('/employee',employeeRouter);
app.use('/student',studentRouter);
app.use('/cc',ccRouter);
app.use('/image',imageRouter);
app.use('/univ',univRouter);
app.use('/faculty',facultyRouter);
app.use('/order',orderRouter);



// catch 404 and forward to error handler
app.use(function(req, res, next) {
  next(createError(404));
});



// for authentication
app.use(function(req, res, next) {
	  res.header("Access-Control-Allow-Origin", "*");
	  res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
	  next();
	});
	
	
	
app.listen(3000, function () {
  console.log('Example app listening on port 3000!')
})


module.exports = app;