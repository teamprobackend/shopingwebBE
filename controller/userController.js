const db = require('../models/index')
const userServices = require('../services/userServices')
const productServices = require('../services/productServices')
const billServices = require('../services/billServices')
// Update Me
exports.updateMe = async (req, res) => {
    try {
      const user = req.user
      const userProfile = await userService.updateService(req.body, user.id)
      //const update = await db.User.update(req.body, { where: { id: user.id } })
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

exports.checkProductQuantity = async (req,res,next) => {
  //let product = await db.Products.findOne({where:{id:req.body.id}})
  let product = await productServices.getProductById(req.body.id)
  if(product.quantity > 0 && product.quantity >= req.body.quantity) {
    return res.status(200).json({
      status: 'success',
    })
  }
  return res.status(404).json({
    status: 'failure',
    data: 'Het hang :))'
  })
}

exports.buyProduct = async(req,res)=>{
  //1) Click on Buy button
  //2) Bill form -> Get address,name,phone of the user
  //3) Nhap ma giam gia

  //4) Dat hang -> Update bill,update product quantity,create billProduct
  /*const bill = await db.Bills.create({
    customerId: req.user.id,
    receiverName: req.billItem.receiverName,
    receiverPhone: req.billItem.receiverPhone,
    receiverAddress: req.billItem.receiverAddress
  })*/
  const bill = await billServices.createBill(req.user.id,req.billItem)
  if(bill){
    let product = await productServices.getProductById(req.body.id)
    if(product){
      /*
      let productDetail = await db.BillProduct.create({
        billId: bill.id,
        productId: product.id,
        quantity: req.body.quantity,
        totalPrice: (req.billItem.price * req.body.quantity)
      })*/
      let productDetail = await billServices.createBillDetail(bill.id,product.id,req.body.quantity,totalPrice)
      if(productDetail){
        product.quantity -= req.body.quantity
      }else{
        await billServices.deleteBill(bill.id)
        return res.status(404).json({
          status: 'fail',
          data: 'ERROR'
        })
      }
    }else{
      await billServices.deleteBill(bill.id)
      return res.status(404).json({
        status: 'fail',
        data: 'ERROR'
      })
    }
  }else{
    return res.status(404).json({
      status: 'fail',
      data: 'ERROR'
    })
  }
}

module.exports
