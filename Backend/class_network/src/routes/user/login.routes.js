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

  //si el user id no es null
  if (result._id != null) {

    //Indica las sesion
    const sesion = true;

    //Mensaje de la base de datos
    console.log("<- DATA BASE -> Inicio de sesion: " + result._id);

    //actualizamos la sesion habierta
    const resultSesion = await db.collection("sesions").updateOne(
      {
        _userID: ObjectID(result._id),
      },
      { $set: { sesion } }
    );
  }

  //Enviamos los datos del ususario
  res.json(result);
});

//TODO:Eliminar en produccion
//Retorna la lista de usuarios que iniciaron sesion
router.get("/dev", async (req, res) => {
  //Nos conectamos a la Base de datos
  const db = await connect();

  //Buscamos a los usuarios
  const sesions = await db.collection("sesions").find({}).toArray();

  //Resultado de todos los usuarios
  res.json(sesions);
});

export default router;
