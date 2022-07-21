const db = require('../models/index.js');
const fs = require('fs');
const puppeteer = require('puppeteer');

/*
async function insertRec(row){
  let stt = row[0];
  let product_href = row[1];
  let this_product = await db.Products.findOne({STT: stt});
  let productDetailDataFile = '';

  let browser = await puppeteer.launch();
  let page = await browser.newPage();
  await page.goto(product_href);
  let data = await page.evaluate(()=>{
    const product_technical_info = document.querySelector('#tskt')
    .firstChild.childNodes;
    let productDetail = {};
    for(let tr of product_technical_info){
      productDetail[tr.firstChild.innerText] = tr.lastChild.innerText;
    }
    return productDetail;
  })
  switch(this_product.categoryId){
    case 1:
      fs.appendFile('phoneCategory.json',JSON.stringify(data),(err)=>{
        console.log(err);
      })
      break;
    case 2:
      fs.appendFile('laptopCategory.json',JSON.stringify(data),(err)=>{
        console.log(err);
      })
      break;
    case 8:
      fs.appendFile('televisionCategory.json',JSON.stringify(data),(err)=>{
        console.log(err);
      })
      break;
    case 7:
      fs.appendFile('ipadCategory.json',JSON.stringify(data),(err)=>{
        console.log(err);
      })
      break;
  }
} */

