const db = require('../models/index')

export const updateService = async (body, id) => {
  let updatedUser = await db.Users.update(body, { where: { id: id } })
  return updatedUser
}


export const getProfileService = (userId) => {

}
