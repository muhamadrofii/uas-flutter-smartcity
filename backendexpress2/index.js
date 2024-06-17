require('dotenv').config();
const express = require('express');


const PORT = process.env.PORT || 3000;
const app = express();

const middlewareLogRequest = require('./middleware/logs');
const upload = require('./middleware/multer');

const userRoutes = require('./routes/userRoutes');

app.use(express.json());

app.use(middlewareLogRequest);
app.use('/assets', express.static('public/images'))

app.use('/users', userRoutes);

app.use((err, req, res, next) => {
    res.json({
        message: err.message
    })
})

app.listen(PORT, () => {
    console.log(`Server berhasil di running di port ${PORT}`);
});

