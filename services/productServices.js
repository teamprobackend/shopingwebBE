const db = require('../models/index')

exports.getProductById = async(id) => {
  const product = await db.Products.findOne({where: {id: id}})
  return product
}

exports.getAllProducts = async() => {
  const allProducts = await db.Products.findAll({
    include:[
      {model: db.Categories,as:'Categories',attributes:['name']},
      {model: db.Labels,as:'Labels',attributes:['name']}
    ],
    raw: true,
    nested: true
  });
  let products = {};
  for(let product of allProducts){
    let category = product['Categories.name']
    let label = product['Labels.name']
    if(products[category] === undefined) products[category] = {}
    if(products[category][label] === undefined) products[category][label] = []
    products[category][label].push(product)
  }
  return allProducts
}

module.exports