async function process() {
  let productDetailList = [[1,"https://cellphones.com.vn/iphone-11.html"],[2,"https://cellphones.com.vn/iphone-13-pro-max.html"],[3,"https://cellphones.com.vn/iphone-12-pro-max.html"],[4,"https://cellphones.com.vn/iphone-13.html"],[5,"https://cellphones.com.vn/xiaomi-redmi-note-11.html"],[6,"https://cellphones.com.vn/samsung-galaxy-s22-ultra.html"],[7,"https://cellphones.com.vn/iphone-12.html"],[8,"https://cellphones.com.vn/xiaomi-redmi-note-11-pro-plus.html"],[9,"https://cellphones.com.vn/iphone-11-128gb.html"],[10,"https://cellphones.com.vn/xiaomi-redmi-note-11-pro.html"],[11,"https://cellphones.com.vn/samsung-galaxy-z-fold-3.html"],[12,"https://cellphones.com.vn/xiaomi-redmi-note-11-128gb.html"],[13,"https://cellphones.com.vn/samsung-galaxy-s22-plus.html"],[14,"https://cellphones.com.vn/oppo-reno-6z.html"],[15,"https://cellphones.com.vn/samsung-galaxy-a73.html"],[16,"https://cellphones.com.vn/iphone-13-pro.html"],[17,"https://cellphones.com.vn/nubia-red-magic-7.html"],[18,"https://cellphones.com.vn/samsung-galaxy-note-20-ultra-5g.html"],[19,"https://cellphones.com.vn/oppo-reno7-z.html"],[20,"https://cellphones.com.vn/samsung-galaxy-a33.html"],[21,"https://cellphones.com.vn/macbook-air-m2-2022.html"],[22,"https://cellphones.com.vn/macbook-air-2020-m1.html"],[23,"https://cellphones.com.vn/macbook-pro-m2-2022.html"],[24,"https://cellphones.com.vn/macbook-pro-2020-13-inch-touch-bar-m1.html"],[25,"https://cellphones.com.vn/laptop-asus-gaming-rog-strix-g15-g513ih-hn015w.html"],[26,"https://cellphones.com.vn/laptop-msi-gaming-bravo-15-b5dd-276vn.html"],[27,"https://cellphones.com.vn/laptop-asus-vivobook-13-slate-oled-t3300.html"],[28,"https://cellphones.com.vn/laptop-msi-modern-14-b11mou-1030vn.html"],[29,"https://cellphones.com.vn/laptop-hp-14-cf2033wm-3v7g4ua-pent.html"],[30,"https://cellphones.com.vn/laptop-gaming-acer-nitro-5-an515-45-r6ev.html"],[31,"https://cellphones.com.vn/macbook-pro-14-inch-2021.html"],[32,"https://cellphones.com.vn/laptop-lenovo-legion-5-15ach6-82jw00jpvn.html"],[33,"https://cellphones.com.vn/imac-2021.html"],[34,"https://cellphones.com.vn/laptop-asus-flip-br1100fka-bp1088w.html"],[35,"https://cellphones.com.vn/laptop-asus-vivobook-15x-a1503za-l1422w.html"],[36,"https://cellphones.com.vn/laptop-asus-vivobook-a515ea-l12033w.html"],[37,"https://cellphones.com.vn/macbook-pro-2020-13-inch-touch-bar-m1-16gb.html"],[38,"https://cellphones.com.vn/laptop-lenovo-ideapad-gaming-3-15ach6-82k201bbvn.html"],[39,"https://cellphones.com.vn/macbook-pro-2020-13-inch-touch-bar-m1-16gb-512gb.html"],[40,"https://cellphones.com.vn/laptop-asus-zenbook-um5302ta-lx087w.html"],[41,"https://cellphones.com.vn/laptop-xiaomi-redmibook-15-jyu4505ap.html"],[42,"https://cellphones.com.vn/man-hinh-samsung-m8.html"],[43,"https://cellphones.com.vn/pc-gaming-cps-001.html"],[44,"https://cellphones.com.vn/man-hinh-xiaomi-monitor-1c-23-8-inch-bhr4510gl.html"],[45,"https://cellphones.com.vn/man-hinh-lg-ultrawide-29-inch-29wp500.html"],[46,"https://cellphones.com.vn/man-hinh-samsung-28-inch-lu28r550uqexxv.html"],[47,"https://cellphones.com.vn/man-hinh-dell-ultrasharp-u2422h-23-8-inch.html"],[48,"https://cellphones.com.vn/man-hinh-samsung-27-inch-ls27am500nexxv.html"],[49,"https://cellphones.com.vn/man-hinh-huawei-mateview-28-inch.html"],[50,"https://cellphones.com.vn/man-hinh-dell-monitor-s2721ds-27-inch.html"],[51,"https://cellphones.com.vn/man-hinh-hp-z24n-g3-1c4z5aa-24-inch.html"],[52,"https://cellphones.com.vn/ipad-10-2-inch-2021.html"],[53,"https://cellphones.com.vn/ipad-air-5.html"],[54,"https://cellphones.com.vn/ipad-pro-11-2021.html"],[55,"https://cellphones.com.vn/ipad-mini-6.html"],[56,"https://cellphones.com.vn/samsung-galaxy-tab-s8-ultra.html"],[57,"https://cellphones.com.vn/xiaomi-mi-pad-5.html"],[58,"https://cellphones.com.vn/ipad-air-4.html"],[59,"https://cellphones.com.vn/samsung-galaxy-tab-a7-lite.html"],[60,"https://cellphones.com.vn/samsung-galaxy-tab-s7-fe.html"],[61,"https://cellphones.com.vn/samsung-galaxy-tab-s8.html"],[62,"https://cellphones.com.vn/apple-airpods-2.html"],[63,"https://cellphones.com.vn/apple-airpods-3.html"],[64,"https://cellphones.com.vn/tai-nghe-chup-tai-sony-wh-1000xm4.html"],[65,"https://cellphones.com.vn/apple-airpods-pro-2021.html"],[66,"https://cellphones.com.vn/tai-nghe-khong-day-jbl-live-pro-plus.html"],[67,"https://cellphones.com.vn/samsung-galaxy-buds-live.html"],[68,"https://cellphones.com.vn/samsung-galaxy-buds-pro.html"],[69,"https://cellphones.com.vn/loa-bluetooth-jbl-charge-4.html"],[70,"https://cellphones.com.vn/tai-nghe-khong-day-xiaomi-redmi-buds-3-lite.html"],[71,"https://cellphones.com.vn/apple-airpods-pro.html"],[72,"https://cellphones.com.vn/vong-deo-tay-thong-minh-huawei-band-7.html"],[73,"https://cellphones.com.vn/vong-deo-tay-thong-minh-xiaomi-mi-band-7.html"],[74,"https://cellphones.com.vn/dong-ho-thong-minh-huawei-watch-gt-3.html"],[75,"https://cellphones.com.vn/vong-deo-tay-thong-minh-xiaomi-mi-band-6.html"],[76,"https://cellphones.com.vn/apple-watch-se-40mm.html"],[77,"https://cellphones.com.vn/dong-ho-thong-minh-tre-em-k84.html"],[78,"https://cellphones.com.vn/dong-ho-thong-minh-xiaomi-mi-watch.html"],[79,"https://cellphones.com.vn/samsung-galaxy-watch-4.html"],[80,"https://cellphones.com.vn/dong-ho-thong-minh-xiaomi-redmi-watch-lite-2.html"],[81,"https://cellphones.com.vn/dong-ho-thong-minh-huawei-watch-fit-2.html"],[82,"https://cellphones.com.vn/robot-hut-bui-dreame-bot-w10.html"],[83,"https://cellphones.com.vn/apple-airtag.html"],[84,"https://cellphones.com.vn/may-loc-khong-khi-xiaomi-mi-air-purifier-4-pro.html"],[85,"https://cellphones.com.vn/quat-thong-minh-mi-smart-standing-fan-2-lite.html"],[86,"https://cellphones.com.vn/robot-hut-bui-dreame-d9-pro.html"],[87,"https://cellphones.com.vn/may-loc-khong-khi-xiaomi-mi-air-purifier-4-lite.html"],[88,"https://cellphones.com.vn/robot-hut-bui-xiaomi-dreame-d9.html"],[89,"https://cellphones.com.vn/may-chieu-xiaomi-mi-smart-projector-2.html"],[90,"https://cellphones.com.vn/robot-hut-bui-dreame-z10-pro.html"],[91,"https://cellphones.com.vn/may-chieu-samsung-the-freestyle.html"],[92,"https://cellphones.com.vn/smart-tivi-xiaomi-p1-55-inch.html"],[93,"https://cellphones.com.vn/smart-tivi-xiaomi-p1-43-inch.html"],[94,"https://cellphones.com.vn/smart-tivi-samsung-the-serif-4k-55-inch-qa55ls01ta.html"],[95,"https://cellphones.com.vn/smart-tivi-man-hinh-cong-samsung-4k-55-inch-55tu8300.html"],[96,"https://cellphones.com.vn/smart-tivi-lg-standby-me-27-inch-27art10akpl.html"],[97,"https://cellphones.com.vn/smart-tivi-nanocell-lg-4k-43-inch-43nano77tpa.html"],[98,"https://cellphones.com.vn/smart-tivi-coocaa-hd-32-inch-32s3u.html"],[99,"https://cellphones.com.vn/smart-tivi-samsung-crystal-uhd-4k-55-inch-ua55au8000kxxv.html"],[100,"https://cellphones.com.vn/smart-tivi-samsung-qled-55-inch-qa55q60aa.html"],[101,"https://cellphones.com.vn/smart-tivi-khung-tranh-samsung-the-frame-4k-50-inch-qa50ls03a.html"]];
  async function writeFile(file,data){
    fs.appendFile(file,data+"\r\n",(err)=>{
      if(err){
        console.log(err)
      }
    })
  }
  return new Promise(async (resolve, reject) => {
    for(let product of productDetailList.slice(20,43)){
      let stt = product[0];
      let url = product[1];
      const browser = await puppeteer.launch();
      const page = await browser.newPage();
      await page.goto(url);
      let data = await page.evaluate((stt,url)=>{
        let productDetail = {};
        if(document.getElementById("tskt") === null){
          if(document.querySelector(".technical-content") !== null){
            let product_technical_info = document.querySelector(".technical-content").childNodes;
            for(let product of product_technical_info){
              productDetail[product.firstChild.innerText] = product.lastChild.innerText;
            }
            return productDetail;
          }
          return {href: url};
        }
        const product_technical_info = document.getElementById("tskt")
        .getElementsByTagName("tr");
        for(let tr of product_technical_info){
          if(!tr) continue;
          productDetail[tr.getElementsByTagName("th")[0].innerText] = tr.getElementsByTagName("th")[1].innerText;
        }
        return productDetail;
      },stt,url);
      await browser.close();
      /*console.log(data);
      console.log('------------------');
      */
      let this_product = await db.Products.findOne({where: {STT: stt}});
      let productDetailFile;
      if(this_product){
        switch(this_product.categoryId){
          /*case 1:
            productDetailFile = 'phoneCategory.json';
            data.product_id = this_product.id;
            await writeFile(productDetailFile,JSON.stringify(data));
            break; */
          case 2:
            productDetailFile = 'laptopCategory.json';
            data.product_id = this_product.id;
            await writeFile(productDetailFile,JSON.stringify(data));
            break;
          case 8:
            productDetailFile = 'televisionCategory.json';
            data.product_id = this_product.id;
            await writeFile(productDetailFile,JSON.stringify(data));
            break;
          case 7:
            productDetailFile = 'ipadCategory.json';
            data.product_id = this_product.id;
            await writeFile(productDetailFile,JSON.stringify(data));
            break;
        }
      }else {
        continue;
      }
    }
  });
}

process();
