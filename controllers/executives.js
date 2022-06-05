const { pool } = require('../utils/database');

/* Controller to retrieve executives from database */
exports.getExecutives = (req, res, next) => {

    /* check for messages in order to show them when rendering the page */
    let messages = req.flash("messages");
    if (messages.length == 0) messages = [];

    /* create the connection, execute query, render data */
    pool.getConnection((err, conn) => {
        
        conn.promise().query('SELECT executive_id, first_name, last_name, DATE_FORMAT(last_update, "%Y-%m-%d") AS last_update FROM executive')
        .then(([rows, executives]) => {
            res.render('executives.ejs', {
                pageTitle: "Executives Page",
                executives: rows,
                messages: messages
            })
        })
        .then(() => pool.releaseConnection(conn))
        .catch(err => console.log(err))
    })

}

/* Controller to delete executive by ID from database */
exports.postDeleteExecutive = (req, res, next) => {
    /* get id from params */
    const id = req.params.id;
    
    /* create the connection, execute query, flash respective message and redirect to executives route */
    pool.getConnection((err, conn) => {
        var sqlQuery = `DELETE FROM executive WHERE executive_id = ${id}`;

        conn.promise().query(sqlQuery)
        .then(() => {
            pool.releaseConnection(conn);
            req.flash('messages', { type: 'success', value: "Successfully deleted executive!" })
            res.redirect('/executives');
        })
        .catch(err => {
            req.flash('messages', { type: 'error', value: "Something went wrong, Executive could not be deleted." })
            res.redirect('/executives');
        })
    })

}

/* Controller to update a executive in the database */
exports.postUpdateExecutive = (req, res, next) => {

    /* get necessary data sent */
    const id = req.body.id;
    const first_name = req.body.first_name;
    const last_name = req.body.last_name;

    /* create the connection, execute query, flash respective message and redirect to executives route */
    pool.getConnection((err, conn) => {
        var sqlQuery = `UPDATE executive SET first_name = ?, last_name = ? WHERE executive_id = ${id}`;

        conn.promise().query(sqlQuery, [first_name, last_name])
        .then(() => {
            console.log(sqlQuery);
            pool.releaseConnection(conn);
            req.flash('messages', { type: 'success', value: "Successfully updated executive!" })
            res.redirect('/executives');
        })
        .catch(err => {
            console.log(err);
            req.flash('messages', { type: 'error', value: "Something went wrong, Executive could not be updated." })
            res.redirect('/executives');
        })
    })
}

/* Controller to render data shown in create executive page */
exports.getCreateExecutive = (req, res, next) => {
    res.render('create_executive.ejs', {
        pageTitle: "Executive Creation Page"
    })
}

/* Controller to create a new executive in the database */
exports.postExecutive = (req, res, next) => {

    /* get necessary data sent */
    const first_name = req.body.first_name;
    const last_name = req.body.last_name;

    /* create the connection, execute query, flash respective message and redirect to executives route */
    pool.getConnection((err, conn) => {
        var sqlQuery = `INSERT INTO executive(first_name, last_name) VALUES(?, ?)`;

        conn.promise().query(sqlQuery, [first_name, last_name])
        .then(() => {
            pool.releaseConnection(conn);
            req.flash('messages', { type: 'success', value: "Successfully added a new Executive!" })
            res.redirect('/executives');
        })
        .catch(err => {
            req.flash('messages', { type: 'error', value: "Something went wrong, Executive could not be added." })
            res.redirect('/executives');
        })
    })
}


/* Controller to retrieve top 5 executives from database */
exports.getTop5 = (req, res, next) => {

    /* check for messages in order to show them when rendering the page */
    let messages = req.flash("messages");
    if (messages.length == 0) messages = [];

    /* create the connection, execute query, render data */
    pool.getConnection((err, conn) => {
        
        conn.promise().query('SELECT * FROM top_5_executives')
        .then(([rows, top5_executives]) => {
            res.render('top5-executives.ejs', {
                pageTitle: "Top 5 Executives",
                top5_executives: rows,
                messages: messages
            })
        })
        .then(() => pool.releaseConnection(conn))
        .catch(err => console.log(err))
    })

}

/* QUERY 3.3: Controller to retrieve projects, researhcers for particular executive from database */
exports.getProjectsResearchers = (req, res, next) => {

    const id = req.query.id;

    /* check for messages in order to show them when rendering the page */
    let messages = req.flash("messages");
    if (messages.length == 0) messages = [];

    /* create the connection, execute query, render data */
    pool.getConnection((err, conn) => {
        
        conn.promise().query(`SELECT project.project_id, project.title, researcher.researcher_id, researcher.first_name, researcher.last_name 
                              FROM researcher 
                              INNER JOIN works_on ON researcher.researcher_id = works_on.researcher_id 
                              INNER JOIN project ON project.project_id = works_on.project_id 
                              INNER JOIN executive ON executive.executive_id = project.executive_id 
                              WHERE executive.executive_id = ${id}`)
        .then(([rows, projects_researchers]) => {
            res.render('executive-projects-researchers.ejs', {
                pageTitle: "Projects and Researchers for Particular Executive",
                projects_researchers: rows,
                messages: messages
            })
        })
        .then(() => pool.releaseConnection(conn))
        .catch(err => console.log(err))
    })

}