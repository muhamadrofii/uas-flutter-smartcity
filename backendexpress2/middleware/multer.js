const multer = require ('multer');
const path = require('path');
// const { createPost } = require('../models/userModel');

const storage = multer.diskStorage({
    destination: (req, file, cb) => {
        cb(null, 'public/images');
    },
    filename: (req, file, cb) => {
        const timestamp = new Date().getTime();
        const originalname = file.originalname;
        const email = req.user.email;

        cb(null, `${timestamp}-${email}-${originalname}`);
    }
});

const upload = multer ({
    storage: storage,
    limits: {
        fileSize: 3 * 1000 * 1000
    }
});

module.exports = upload;