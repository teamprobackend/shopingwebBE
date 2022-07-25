const db = require('../models/index')
const jwt = require('jsonwebtoken')
const bcrypt = require('bcrypt')
const authServices = require('../services/authServices')


exports.signup = async (req, res, next) => {
    try {
        await authServices.signup(req.body)
    }
    catch (err) {
      res.status(403).json({
          status: 'fail',
          data: err
      })
    }
}

exports.login = async (req, res, next) => {
    //const { email, phone, pass } = req.body
    try{
      await authServices.login(req.body)
    }catch(err){
      res.status(403).json({
          status: 'fail',
          data: err
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
    try{
      await authServices.updatePassword(req.user,req.body)
    }catch(err){
      res.status(403).json({
          status: 'fail',
          data: err
      })
    }
}

module.exports
