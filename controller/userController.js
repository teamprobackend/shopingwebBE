const db = require('../models/index')
const userServices = require('../services/userServices')
const productServices = require('../services/productServices')
const billServices = require('../services/billServices')
// Update Me
exports.updateMe = async (req, res) => {
  try {
    const user = req.user
    const userProfile = await userService.updateService(req.body, user.id)
    res.status(200).json({
      status: 'success',
      data: {
        userProfile
      }
    })
  } catch (err) {
    res.status(403).json({
      status: 'fail',
      data: {
        err
      }
    })
    console.log(err);
  }
}

exports.checkProductQuantity = async (req, res, next) => {
  const product = await productServices.getProductById(req.body.id)
  if (product.quantity > 0 && product.quantity >= req.body.quantity) {
    return res.status(200).json({
      status: 'success',
      data: product.quantity
    })
  }
  return res.status(404).json({
    status: 'failure',
    data: 'Het hang :))'
  })
}

exports.buyProduct = async (req, res) => {
  // Receive Information from Bill Form
  const { receiverName, receiverPhone, receiverAddress } = req.body;
  const billItem = {
    'receiverName': req.body.receiverName,
    'receiverPhone': req.body.receiverPhone,
    'receiverAddress': req.body.receiverAddress,
  }
  //
  const bill = await billServices.createBill(req.user.id, billItem)
  if (bill) {
    const product = await productServices.getProductById(req.body.id)
    if (product) {
      const totalPrice = product.price * req.body.quantity
      const productDetail = await billServices.createBillDetail(bill.id, product.id, req.body.quantity, totalPrice)
      if (productDetail) {
        product.quantity -= req.body.quantity
      } else {
        await billServices.deleteBill(bill.id)
        return res.status(404).json({
          status: 'fail',
          data: 'ERROR'
        })
      }
    } else {
      await billServices.deleteBill(bill.id)
      return res.status(404).json({
        status: 'fail',
        data: 'ERROR'
      })
    }
  } else {
    return res.status(404).json({
      status: 'fail',
      data: 'ERROR'
    })
  }
}

export const getCurrentUser = (req, res) => res.status(200).json({
  isSucess: true,
  msg: 'Đăng nhập thành công',
  data: req.user
})

