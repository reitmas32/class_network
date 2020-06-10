import app from './server';

async function main(){
    await app.listen(app.get('port'));
    console.log("Hola Node y MOngoDB es mi API");
}

main();