const db = require('../models/index')

exports.createBill = async(customerId,body) => {
  const bill = await db.Bills.create({
    customerId: req.user.id,
    receiverName: req.billItem.receiverName,
    receiverPhone: req.billItem.receiverPhone,
    receiverAddress: req.billItem.receiverAddress
  })
  return bills
}

exports.createBillDetail = async(billId,productId,quantity,totalPrice)=>{
  const productDetail = await db.BillProduct.create({
    billId: bill.id,
    productId: product.id,
    quantity: req.body.quantity,
    totalPrice: (req.billItem.price * req.body.quantity)
  })
  return productDetail
}

exports.deleteBill = async(id)=>{
  await db.Bills.destroy({where: {id: id}})
}

module.exports
