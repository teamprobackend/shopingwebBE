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
      console.log(err)
    }
}

module.exports
