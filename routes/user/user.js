var jwt = require('jwt-simple');

var express = require('express');
var router = express.Router();
var pool = require('../config/config');
var app = express();

/* Just for testing. */
router.get('/', function(req, res, next) {
  res.send('respond with a resource in users');
});

// user login
router.post('/login',function(req,res){
	var phone=req.body.phone
	var sql = "SELECT * FROM user where phone =?";
	pool.query(sql,[phone],function(err,result){
        if(err){
            console.log(err)
            res.json({			
                status : false,
                data : {},
                message : "error in connection"				
            });			
		}else{
            if(result.length>0){
                app.set('jwtTokenSecret', "utravel");
                var token = jwt.encode({
                    iss: result[0].phone
                }, app.get('jwtTokenSecret'));
                res.json({		
                    status : true,
                    data : result[0],
                    message : "done",
                    token:token			
                });
            }else{
                res.json({			
                    status : false,
                    data : {},
                    message : "check your phone number"				
                }); 
            }
        }		
		
	});
});

// cc owner or assistant sign up
router.post('/signup',function(req,res){
	var name=req.body.name
	var passwd=req.body.passwd
	var phone= req.body.phone
	var city_id= req.body.city_id
	var sql = "select name from employee where phone=?";
	pool.query(sql,[phone],function(err,result){
				if(err){
			res.json({			
				status : false,
				data : null,
				message : "error in connection"				
			});			
		}else{
			if(result.length>0){
				res.json({		
					status : false,
					data : result,
					message : "phone already exists"			
				});
			}else{
                var sql = "insert into user (name,phone,passwd,city_id) values(?,?,?,?)";
                pool.query(sql,[name,phone,passwd,city_id],function(err,result){
                            if(err){
                        res.json({			
                            status : false,
                            data : null,
                            message : "error in connection"				
                        });			
                    }else{
                        res.json({		
                            status : true,
                            data : result,
                            message : "successfully sign up"			
                        });
                    }		
                    
                });
            }
		}		
		
	});
});



module.exports = router;