exports.getBillInfo = async(req,res,next)=>{
  let {receiverName,receiverPhone,receiverAddress,price} = req.body;
  req.billItem = {
    'receiverName': receiverName,
    'receiverPhone': receiverPhone,
    'receiverAddress': receiverAddress,
    'price': price
  }
  next()
}

module.exports
