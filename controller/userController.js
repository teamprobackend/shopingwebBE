const db = require('../models/index')

// Update Me
exports.updateMe = async (req, res, next) => {
    try {
        const user = req.user
        const update = await db.User.update(req.body, { where: { id: user.id } })
        res.status(200).json({
            status: 'success',
            data: {
                user
            }
        })
    } catch (err) {
      console.log(err);
    }
}
module.exports
