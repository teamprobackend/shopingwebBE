const db = require('../models/index')

exports.updateService = async(body,id) => {
  let updatedUser = await db.Users.update(body,{where:{id: id}})
  return updatedUser
}

module.exports
