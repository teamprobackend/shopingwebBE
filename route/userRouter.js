const router = require('express').Router()
const userController = require('../controller/userController')

router.patch('/updateMe', userController.updateMe)
router.get('/checkProductQuantity', userController.checkProductQuantity)
router.post('/sendBuyRequest', userController.buyProduct)

module.exports = router
