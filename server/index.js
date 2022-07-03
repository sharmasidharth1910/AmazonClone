//IMPORTS FROM PACKAGES
const express = require('express');
const mongoose = require('mongoose');

//IMPORTS FROM OTHER FILES
const authRouter = require('./routes/auth');

//INIT
const PORT = 3000;
const app = express();
const DB = "mongodb+srv://sidharth1910:OQS3Y25rmoAP5c9m@cluster0.bkcsg.mongodb.net/mydb?retryWrites=true&w=majority";

//MIDDLEWARE
app.use(express.json());
app.use(authRouter);

//Connections
mongoose.connect(DB).then(() => {
    console.log('Connection Successfull')
}, ).catch(e => {
    console.log(e);
});

app.listen(PORT, "0.0.0.0", () => {
    console.log(`Connected Successfully at ${PORT}`);
});