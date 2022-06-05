const express = require('express');
const path = require('path');
const session = require('express-session');
const flash = require('connect-flash');

require('custom-env').env('localhost');

/* ROUTES and how to import routes */

const layout = require('./routes/layout');
const projects = require('./routes/projects');
const researchers = require('./routes/researchers');
const organizations = require('./routes/organizations');
const programs = require('./routes/programs');
const executives = require('./routes/executives');
const fields = require('./routes/fields');

/* end of ROUTES and how to import routes */

const app = express();

app.use(express.json());
app.use(express.urlencoded({ extended: true }));

app.use(express.static(path.join(__dirname, 'public')));
app.set('view engine', 'ejs');
app.set('views', 'views');

app.use(flash());

app.use(session({
    secret: "ThisShouldBeSecret",
    resave: false,
    saveUninitialized: false
}));

/* Routes used by the project */

app.use('/', layout);
app.use('/projects', projects);
app.use('/researchers', researchers);
app.use('/organizations', organizations);
app.use('/programs', programs);
app.use('/executives', executives);
app.use('/fields', fields);

/* End of routes used by the project */

// In case of an endpoint does not exist must return 404.html
app.use((req, res, next) => { res.status(404).render('404.ejs', { pageTitle: '404' }) })

module.exports = app;