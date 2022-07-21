const router = require('express').Router()
const authController = require('./../controller/authController')
const userController = require('./../controller/userController')

router.post('/signup', authController.signup)
router.post('/login', authController.login)
router.patch('/updateYourPassword', authController.protect, authController.updatePassword)


router.use(authController.protect)
router.patch('/updateMe', userController.updateMe)
//router.get('/getMe', userController.getMe)

//router.use(authController.restrictTo('Admin'))
//router.get('/getAllUsers', userController.getAllUsers)
//router.route('/:id').get(userController.getUser).patch(userController.updateUser).delete(userController.deleteUser)
module.exports = router
