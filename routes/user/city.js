var express = require('express');
var router = express.Router();
var pool = require('../../config/config');

// for testing
router.get('/', function(req, res, next) {
    res.send('respond with a resource in app city api');
});

// get all cities for auto complete
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

// get max 6 cities for home screen
router.get('/home',function(req,res){
    var user_id = req.query.user_id
	var sql = "select city.* from city inner join package on city.id=package.to_id where package.from_id=(select city_id from user where id=?) limit 6";
	pool.query(sql,[user_id],function(err,result){
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

// get all cities for see more button
router.get('/seeall',function(req,res){
    var user_id = req.query.user_id
	var sql = "select city.* from city inner join package on city.id=package.to_id where package.from_id=(select city_id from user where id=?)";
	pool.query(sql,[user_id],function(err,result){
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