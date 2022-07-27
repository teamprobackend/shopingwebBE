import express from 'express'
import * as authController from '../controller/authController'
import { protect } from '../middleware/checkToken'

const router = express.Router()

router.post('/signup', authController.signup)
router.post('/login', authController.login)
router.post('/send-email', protect, authController.sendEmail)
router.get('/verify-email', authController.verifyEmail)
router.put('/update-password', protect, authController.updatePassword)

export default router