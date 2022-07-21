const db = require('../models/index');
const this_labels = ["Xiaomi",
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
async function insertLabels(){
  for(let label of this_labels){
    await db.Labels.create({name: label});
  }
}
insertLabels();
