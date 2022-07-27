const express = require('express')
const morgan = require('morgan')
const helmet = require('helmet') // security
const cors = require('cors')
// Router
import { authRouter, productRouter, userRouter } from './route'

const app = express()

app.use(helmet())
app.use(morgan('dev'))
// read req.body body parser
app.use(express.json())
app.use(express.urlencoded({ extended: false }))
app.use(cors({ 'Access-Control-Allow-Origin': '*' }))
// Serving static files
app.use(express.static(`${__dirname}/public`))

// Route hander
app.use('/api/v1/users', userRouter)
app.use('/api/v1/products', productRouter)
app.use('/api/v1/auth', authRouter)
module.exports = app
