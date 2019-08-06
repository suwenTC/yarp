const fetch = require('node-fetch');

const express = require('express')
const app = express()

app.get('/', (req, res) => {
    fetch('https://jsonplaceholder.typicode.com/todos/')
	.then(response => response.json())
	.then(data => {
	    res.send(data)
	}).catch(error => console.error(error))
})

app.listen(3000, () => console.log('Example app listening on port 3000!'))


