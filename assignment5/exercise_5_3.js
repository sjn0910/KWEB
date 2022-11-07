const express = require('express');
const { runQuery } = require('./database');

const app = express();
const port = 3000;

app.get('/fare', async (req, res, next) => {
    try {
        const { uid } = req.query;
        const sql = 'SELECT Sum(Round(types.fare_rate * trains.distance * 0.001, -2)) AS fare ' +
                'FROM tickets INNER JOIN users ON tickets.user = users.id AND users.id = ? ' +
                'INNER JOIN trains ON tickets.train = trains.id ' +
                'INNER JOIN types ON trains.type = types.id';
        const { fare } = (await runQuery(sql, [uid]))[0];
        return res.send(`${fare} KRW.`);
    } catch(err) {
        console.error(err)
        return res.sendStatus(500);
    }
});

app.get('/train/status', async (req, res, next)=> {
    try {
        const { tid } = req.query;
        const sql = 'SELECT Count(*) AS reserved, types.max_seats AS maximum ' +
                'FROM tickets INNER JOIN trains ON tickets.train = trains.id AND trains.id = ? ' +
                'INNER JOIN types ON trains.type = types.id';
        const { reserved, maximum } = (await runQuery(sql, [tid]))[0];

        if (reserved < maximum) {
            return res.send(`Train is not sold out`);
        } 
        else {
            return res.send(`Train is sold out`);
        }
        
    } catch(err) {
        console.error(err)
        return res.sendStatus(500);
    }
});

app.listen(port, () => console.log(`Server listening on port ${port}!`));