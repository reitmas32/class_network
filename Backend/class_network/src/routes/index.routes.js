import { Router } from "express";
const router = Router();

router.get('/', (req, res) => {
    console.log("Se conecto alguien " + req.ip);
    res.send("Coneccion exitosa a la Servidor");
});

export default router;
