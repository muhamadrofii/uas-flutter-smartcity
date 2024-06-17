const dbPool = require('../config/database');
const jwt = require('jsonwebtoken');
const bcrypt = require('bcryptjs');

const createUser = async (userData) => {
    const { email, password } = userData;
    const SQLQuery = `INSERT INTO users (email, password) VALUES (?, ?)`;
    await dbPool.execute(SQLQuery, [email, password]);
}

const loginUser = async (body) => {
    const { email, password } = body;
    const SQLQuery = `SELECT * FROM users WHERE email = ?`;

    try {
        const [rows] = await dbPool.execute(SQLQuery, [email]);
        if (rows.length === 0) {
            throw new Error('User not found');
        }

        const user = rows[0];
        const passwordMatch = await bcrypt.compare(password, user.password);

        if (!passwordMatch) {
            throw new Error('Invalid password');
        }

        const token = jwt.sign({ email: user.email }, process.env.JWT_SECRET, { expiresIn: '1h' });
        return { token };
    } catch (error) {
        throw new Error(error.message);
    }
}

const createPost = async (postData) => {
    const { nama, alamat, jenis_sampah, berak_kg, email, latitude, longitude } = postData;
    const SQLQuery = `INSERT INTO crudsampah (nama, alamat, jenis_sampah, berak_kg, email, latitude, longitude) VALUES (?, ?, ?, ?, ?, ?, ?)`;
    await dbPool.execute(SQLQuery, [nama, alamat, jenis_sampah, berak_kg, email, latitude, longitude]);
};

const getEduhkasi = async () => {

};

const getEdukasiArticle = async () => {
    const SQLQuery = 'SELECT * FROM edukasi';
    const [rows] = await dbPool.execute(SQLQuery);
    return rows;
};

const getHistoryByEmail = async (email) => {
    const SQLQuery = 'SELECT * FROM crudsampah WHERE email = ?';
    
    try {
        const [rows, fields] = await dbPool.execute(SQLQuery, [email]);
        return rows;
    } catch (error) {
        console.error('Error fetching history by email:', error);
        throw error;
    }
};

module.exports = { createUser, loginUser, createPost, getEdukasiArticle, getHistoryByEmail };