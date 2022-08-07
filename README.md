+) DB: Download sql file and open in XAMPP
  1) Open XAMPP and start APACHE server and MYSQL
  2) In browser, type: http://localhost/phpmyadmin
  3) New -> Look at Create database -> Database name, type: shopingwebdb -> Create
  4) shopingwebdb -> Import -> File to import -> Choose file shopingwebdb.sql -> Import

+) BE CODE:
  *) Package required: dotenv, cors, morgan, helmet, express
     Install cmd: npm i dotenv cors morgan helmet express @babel/core @babel/node @babel/preset-env
  *) Cmd run BE code: npm run start
  *) Send get request to http://localhost:8888/api/v1/products to get products for Homepage   

+) Route:
  *) User: http://localhost:8888/api/v1/users
     Signup: POST -> User/signup
     Login:  POST -> User/login
     UpdateProfile: PATCH -> User/updateMe
     UpdatePassword: PATCH -> User/updateYourPassword
  *) Products: http://localhost:8888/api/v1/products
