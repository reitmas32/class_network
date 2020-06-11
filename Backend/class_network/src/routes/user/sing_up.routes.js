import { Router } from "express";
const router = Router();

//DataBase
import { connect } from "../../database";
import { ObjectID } from "mongodb";

//Models
import User from "../../models/user";

//Solicitud para crear un nuevo Usuario
router.post("/", async (req, res) => {
  //Nos conectamos a la Base de datos
  const db = await connect();

  //Creamos un nuevo usuario con el modelo definido
  const user = new User(req.body.userName, req.body.password, req.body.email);

  //Buscamos si ya existe un user
  const usersWithThisName = await db
    .collection("users")
    .find({ userName: user.userName })
    .toArray();

  //Si no hay ususarios con ese nombre
  if ((await usersWithThisName).length == 0) {
    //Insertamos al nuevo usuario en la colleccion de ususarios
    const result = await db.collection("users").insertOne(user);

    //Si salio satisfactoriamente la insercion
    if ((await result).ops.length != 0) {

      //Mensaje
      console.log("<- DATA BASE ->: Nuevo Usuario _id: " + result.ops[0]._id);

      //Codigo de 'La solicitud ha tenido éxito y se ha creado un nuevo recurso como resultado de ello.'
      res.json({ code: 201 });
    } else {
      //COdigo de fallo
      res.json({ code: 200 });
    }
  } else {
    //Codigo 'Esta respuesta significa que el servidor no pudo interpretar la solicitud dada una sintaxis inválida.'
    res.json({ code: 400 });
  }
});

//Eliminacion de un usuario
router.delete("/delete", async (req, res) => {
  //Nos conectamos a la Base de datos
  const db = await connect();

  //ID del usuario que se eliminara
  const id = req.body._id;

  //Eliminamos al ususario
  const result = await db
    .collection("users")
    .deleteOne({ _id: ObjectID(id) });

  //Resultado de  la eliminacion
  res.json(result);
});

//TODO:Eliminar este metodo cuando se suba a produccion
//Lista de Usuarios y sus Datos solo es para el desarrollo
router.get("/dev", async (req, res) => {
  //Nos conectamos a la Base de datos
  const db = await connect();

  //Buscamos a los usuarios
  const users = await db.collection("users").find({}).toArray();

  //Resultado de todos los usuarios
  res.json(users);
});

export default router;
