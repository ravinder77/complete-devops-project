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

app.listen(3000, () => {
    console.log('Server running on port 3000');
})