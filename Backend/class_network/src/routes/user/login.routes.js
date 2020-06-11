import { Router } from "express";
const router = Router();

//DataBase
import { connect } from "../../database";
import { ObjectID } from "mongodb";

//Solicitud para iniciarsecion
router.put("/", async (req, res) => {
  //Nos conectamos a la Base de datos
  const db = await connect();

  //Buscamos los datos del usuarion
  const result = await db
    .collection("users")
    .findOne({ userName: req.body.userName, password: req.body.password });

  //ELiminamos el valor de la contraseña
  result.password = null;

  //Enviamos los datos
  res.json(result);
});

export default router;
