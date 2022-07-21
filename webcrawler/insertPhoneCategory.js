const fs = require('fs');
const StreamArray = require('stream-json/streamers/StreamArray');
const db = require('../models/index');
/*
let rows = {
  "Kích thước màn hình":"screenSize",
  "Công nghệ màn hình":"screenTechnology",
  "Camera sau":"cameraBack",
  "Camera trước":"cameraFont",
  "Chipset":"chipset",
  "Dung lượng RAM":"ram",
  "Bộ nhớ trong":"rom",
  "Pin":"battery",
  "Hệ điều hành":"OS",
  "Độ phân giải màn hình":"screenResolution",
  "Tính năng màn hình":"screenFeature",
  "Trọng lượng":"weight",
  "Bluetooth":"bluetooth",
  "Tần số quét":"refreshRate",
  "product_id": "STT"
}*/
function convertToNumber(chars){
  //console.log(chars);
  let result = JSON.stringify(chars).match(/[0-9]/g);
  return parseInt(result.join(""));
}

async function insertRec({key,value}){
  const product = await db.PhonesCategory.findOne({
    where: {product_id: convertToNumber(value["product_id"])}
  });

  if(!product){
    await db.PhonesCategory.create({
      screenSize: value["Kích thước màn hình"],
      screenTechnology: value["Công nghệ màn hình"],
      cameraBack: value["Camera sau"],
      cameraFont: value["Camera trước"],
      chipset: value["Chipset"],
      ram: value["Dung lượng RAM"],
      rom: value["Bộ nhớ trong"],
      battery: value["Pin"],
      OS: value["Hệ điều hành"],
      screenResolution: value["Độ phân giải màn hình"],
      screenFeature: value["Tính năng màn hình"],
      weight: value["Trọng lượng"],
      bluetooth: value["Bluetooth"],
      refreshRate: value["Tần số quét"],
      product_id: convertToNumber(value["product_id"])
    })
  }
}

async function process() {
  return new Promise((resolve, reject) => {
    fs.createReadStream('phoneCategory.json')
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
