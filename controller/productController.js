const db = require('../models/index')
const productServices = require('../services/productServices')
const fs = require('fs')
exports.getAllProduct = async (req, res) => {
    try {
        /*
        const allCategories = await db.Categories.findAll({})
        const allLabels = await db.Labels.findAll({})
        let products = {};
        for(let category of allCategories){
          let categoryName = category.dataValues.name
          let categoryId = category.dataValues.id
          if(!products[categoryName]) products[categoryName] = {}
          for(let label of allLabels){
            let labelName = label.dataValues.name
            let labelId = label.dataValues.id
            if(!products[categoryName][labelName]) products[categoryName][labelName] = []
            let allProducts = await db.Products.findAll({
              where:{
                labelId: labelId,
                categoryId: categoryId
              }
            })
            for(let product of allProducts){
              products[categoryName][labelName].push(product.dataValues)
            }
          }
        }*/
        const allProducts = await productServices.getAllProducts();
        /*
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
        } */
        return res.status(200).json({
            status: "success",
            dataProduct: allProducts
        })
    } catch (err) {
        res.status(404).json({
            status: 'fail',
            err
        })
    }
}

exports.getOneProduct = async (req, res) => {
    try {
        /*
        const oneProduct = await db.Products.findByPk(req.params.id, {
            include: [
                {
                    model: db.Categories,
                    as: 'category',

                },
                {
                    model: db.Labels,
                    as: 'label',

                }
            ]
        })*/
        const oneProduct = await productServices.getProductById(req.params.id)
        // const productDetail = await db.Categories.findByPk(oneProduct.categoryId,{})
        return res.status(200).json({
            status: "success",
            dataProduct: oneProduct
        })
    } catch (err) {
        res.status(404).json({
            status: 'fail',
            err
        })
    }
}

/*
exports.createBill = async (req, res, next) => {
    try {

        req.billTmp = billTmp
        next()
    } catch (err) {
        res.status(404).json({
            status: 'fail',
            err
        })
    }
}
// buyProduct/:id
exports.buyProduct = async (req, res) => {
    try {
        const quantity = req.body.quantity
        const oneProduct = await db.Products.findByPk(req.params.id)
        //check if oneProduct.quantity >= quantity
        const total = quantity * oneProduct.price
        const billTmp = await db.BillProduct.create({
            productId: req.params.id,
            quantity: quantity,
            totalPrice: total
        })
        const { name, address, phone, date, email } = req.body
        const bill = await db.Bill.create({
            cusId: req.user.id,
            date: date,
            receiverName: name,
            receiverAddress: address,
            receiverPhone: phone
        })
        const product = await db.Products.findByPk(req.params.id)
        product.quantity -= quantity
        product.save()
        return res.status(200).json({
            status: "success",
            billDetail: {
                bill,
                total
            }
        })
    } catch (err) {
        res.status(404).json({
            status: 'fail',
            err
        })
    }
}
*/
