const bcrypt = require('bcryptjs'); 
const jwt = require('jsonwebtoken');
const { createUser, loginUser, createPost, getEdukasiArticle, getHistoryByEmail } = require('../models/userModel');

const registerUser = async (req, res) => {
    const { body } = req;

    if (
        typeof body.email !== 'string' ||
        typeof body.password !== 'string' ||
        !body.email.trim() ||
        !body.password.trim()
    ) {
        return res.status(400).json({
            message: 'Invalid data provided',
            data: null,
        });
    }

    const hashedPassword = await bcrypt.hash(body.password, 10);

    const userData = {
        email: body.email.trim(),
        password: hashedPassword,
    };

   
    try {
        await createUser(userData);

        res.status(201).json({
            message: 'User created successfully',
            data: { email: userData.email },  
        });
    } catch (error) {
        res.status(500).json({
            message: 'Server error while creating user',
            serverMessage: error.message,
        });
    }
};

const authenticateUser = async (req, res) => {
    try {
        const result = await loginUser(req.body);
        res.status(200).json({ message: 'Login successful', token: result.token });
    } catch (error) {
        res.status(400).json({ error: error.message });
    }
}

const savePost = async (req, res) => {
    const { nama, alamat, jenis_sampah,
        
        } = req.body;

    let berak_kg = parseFloat(req.body.berat_kg);
    let longitude = parseFloat(req.body.longitude);
    let latitude = parseFloat(req.body.latitude);

    
    if (
        typeof nama !== 'string' || !nama.trim() ||
        typeof alamat !== 'string' || !alamat.trim() ||
        typeof jenis_sampah !== 'string' || !jenis_sampah.trim() ||
        typeof berak_kg !== 'number' || isNaN(berak_kg) || berak_kg <= 0 ||
        typeof latitude !== 'number' || isNaN(latitude) ||
        typeof longitude !== 'number' || isNaN(longitude)
    ) {
        return res.status(400).json({
            message: 'Invalid data provided',
            data: null,
        });
    }

    
    const email = req.user.email; 

    const postData = {

        nama: nama.trim(),
        alamat: alamat.trim(),
        jenis_sampah: jenis_sampah.trim(),
        berak_kg,
        email,
        latitude,
        longitude,
    };

    try {
        await createPost(postData);

        res.status(201).json({
            message: 'Post created successfully',
            data: postData,
        });
    } catch (error) {
        res.status(500).json({
            message: 'Server Error',
            serverMessage: error.message,
        });
    }
};


const getEdukasi = async (req, res) => {
    try {
        const data = await getEdukasiArticle();

        res.json({
            message: 'GET data sukses',
            data: data
        });
    } catch (error) {
        res.status(500).json({
            message: 'Server Error',
            serverMessage: error.message,
        });
    }
};


const getByEmail = async (req, res) => {
    const email = req.user.email;
    try {
        const history = await getHistoryByEmail(email);
        res.json(history);
    } catch (error) {
        res.status(500).json({ error: 'Internal Server Error' });
    }
}


module.exports = { registerUser, authenticateUser, savePost, getEdukasi, getByEmail};