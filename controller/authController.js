const db = require('../models/index')
const jwt = require('jsonwebtoken')
const bcrypt = require('bcrypt')

const signToken = id => {
    return jwt.sign({ id }, process.env.JWT_SECRET, {
        expiresIn: process.env.JWT_EXPIRES_IN
    })
}

const createSendToken = (user, statusCode, res) => {
    const token = signToken(user.id)
    const cookieOptions = {
        expires: new Date(Date.now() + process.env.JWT_COOKIE_EXPIRES_IN * 24 * 60 * 60 * 1000),
        httpOnly: true
    }
    res.cookie('jwt', token, cookieOptions)
    res.status(statusCode).json({
        status: 'success',
        token,
        data: {
            user
        }
    })
}

exports.signup = async (req, res, next) => {
    try {
        const { email, phone, pass } = req.body
        console.log(req.body.phone)
        const salt = await bcrypt.genSalt(10)
        const hashedPassword = await bcrypt.hash(pass, salt)
        if (email) {
            const userCheck = await db.User.findOne({ where: { email: email } })
            if (userCheck) {
                return res.status(404).json({
                    status: 'fail',
                    err: 'Người dùng tồn tại'
                })
            }
            const newUser = await db.User.create({
                email: email,
                password: hashedPassword
            })
            createSendToken(newUser, 200, res)
        }
        else if (phone) {
            const userCheck = await db.User.findOne({ where: { phone: phone } })
            if (userCheck) {
                return res.status(404).json({
                    status: 'fail',
                    err: 'Người dùng tồn tại'
                })
            }
            const newUser = await db.User.create({
                phone: phone,
                password: hashedPassword
            })
            createSendToken(newUser, 200, res)
        }
    }

    catch (err) {
        res.status(403).json({
            err
        })
    }
}

exports.login = async (req, res, next) => {
    try {
        const { email, phone, pass } = req.body
        if (email) {
            const currentUser = await db.User.findOne({ where: { email: email } })
            if (!currentUser || !(await bcrypt.compare(pass, currentUser.password))) {
                return res.status(403).json({
                    status: 'fail',
                    err: 'Sai thông tin đăng nhập'
                })
            }
            createSendToken(currentUser, 200, res)
        }
        if (phone) {
            const currentUser = await db.User.findOne({ where: { phone: phone } })
            if (!currentUser || !(await bcrypt.compare(pass, currentUser.password))) {
                return res.status(403).json({
                    status: 'fail',
                    err: 'Sai thông tin đăng nhập'
                })
            }
            createSendToken(currentUser, 200, res)
        }
    } catch (err) {
        res.status(403).json({
            err
        })
    }
}

exports.logout = async (req, res, next) => {
    try {
        let token
        if (req.headers.authorization && req.headers.authorization.startsWith('Bearer')) {
            token = req.headers.authorization.split(' ')[1]
        }
        token = null
        return res.status(200).json({
            status: 'Logout success',
            token
        })
    } catch (err) {
        res.status(403).json({
            err
        })
    }
}

// protect route only login
exports.protect = async (req, res, next) => {
    try {
        // 1) Get token and check 
        let token
        if (req.headers.authorization && req.headers.authorization.startsWith('Bearer')) {
            token = req.headers.authorization.split(' ')[1]
        }
        if (!token) {
            return res.status(403).json({
                status: 'fail',
                err: 'Bạn chưa đăng nhập Vui lòng đăng nhập'
            })
        }
        // 2) Verify token
        const decoded = await jwt.verify(token, process.env.JWT_SECRET)
        // 3) Check user still exists
        const currentUser = await db.User.findOne({ where: { id: decoded.id } })
        if (!currentUser) {
            return res.status(403).json({
                status: 'fail',
                err: 'Token hết hạn'
            })
        }
        req.user = currentUser
        next()
    }
    catch (err) {
        res.status(403).json({
            err
        })
    }
}

// Phân quyền
// exports.restrictTo = (...roles) => {
//     return(req,res,next)=>{
//         if(!roles.includes(req.user.))
//     }
// }

// Quên mật khẩu
// exports.forgotPassword = async (req, res, next) => {

// }

exports.updatePassword = async (req, res, next) => {
    // 1) Get user
    try {
        const user = await db.User.findOne({ where: { id: req.user.id } })
        console.log(user.password)
        // 2) Check current pass is correct
        const checkPass = await bcrypt.compare(req.body.currentPass, user.password)
        if (!checkPass) {
            return res.status(403).json({
                status: 'fail',
                err: 'Sai mật khẩu'
            })
        }
        // 3) Ok -> update
        const salt = await bcrypt.genSalt(10)
        const hashedPassword = await bcrypt.hash(req.body.newPass, salt)
        user.password = hashedPassword
        await user.save()
        createSendToken(user, 200, res)
    } catch (err) {
        res.status(403).json({
            err
        })
    }
}

