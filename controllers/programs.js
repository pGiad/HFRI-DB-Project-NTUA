const { pool } = require('../utils/database');

/* Controller to retrieve programs from database */
exports.getPrograms = (req, res, next) => {

    /* check for messages in order to show them when rendering the page */
    let messages = req.flash("messages");
    if (messages.length == 0) messages = [];

    /* create the connection, execute query, render data */
    pool.getConnection((err, conn) => {
        
        conn.promise().query('SELECT program_id, program_name, hfri_address, DATE_FORMAT(last_update, "%Y-%m-%d") AS last_update FROM program')
        .then(([rows, fields]) => {
            res.render('programs.ejs', {
                pageTitle: "Programs Page",
                programs: rows,
                messages: messages
            })
        })
        .then(() => pool.releaseConnection(conn))
        .catch(err => console.log(err))
    })

}

/* Controller to delete program by ID from database */
exports.postDeleteProgram = (req, res, next) => {
    /* get id from params */
    const id = req.params.id;
    
    /* create the connection, execute query, flash respective message and redirect to programs route */
    pool.getConnection((err, conn) => {
        var sqlQuery = `DELETE FROM program WHERE program_id = ${id}`;

        conn.promise().query(sqlQuery)
        .then(() => {
            pool.releaseConnection(conn);
            req.flash('messages', { type: 'success', value: "Successfully deleted program!" })
            res.redirect('/programs');
        })
        .catch(err => {
            req.flash('messages', { type: 'error', value: "Something went wrong, Program could not be deleted." })
            res.redirect('/programs');
        })
    })

}

/* Controller to update a program in the database */
exports.postUpdateProgram = (req, res, next) => {

    /* get necessary data sent */
    const id = req.body.id;
    const name = req.body.name;
    const address = req.body.address;

    /* create the connection, execute query, flash respective message and redirect to programs route */
    pool.getConnection((err, conn) => {
        var sqlQuery = `UPDATE program SET program_name = ?, hfri_address = ? WHERE program_id = ${id}`;

        conn.promise().query(sqlQuery, [name, address])
        .then(() => {
            console.log(sqlQuery);
            pool.releaseConnection(conn);
            req.flash('messages', { type: 'success', value: "Successfully updated program!" })
            res.redirect('/programs');
        })
        .catch(err => {
            console.log(err);
            req.flash('messages', { type: 'error', value: "Something went wrong, Program could not be updated." })
            res.redirect('/programs');
        })
    })
}

/* Controller to render data shown in create program page */
exports.getCreateProgram = (req, res, next) => {
    res.render('create_program.ejs', {
        pageTitle: "Program Creation Page"
    })
}

/* Controller to create a new program in the database */
exports.postProgram = (req, res, next) => {

    /* get necessary data sent */
    const name = req.body.name;
    const address = req.body.address;

    /* create the connection, execute query, flash respective message and redirect to programs route */
    pool.getConnection((err, conn) => {
        var sqlQuery = `INSERT INTO program(program_name, hfri_address) VALUES(?, ?)`;

        conn.promise().query(sqlQuery, [name, address])
        .then(() => {
            pool.releaseConnection(conn);
            req.flash('messages', { type: 'success', value: "Successfully added a new Program!" })
            res.redirect('/programs');
        })
        .catch(err => {
            req.flash('messages', { type: 'error', value: "Something went wrong, Program could not be added." })
            res.redirect('/programs');
        })
    })
}