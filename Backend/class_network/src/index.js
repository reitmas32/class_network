import app from './server';

async function main(){
    await app.listen(app.get('port'));
    console.log("<- SERVER ->  Iniciando el Servidor en el puerto: " + app.get('port'));
}

main();