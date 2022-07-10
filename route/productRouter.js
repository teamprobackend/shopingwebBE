const router = require('express').Router()
const producController = require('./../controller/productController')
router.route('/').get(producController.getAllProduct)
module.exports = router