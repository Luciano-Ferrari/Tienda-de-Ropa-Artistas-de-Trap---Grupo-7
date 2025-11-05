const express = require('express');
const path = require('path');

const app = express();
const PORT = 5000;

app.use('/src', express.static(path.join(__dirname, 'src')));
app.use('/Páginas', express.static(path.join(__dirname, 'Páginas')));

app.get('/', (req, res) => {
  res.sendFile(path.join(__dirname, 'Páginas', 'Index.html'));
});

app.get('/producto', (req, res) => {
  res.sendFile(path.join(__dirname, 'Páginas', 'Producto.html'));
});

app.get('/registro', (req, res) => {
  res.sendFile(path.join(__dirname, 'Páginas', 'Registro.html'));
});

app.listen(PORT, '0.0.0.0', () => {
  console.log(`Server running on http://0.0.0.0:${PORT}`);
});
