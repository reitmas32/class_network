import express from "express";

const app = express();

//TODO:Eliminar suando este en produccion
import Index from './routes/index.routes';

import Sing_up from './routes/user/sing_up.routes';
import Login from './routes/user/login.routes';

//Settings
app.set("port", process.env.PORT || 3000);

// Meddleweres
app.use(express.json());

//Routes
//TODO:Eliminar suando este en produccion
app.use('/index', Index);

app.use('/api/user/singup', Sing_up);
app.use('/api/user/login', Login);

export default app;
