const IPFS = require('ipfs')

const repo = () => {
  return "ipfs/yjs-demo/" + Math.random();
};

const ipfs = new IPFS({
  repo: repo(),
  EXPERIMENTAL:{
    pubsub: true
  }
})

ipfs.once('ready', ipfs.id((err, info)=>{
  if(err) {throw err}
  console.log('IPFS node ready with address '+info.id)
}))

