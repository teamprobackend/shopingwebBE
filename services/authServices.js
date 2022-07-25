const db = require('../models/index')

const signToken = id => {
    return jwt.sign({ id }, process.env.JWT_SECRET, {
        expiresIn: process.env.JWT_EXPIRES_IN
    })
}

const createSendToken = (user, statusCode, res) => {
    const token = signToken(user.id)
    res.status(statusCode).json({
        status: 'success',
        token,
        data: {
            user
        }
    })
}

exports.signup = async({email,pass,phone}) => {
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
  if (phone) {
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

exports.login = async({email,pass,phone})=>{
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
}

exports.updatePassword = async(currentUser,body)=>{
  // 1) Get user
  const user = await db.User.findOne({ where: { id: currentUser.id } })
  console.log(user.password)
  // 2) Check current pass is correct
  const checkPass = await bcrypt.compare(body.currentPass, user.password)
  if (!checkPass) {
      return res.status(403).json({
          status: 'fail',
          err: 'Sai mật khẩu'
      })
  }
  // 3) Ok -> update
  const salt = await bcrypt.genSalt(10)
  const hashedPassword = await bcrypt.hash(body.newPass, salt)
  user.password = hashedPassword
  await user.save()
  createSendToken(user, 200, res)
}

module.exports
