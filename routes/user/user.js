var jwt = require('jwt-simple');

var express = require('express');
var router = express.Router();
var pool = require('../../config/config');
var app = express();

/* Just for testing. */
router.get('/', function(req, res, next) {
  res.send('respond with a resource in users');
});

// user login
router.post('/login',function(req,res){
    var phone=req.body.phone
    var passwd = req.body.passwd
	var sql = "SELECT *,(select name from city where id=city_id) as city FROM user where phone =? and passwd=?";
	pool.query(sql,[phone,passwd],function(err,result){
        if(err){
            console.log(err)
            res.json({			
                status : false,
                data : {},
                message : err				
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
                    message : "login successfully",
                    token:token			
                });
            }else{
                res.json({			
                    status : false,
                    data : {},
                    message : "check your phone or password"				
                }); 
            }
        }		
	});
});

// user sign up
router.post('/signup',function(req,res){
	var name=req.body.name
	var passwd=req.body.passwd
	var phone= req.body.phone
	var city_id= req.body.city_id
	var sql = "select name from user where phone=?";
	pool.query(sql,[phone],function(err,result){
				if(err){
			res.json({			
				status : false,
				data : {},
				message : "error in connection"				
			});			
		}else{
			if(result.length>0){
				res.json({		
					status : false,
					data : {},
					message : "phone already exists"			
				});
			}else{
                var sql = "insert into user (name,phone,passwd,city_id) values(?,?,?,?)";
                pool.query(sql,[name,phone,passwd,city_id],function(err,result){
                            if(err){
                        res.json({			
                            status : false,
                            data : {},
                            message : "error in connection"				
                        });			
                    }else{
                        var sql = "SELECT *,(select name from city where id=city_id) as city FROM user where id=?";
                        pool.query(sql,[result['insertId']],function(err,result){
                            if(err){
                                console.log(err)
                                res.json({			
                                    status : false,
                                    data : {},
                                    message : err				
                                });			
                            }else{  
                                app.set('jwtTokenSecret', "utravel");
                                var token = jwt.encode({
                                    iss: result[0].phone
                                }, app.get('jwtTokenSecret'));
                                res.json({		
                                    status : true,
                                    data : result[0],
                                    message : "signup successfully",
                                    token:token			
                                });
                            }		
                        });
                    }		
                });
            }
		}		
		
	});
});



module.exports = router;
