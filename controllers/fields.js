const { pool } = require('../utils/database');

/* Controller to retrieve fields from database */
exports.getFields = (req, res, next) => {

    /* check for messages in order to show them when rendering the page */
    let messages = req.flash("messages");
    if (messages.length == 0) messages = [];

    /* create the connection, execute query, render data */
    pool.getConnection((err, conn) => {
        
        conn.promise().query('SELECT field_name, DATE_FORMAT(last_update, "%Y-%m-%d") AS last_update FROM field')
        .then(([rows, fields]) => {
            res.render('fields.ejs', {
                pageTitle: "Fields Page",
                fields: rows,
                messages: messages
            })
        })
        .then(() => pool.releaseConnection(conn))
        .catch(err => console.log(err))
    })

}

/* Controller to delete field by Field Name from database */
exports.postDeleteField = (req, res, next) => {
    /* get field_name from params */
    const field_name = req.params.field_name;
    
    /* create the connection, execute query, flash respective message and redirect to fields route */
    pool.getConnection((err, conn) => {
        var sqlQuery = `DELETE FROM field WHERE field_name = '${field_name}'`;

        conn.promise().query(sqlQuery)
        .then(() => {
            pool.releaseConnection(conn);
            req.flash('messages', { type: 'success', value: "Successfully deleted field!" })
            res.redirect('/fields');
        })
        .catch(err => {
            req.flash('messages', { type: 'error', value: "Something went wrong, Field could not be deleted." })
            res.redirect('/fields');
        })
    })

}

/* Controller to update a field in the database */
exports.postUpdateField = (req, res, next) => {

    /* get necessary data sent */
    const field_name = req.body.field_name;
    const field_name_new = req.body.field_name_new;

    /* create the connection, execute query, flash respective message and redirect to fields route */
    pool.getConnection((err, conn) => {
        var sqlQuery = `UPDATE field SET field_name = ? WHERE field_name = '${field_name}'`;

        conn.promise().query(sqlQuery, [field_name_new])
        .then(() => {
            console.log(sqlQuery);
            pool.releaseConnection(conn);
            req.flash('messages', { type: 'success', value: "Successfully updated field!" })
            res.redirect('/fields');
        })
        .catch(err => {
            console.log(err);
            req.flash('messages', { type: 'error', value: "Something went wrong, Field could not be updated." })
            res.redirect('/fields');
        })
    })
}

/* Controller to render data shown in create field page */
exports.getCreateField = (req, res, next) => {
    res.render('create_field.ejs', {
        pageTitle: "Field Creation Page"
    })
}

/* Controller to create a new field in the database */
exports.postField = (req, res, next) => {

    /* get necessary data sent */
    const field_name = req.body.field_name;

    /* create the connection, execute query, flash respective message and redirect to fields route */
    pool.getConnection((err, conn) => {
        var sqlQuery = `INSERT INTO field(field_name) VALUES(?)`;

        conn.promise().query(sqlQuery, [field_name])
        .then(() => {
            pool.releaseConnection(conn);
            req.flash('messages', { type: 'success', value: "Successfully added a new Field!" })
            res.redirect('/fields');
        })
        .catch(err => {
            req.flash('messages', { type: 'error', value: "Something went wrong, Field could not be added." })
            res.redirect('/fields');
        })
    })
}

/* Controller to retrieve top3 tuples of fields from database */
exports.getTop3 = (req, res, next) => {

    /* check for messages in order to show them when rendering the page */
    let messages = req.flash("messages");
    if (messages.length == 0) messages = [];

    /* create the connection, execute query, render data */
    pool.getConnection((err, conn) => {
        
        conn.promise().query('SELECT * FROM top_3_tuples_of_fields')
        .then(([rows, top3_fields]) => {
            res.render('top3-fields.ejs', {
                pageTitle: "Top 3 Tuples of Fields",
                top3_fields: rows,
                messages: messages
            })
        })
        .then(() => pool.releaseConnection(conn))
        .catch(err => console.log(err))
    })

}

/* QUERY 3.3: Controller to retrieve projects, researhcers for particular field from database */
exports.getProjectsResearchers = (req, res, next) => {

    const field = req.query.field;

    /* check for messages in order to show them when rendering the page */
    let messages = req.flash("messages");
    if (messages.length == 0) messages = [];

    /* create the connection, execute query, render data */
    pool.getConnection((err, conn) => {
        
        conn.promise().query(`SELECT project.project_id, project.title, researcher.researcher_id, researcher.first_name, researcher.last_name, project.active 
                              FROM project 
                              INNER JOIN is_about ON is_about.project_id = project.project_id 
                              INNER JOIN field ON field.field_name = is_about.field_name 
                              INNER JOIN works_on ON project.project_id = works_on.project_id 
                              INNER JOIN researcher ON researcher.researcher_id = works_on.researcher_id 
                              WHERE (field.field_name = '${field}' AND project.active = 1)`)
        .then(([rows, projects_researchers]) => {
            res.render('field-projects-researchers.ejs', {
                pageTitle: "Projects and Researchers for Particular Field",
                projects_researchers: rows,
                messages: messages
            })
        })
        .then(() => pool.releaseConnection(conn))
        .catch(err => console.log(err))
    })

}
