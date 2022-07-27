const router = require('express').Router()
const userController = require('../controller/userController')
const checkToken = require('../middleware/checkToken')



router.use(checkToken.protect)
router.patch('/updateMe', userController.updateMe)
router.get('/checkProductQuantity', userController.checkProductQuantity)
router.post('/sendBuyRequest', userController.buyProduct)

module.exports = router
