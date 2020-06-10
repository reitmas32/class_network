import express from "express";

const app = express();

//Settings
app.set("port", process.env.PORT || 3000);


export default app;
