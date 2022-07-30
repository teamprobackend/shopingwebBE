const router = require('express').Router()
const userController = require('../controller/userController')
import { isLoggedIn } from '../middleware/isLoggedIn'


router.get('/get-profile', isLoggedIn, userController.getCurrentUser)


// router.use(checkToken.protect)
router.patch('/updateMe', userController.updateMe)
router.get('/checkProductQuantity', userController.checkProductQuantity)
router.post('/sendBuyRequest', userController.buyProduct)

module.exports = router
