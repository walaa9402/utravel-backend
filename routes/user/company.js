var express = require('express');
var router = express.Router();
var pool = require('../../config/config');

// for testing
router.get('/', function(req, res, next) {
    res.send('respond with a resource in app company api');
});

// get companies for home screen
router.get('/home',function(req,res){
    var user_id = req.query.user_id
	var sql = "SELECT id,name,logo,cover,(select avg(rate) from company_rate where company_id=company.id) as rate,(select user_id from user_comp_fav where company_id=company.id and user_id=?) as is_fav FROM company where city_id=(select city_id from user where id=?) limit 6";
	pool.query(sql,[user_id,user_id],function(err,result){
				if(err){
			res.json({			
				status : false,
				data : null,
				message : err				
			});			
		}else{
			if(result.length>0){
                result = result.map( element => {
                    if(!element['rate']){
                        element['rate']=0
                    }
                    if(!element['is_fav']){
                        element['is_fav']=0
                    }else{
                        element['is_fav']=1
                    }
                    return element
                })
            }
			res.json({		
				status : true,
				data : result,
				message : "done"			
			});		
			
		}		
		
	});
});

// get all companies
router.get('/seeall',function(req,res){
    var user_id = req.query.user_id
	var sql = "SELECT id,name,logo,cover,(select avg(rate) from company_rate where company_id=company.id) as rate,(select user_id from user_comp_fav where company_id=company.id and user_id=?) as is_fav FROM company where city_id=(select city_id from user where id=?)";
	pool.query(sql,[user_id,user_id],function(err,result){
				if(err){
			res.json({			
				status : false,
				data : null,
				message : err				
			});			
		}else{
			if(result.length>0){
                result = result.map( element => {
                    if(!element['rate']){
                        element['rate']=0
                    }
                    if(!element['is_fav']){
                        element['is_fav']=0
                    }else{
                        element['is_fav']=1
                    }
                    return element
                })
            }
			res.json({		
				status : true,
				data : result,
				message : "done"			
			});		
			
		}		
		
	});
});

module.exports = router;