const fs = require("fs");
const db = require("../models/index");
const StreamArray = require('stream-json/streamers/StreamArray');

function convertToNumber(chars){
  //console.log(chars);
  let result = JSON.stringify(chars).match(/[0-9]/g);
  return parseInt(result.join(""));
}

async function findCategory(categoryName,key){
  const category = await db.Categories.findOne({where: {name: categoryName}});
  if(category){
    return category.id;
  }
  return key+1;
}


async function insertRec({key,value}) {
  let products = value[1];
  Object.keys(products).forEach(async(key) => {
    let product = products[key];
    const my_product = await db.Products.findOne({where: {id: convertToNumber(product["STT"])}});
    if(!my_product){
      await db.Products.create({
        productName: product["productName"],
        price: convertToNumber(product["price"]),
        quantity: convertToNumber(product["quantity"]),
        image1: product["image"].src,
        description: product["discription"],
        STT: convertToNumber(product["STT"]),
        categoryId: await findCategory(value[0],key),
        labelId: convertToNumber(product['label'])
      })
    }
  })
  //console.log(JSON.stringify(row)+"\n")
}

async function process() {
  return new Promise((resolve, reject) => {
    fs.createReadStream('data.json')
      .pipe(StreamArray.withParser())
      .on("data", async (row) => {
        await insertRec(row)
      })
      .on("error", err => {
        reject(err);
      })
      .on("end", () => {
        console.log("CSV file successfully processed");
        resolve();
      });
  });
}

process();
