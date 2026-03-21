import express from 'express';

const app = express();

app.get('/', (req, res) => {
    res.status(200).json({
        status: 'success',
    })
})

app.get('/metrics', (req, res) => {
    res.status(200).json({
        status: 'success',
    })
})

app.get('/health', (req, res) => {
    res.status(200).json({
        status: 'OK',
    })
})

export default app;