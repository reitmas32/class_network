import mongoClient from "mongodb";

export async function connect() {
  try {
    const client = await mongoClient.connect("mongodb://localhost:27017", {
        useNewUrlParser: true,
        useUnifiedTopology: true
    });
    const db = client.db("class-network");
    console.log("<- DATA_BASE -> Coneccion exitosa a la base de datos")
    return db;
  } catch (error) {
      console.log(error);
  }
}