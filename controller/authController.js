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
    try{
      await authServices.login(req.body)
    }catch(err){
      res.status(403).json({
          status: 'fail',
          data: err
      })
    }
}


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
