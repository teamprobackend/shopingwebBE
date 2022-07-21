const db = require('./../models/index')
const factory = require('./handlerFactory')

exports.getAllProduct = factory.getAll(db.Product)