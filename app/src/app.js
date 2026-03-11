const express = require('express');


const app = express();

app.get('/', (req, res) => {
    res.status(200).json({
        status: 'OK',
        message: "Node.js App Running"
    })
})

app.get('/health', (req, res) => {
    res.status(200).json({
        status: 'UP',
    })
})

app.get("/ready", (req, res) => {
    res.status(200).json({
        status: 'ready',
    })
})

app.get("/liveness", (req, res) => {
    res.status(200).json({
        status: 'app is running',
    })
})

module.exports = app;