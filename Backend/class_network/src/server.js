import express from "express";

const app = express();

import Sing_up from './routes/user/sing_up.routes';
import Login from './routes/user/login.routes';

//Settings
app.set("port", process.env.PORT || 3000);

// Meddleweres
app.use(express.json());

//Routes
app.use('/api/user/singup', Sing_up);
app.use('/api/user/login', Login);

export default app;
