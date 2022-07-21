const db = require('../models/index');
const fs = require('fs');
const StreamArray = require('stream-json/streamers/StreamArray');

(async()=>{
  fs.createReadStream('data.json')
    .pipe(StreamArray.withParser())
    .on("data", async ({key,value}) => {
      //console.log(JSON.stringify({key,value})+"\n");
      db.Categories.findOne({where: {name: value[0]}})
      .then((res)=>{
        if(res === null){
          setTimeout(async()=>{
            await db.Categories.create({name: value[0]});
          },1000);
        }
      })
      .catch(e => console.log(e))
    })
    .on("error", err => {
      console.log(err);
    })
    .on("end", () => {
      console.log("CSV file successfully processed");
    })
})();
