const db = require('../models/index')
const productServices = require('../services/productServices')
const fs = require('fs')
exports.getAllProduct = async (req, res) => {
    try {
        const allProducts = await productServices.getAllProducts();
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
        const oneProduct = await productServices.getProductById(req.params.id)
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
