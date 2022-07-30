import express from 'express'
import * as authController from '../controller/authController'
import { protect } from '../middleware/checkToken'
import passport from 'passport'
require('dotenv').config()

const router = express.Router()

router.post('/signup', authController.signup)
router.post('/login', authController.login)
router.post('/send-email', protect, authController.sendEmail)
router.get('/verify-email', authController.verifyEmail)
router.put('/update-password', protect, authController.updatePassword)

// OAUTH GOOGLE
router.get('/google', passport.authenticate('google', { scope: ['email', 'profile'] }))
router.get('/google/callback',
    passport.authenticate('google', { failureRedirect: '/login' }),
    function (req, res) {
        // Successful authentication, redirect home.
        res.redirect(process.env.URL_REACT_APP);
    });

router.get('/logout', function (req, res, next) {
    req.logOut(() => {
        res.status(200).clearCookie('connect.sid', {
            path: '/'
        });
        req.session.destroy(function (err) {
            res.redirect(process.env.URL_REACT_APP);
        });
    })
});

export default router