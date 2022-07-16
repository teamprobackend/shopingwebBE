const router = require('express').Router()
const authController = require('./../controller/authController')
const userController = require('./../controller/userController')

router.post('/signup', authController.signup)
router.post('/login', authController.login)
router.patch('/logout', authController.protect, authController.logout)
router.patch('/updateYourPassword', authController.protect, authController.updatePassword)
router.patch('/updateMe', authController.protect, userController.updateMe)
module.exports = router