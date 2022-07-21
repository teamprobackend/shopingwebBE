const db = require('../models/index');
let roles = ["user","staff","admin"];
async function insertRoles(){
  for(let role of roles){
    await db.Roles.create({name: role});
  }
}
insertRoles();
