const express = require('express')
const app = express()
const morgan = require('morgan')
const helmet = require('helmet') // security
const cors = require('cors')
// Router
const userRouter = require('./route/userRouter')
const productRouter = require('./route/productRouter')

app.use(helmet())
app.use(morgan('dev'))
// read req.body body parser
app.use(express.json())
app.use(express.urlencoded({ extended: false }))
app.use(cors({'Access-Control-Allow-Origin' : '*'}))
// Serving static files
app.use(express.static(`${__dirname}/public`))

// Route hander
app.use('/api/v1/users', userRouter)
app.use('/api/v1', productRouter)
module.exports = app
