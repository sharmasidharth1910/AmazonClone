const express = require('express');
const User = require('../models/user');
const bcryptjs = require('bcryptjs');

const authRouter = express.Router();

// authRouter.get('/user', (req, res) => {
//     res.json({
//         msg: "Successfull"
//     });
// });

//SIGN UP ROUTE
authRouter.post('/api/signup', async (req, res) => {

    try {
        //Get the data from the client
        console.log(req.body);
        const {
            name,
            email,
            password
        } = req.body;

        const existingUser = await User.findOne({
            email
        });

        if (existingUser) {
            return res.status(400).json({
                msg: "User with same email already exists."
            });
        }

        const hashedPassword = await bcryptjs.hash(password, 8);

        let user = new User({
            email,
            password: hashedPassword,
            name,
        });

        //Post the data to the user
        user = await user.save();
        //Return that data to the user
        res.json(user);

    } catch (e) {
        res.status(500).json({
            error: e.message
        });
    }
});

module.exports = authRouter;