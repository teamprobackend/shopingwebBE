const router = require('express').Router()
const authController = require('../controller/authController')
const userController = require('../controller/userController')
const checkToken = require('../middleware/checkToken')

router.post('/signup', authController.signup)
router.post('/login', authController.login)

router.use(checkToken.protect)
router.patch('/updateYourPassword', authController.updatePassword)
router.patch('/updateMe', userController.updateMe)
router.get('/checkProductQuantity',userController.checkProductQuantity)
router.post('/sendBuyRequest',userController.buyProduct)
//router.get('/getMe', userController.getMe)

//router.use(authController.restrictTo('Admin'))
//router.get('/getAllUsers', userController.getAllUsers)
//router.route('/:id').get(userController.getUser).patch(userController.updateUser).delete(userController.deleteUser)
module.exports = router
