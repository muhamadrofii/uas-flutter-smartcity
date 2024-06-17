const express = require('express');
const router = express.Router();
const { registerUser, authenticateUser, savePost, getEdukasi, getByEmail } = require('../controller/userControl');
const authenticateJWT = require('../middleware/authMiddleware');
const upload = require('../middleware/multer');

router.post('/register', registerUser);
router.post('/login', authenticateUser);
router.get('/edukasi', authenticateJWT, getEdukasi);
router.get('/history', authenticateJWT, getByEmail)

router.post('/posting', authenticateJWT, savePost);
router.post('/upload', authenticateJWT, upload.single('photo'), (req, res) => {
    res.json({
        message: 'Upload Berhasil'
    });
});



module.exports = router;
