import express from 'express';


const app = express();

app.get('/', (req, res) => {
    res.status(200).json({
        status: 'OK',
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

app.listen(3000, () => {
    console.log('Server running on port 3000');
})