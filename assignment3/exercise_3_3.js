const express = require('express');
const app = express();
const port = 3000;

const factorial = n => {
    let result = 1;

    for (let i = 1; i <= n; i++) {
        result *= i;
    }

    return result;
} 


app.get('/factorial', (req, res) => {
    const { number } = req.query;
    res.redirect(`/factorial/${number}`);
});

app.get('/factorial/:number', (req, res) => {
    const { number } = req.params;
    res.send(`${number}! = ${factorial(number)}`);
});

app.listen(port, () => console.log(`Server listening on port ${port}!`));