api : user/signup
method : post
body : name, phone, passwd, city_id
========================================
api : user/login
method : post
body : phone
========================================
api : user/city/all
method : get
query : none
========================================
api : user/company/home
method : get
query : user_id
========================================
api : user/city/home
method : get
query : user_id
========================================
api : user/company/seeall
method : get
query : user_id
========================================
api : user/city/seeall
method : get
query : user_id
========================================