const fetch = require('node-fetch');

const express = require('express')
const app = express()

app.get('/', (req, res) => {
    res.writeHead(200, { "Content-Type": "text/html" });
    res.end('<embed width="100%" height="100%" src="https://www.youtube.com/v/ADfIlLfs5Bk?autoplay=1">')
})

app.listen(3000, () => console.log('Example app listening on port 3000!'))


