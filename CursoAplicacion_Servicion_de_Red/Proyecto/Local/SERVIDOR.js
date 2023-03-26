const http = require('http')
const fs = require('fs')
const path = require('path')
const ruta = path.join(__dirname, './archivos.txt')
var express = require('express');
var cors = require('cors');
const { log } = require('console');
const FILE = "log.txt"
var app = express();
app.use(cors());
const bodyParser = require("body-parser");
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());


app.post('/uploadfile', (req, res) => {
    
    const data = (req.body.nombre).split("\\")
    let escribir = 1
    const nombre = data[data.length - 1].replaceAll(" ", "_")
    fs.writeFile(FILE,`${nombre}*Guardar`,(err,num)=>{
        if(err)
        console.error(err)
    })

    let contenido = fs.readFileSync(ruta, 'utf-8', (err, data) => { /**Leer el fichero para saber si hay por lo menos un registro */
        if (err)
            console.log('No se puede leer el fichero');
        return data
    })
    fs.appendFile(ruta, contenido ? `\n${nombre} ${req.body.fecha}` : `${nombre} ${req.body.fecha}`, (err, num) => {
        if (err) {
            console.log(err);
            res.status = 500
            res.send("Algo salio mal")
        } else {
            let contenido = fs.readFileSync(ruta, 'utf-8', (err, data) => {
                if (err)
                    console.log('No se puede leer el fichero');
                res.status = 500
                res.send("Algo salio mal")
                return data
            })
            if (contenido == "") {
                res.status = 202
                res.send('Algo salio mal')
            } else {
                let arra = contenido.split('\n')
                res.status = 200
                res.send(arra)
                console.log("Archivo guardado correctamente")
                console.log('Server listening')

            }
        }
    })
})

app.get('/getdata', (req, res) => {
    let contenido = fs.readFileSync(ruta, 'utf-8', (err, data) => {
        if (err)
            console.log('No se puede leer el fichero');
        return data
    })
    if (contenido == "") {
        res.status = 202
        res.send('0')
    } else {
        let arra = contenido.split('\n')
        res.status = 200
        res.send(arra)
    }

})

app.get('/downloadFile', (req, res) => {
    fs.writeFile(FILE,`${req.query.name}*Recuperar`,(err,num)=>{
        if(err)
        console.error(err)
    })
    res.status =200
    res.send("OK")
})

app.listen(8080, () => {
    console.log('Server listening')
})
