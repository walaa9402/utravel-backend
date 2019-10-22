var express = require('express');
var router = express.Router();
var pool = require('../../config/config');

// for testing
router.get('/', function(req, res, next) {
    res.send('respond with a resource in app city api');
});

// get all cities
router.get('/all',function(req,res){
	var sql = "SELECT * FROM city";
	pool.query(sql,function(err,result){
				if(err){
			res.json({			
				status : false,
				data : null,
				message : err				
			});			
		}else{
			
			res.json({		
				status : true,
				data : result,
				message : "done"			
			});		
			
		}		
		
	});
});


router.post('/add',function(req,res){
    var name = req.body.name
    var photo = req.body.photo
	var sql = "insert into city (name,photo) values (?,?)";
	pool.query(sql,[name,photo],function(err,result){
				if(err){
			res.json({			
				status : false,
				data : null,
				message : err				
			});			
		}else{
			
			res.json({		
				status : true,
				data : result,
				message : "city inserted"			
			});		
			
		}		
		
	});
});
module.exports = router;