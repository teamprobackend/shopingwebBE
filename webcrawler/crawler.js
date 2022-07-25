const puppeteer = require('puppeteer');
const fs = require('fs');
const url = "https://cellphones.com.vn/";
//const db = require('../model/index.js');

(async ()=>{
  const browser = await puppeteer.launch();
  const page = await browser.newPage();

  await page.goto(url);
  let unlabeled = [];
  const data = await page.evaluate(async (unlabeled,productDetail)=>{
    function sleep(ms) {
      return new Promise((resolve) => {
        setTimeout(resolve, ms);
      });
    }
    const labels = [
    "Xiaomi",
    "Samsung",
    "Apple",
    "Asus",
    "HP",
    "Lenovo",
    "Dell",
    "Sony",
    "LG",
    "VSmart",
    "Huawei",
    "Oppo",
    "MSI",
    "Nubia",
    "Acer",
    "Surface",
    "JBL",
    "Myalo",
    "Coocaa",
    "CPS"
    ];
    let setLabel = function(productName){
      let name_array = productName.toLowerCase().split(" ");
      let this_labels = labels.map(label => label.toLowerCase());
      for(let name of name_array){
        if(name === 'iphone' || name === 'ipad') return this_labels.indexOf("apple")+1;
        if(name === 'dreame' || name == "mi") return this_labels.indexOf("xiaomi")+1;
        if(this_labels.includes(name)) return this_labels.indexOf(name)+1;
      }
      unlabeled.push(productName);
      return 0;
    };
    let block_featured_products = document.querySelectorAll('.block-featured-product');
    let products_data = {};
    //let productDetail = {};
    let products_data_list = [];
    let products_data_list_element;
    let i = 0;
    for(let block_featured_product of block_featured_products){
      let category = block_featured_product.querySelector('.title h2').innerText;
      let product_links = block_featured_product.querySelectorAll('.product__link');
      let product_data = {};
      for(let product_link_index=0;product_link_index<product_links.length;product_link_index++){
        let product_discription = '';
        let product_link = product_links[product_link_index];
        let this_product_href = product_link.href;
        if(product_link.querySelector('.gift-cont')) product_discription = product_link.querySelector('.gift-cont').innerText;
        if(product_link.querySelector('.coupon-price')) product_discription = product_link.querySelector('.coupon-price').innerText;
        i += 1;
        await sleep(3000)
        let dataobj = {
          'image':{
            'src': product_link.querySelector('.product__img').getAttributes("src"),
            'alt': product_link.querySelector('.product__img').getAttributes("alt")
          },
          'productName': product_link.querySelector('.product__name h3').innerText,
          'price': product_link.querySelector('.box-info__box-price p').innerText,
          'discription': product_discription,
          'STT': i,
          'quantity': 10,
          'label': setLabel(product_link.querySelector('.product__name h3').innerText),
          'productDetail': [i,this_product_href]
        };
        product_data[product_link_index+1] = dataobj;
        products_data[category] = product_data;
        products_data_list_element = [category,product_data]
      }
      products_data_list.push(products_data_list_element);
    }
    return [products_data_list,unlabeled,productDetail];
  },unlabeled);
  console.log(JSON.stringify(data[0]));
  /*
  let productDetailList = [];
  for(let category of data[0]){
    Object.keys(category[1]).forEach(product => {
      productDetailList.push(category[1][product]['productDetail']);
      //console.log(category[1][product]['productDetail']);
    })
  }
  console.log(productDetailList);
  fs.writeFile('productDetail.json',JSON.stringify(productDetailList),(err)=>{
    console.log(err);
  })
  /*
  fs.writeFile('data.json',JSON.stringify(data[0]),(err)=>{
    if(err) console.log(err);
  });

  fs.writeFile('unlabeled.json',JSON.stringify(data[1]),(err)=>{
    if(err) console.log(err);
  })*/

  /*
  fs.readFile('data.json',async (err,data)=>{
    if(err) console.log(err);
    //console.log(JSON.parse(data));
    let thisData = JSON.parse(data);
    let browser = await puppeteer.launch();
    Object.keys(thisData).forEach(category => {
      //console.log(typeof(thisData[category]));
      let i = 0;
      Object.keys(thisData[category]).forEach(async(key) => {
        //console.log(thisData[category][key]);
        try{
          let productDetail = thisData[category][key].href;
          //console.log(productDetail);
          let page = await browser.newPage();
          await page.goto(productDetail);
          await page.evaluate(()=>{
            /*
            const product_technical_info = document.querySelector('#tskt').firstChild.children;
            for(let tr of product_technical_info){
              if(thisData[category][key]['productDetail'] === undefined) thisData[category][key]['productDetail'] = {};
              thisData[category][key]['productDetail'][tr.firstChild.innerText] = tr.lastChild.innerText;
              console.log(thisData[category][key]['productDetail'][tr.firstChild.innerText]);
            }
            console.log(i);
            i++;
          })
        }catch(err){
          console.log(err);
        }
      })
        /*
      })
    })
    //console.log(thisData);
  })*/
})()
