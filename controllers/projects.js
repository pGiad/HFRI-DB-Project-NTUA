const { pool } = require('../utils/database');

/* Controller to retrieve projects from database */
exports.getProjects = (req, res, next) => {

    /* check for messages in order to show them when rendering the page */
    let messages = req.flash("messages");
    if (messages.length == 0) messages = [];

    /* create the connection, execute query, render data */
    pool.getConnection((err, conn) => {
        
        conn.promise().query('SELECT project_id, title, summary, amount, DATE_FORMAT(entry_date, "%Y-%m-%d") AS entry_date, DATE_FORMAT(due_date, "%Y-%m-%d") AS due_date, duration, active, program_id, executive_id, organization_id, supervisor_id, reviewer_id, review_grade, DATE_FORMAT(review_date, "%Y-%m-%d") AS review_date, DATE_FORMAT(last_update, "%Y-%m-%d") AS last_update FROM project')
        .then(([rows, projects]) => {
            res.render('projects.ejs', {
                pageTitle: "Projects Page",
                projects: rows,
                messages: messages
            })
        })
        .then(() => pool.releaseConnection(conn))
        .catch(err => console.log(err))
    })

}

/* Controller to delete project by ID from database */
exports.postDeleteProject = (req, res, next) => {
    /* get id from params */
    const id = req.params.id;
    
    /* create the connection, execute query, flash respective message and redirect to projects route */
    pool.getConnection((err, conn) => {
        var sqlQuery = `DELETE FROM project WHERE project_id = ${id}`;

        conn.promise().query(sqlQuery)
        .then(() => {
            pool.releaseConnection(conn);
            req.flash('messages', { type: 'success', value: "Successfully deleted project!" })
            res.redirect('/projects');
        })
        .catch(err => {
            req.flash('messages', { type: 'error', value: "Something went wrong, Project could not be deleted." })
            res.redirect('/projects');
        })
    })

}

/* Controller to update a project in the database */
exports.postUpdateProject = (req, res, next) => {

    /* get necessary data sent */
    const id = req.body.id;
    const title = req.body.title;
    const summary = req.body.summary;
    const amount = req.body.amount;
    const entry_date = req.body.entry_date;
    const due_date = req.body.due_date;
    const program_id = req.body.program_id;
    const executive_id = req.body.executive_id;
    const organization_id = req.body.organization_id;
    const supervisor_id = req.body.supervisor_id;
    const reviewer_id = req.body.reviewer_id;
    const grade = req.body.grade;
    const review_date = req.body.review_date;

    /* create the connection, execute query, flash respective message and redirect to projects route */
    pool.getConnection((err, conn) => {
        var sqlQuery = `UPDATE project SET title = ?, summary = ?, amount = ?, entry_date = ?, due_date = ?, program_id = ?, executive_id = ?, organization_id = ?, supervisor_id = ?, reviewer_id = ?, review_grade = ?, review_date = ? WHERE project_id = ${id}`;

        conn.promise().query(sqlQuery, [title, summary, amount, entry_date, due_date, program_id, executive_id, organization_id, supervisor_id, reviewer_id, grade, review_date])
        .then(() => {
            pool.releaseConnection(conn);
            req.flash('messages', { type: 'success', value: "Successfully updated project!" })
            res.redirect('/projects');
        })
        .catch(err => {
            req.flash('messages', { type: 'error', value: "Something went wrong, Project could not be updated." })
            res.redirect('/projects');
        })
    })
}

/* Controller to render data shown in create project page */
exports.getCreateProject = (req, res, next) => {
    res.render('create_project.ejs', {
        pageTitle: "Project Creation Page"
    })
}

/* Controller to create a new project in the database */
exports.postProject = (req, res, next) => {

    /* get necessary data sent */
    const title = req.body.title;
    const summary = req.body.summary;
    const amount = req.body.amount;
    const entry_date = req.body.entry_date;
    const due_date = req.body.due_date;
    const program_id = req.body.program_id;
    const executive_id = req.body.executive_id;
    const org_id = req.body.org_id;
    const supervisor_id = req.body.supervisor_id;
    const reviewer_id = req.body.reviewer_id;
    const grade = req.body.grade;
    const review_date = req.body.review_date;

    /* create the connection, execute query, flash respective message and redirect to projects route */
    pool.getConnection((err, conn) => {
        var sqlQuery = `INSERT INTO project(title, summary, amount, entry_date, due_date, program_id, executive_id, organization_id, supervisor_id, reviewer_id, review_grade, review_date) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)`;

        conn.promise().query(sqlQuery, [title, summary, amount, entry_date, due_date, program_id, executive_id, org_id, supervisor_id, reviewer_id, grade, review_date])
        .then(() => {
            console.log(sqlQuery);
            pool.releaseConnection(conn);
            req.flash('messages', { type: 'success', value: "Successfully added a new Project!" })
            res.redirect('/projects');
        })
        .catch(err => {
            console.log(err);
            req.flash('messages', { type: 'error', value: "Something went wrong, Project could not be added." })
            res.redirect('/projects');
        })
    })
}

/* Controller to retrieve deliverables of project from database */
exports.getDeliverables = (req, res, next) => {

    const id = req.query.id;

    /* check for messages in order to show them when rendering the page */
    let messages = req.flash("messages");
    if (messages.length == 0) messages = [];

    /* create the connection, execute query, render data */
    pool.getConnection((err, conn) => {
        
        conn.promise().query(`SELECT * FROM deliverable WHERE project_id = ${id}`)
        .then(([rows, deliverables]) => {
            res.render('project-deliverables.ejs', {
                pageTitle: "Deliverables",
                deliverables: rows,
                messages: messages
            })
        })
        .then(() => pool.releaseConnection(conn))
        .catch(err => console.log(err))
    })

}

/* Controller to retrieve fields of project from database */
exports.getFields = (req, res, next) => {

    const id = req.query.id;

    /* check for messages in order to show them when rendering the page */
    let messages = req.flash("messages");
    if (messages.length == 0) messages = [];

    /* create the connection, execute query, render data */
    pool.getConnection((err, conn) => {
        
        conn.promise().query(`SELECT * FROM is_about WHERE project_id = ${id}`)
        .then(([rows, fields]) => {
            res.render('project-fields.ejs', {
                pageTitle: "Fields",
                fields: rows,
                messages: messages
            })
        })
        .then(() => pool.releaseConnection(conn))
        .catch(err => console.log(err))
    })

}

/* Controller to delete is_about relation from database */
exports.postDeleteProjectField = (req, res, next) => {
    /* get id from params */
    const id = req.query.id;
    const field = req.query.field;
    
    /* create the connection, execute query, flash respective message and redirect to projects route */
    pool.getConnection((err, conn) => {
        var sqlQuery = `DELETE FROM is_about WHERE project_id = ${id} AND field_name = '${field}'`;

        conn.promise().query(sqlQuery)
        .then(() => {
            pool.releaseConnection(conn);
            req.flash('messages', { type: 'success', value: "Successfully deleted relation!" })
            res.redirect('/projects');
        })
        .catch(err => {
            req.flash('messages', { type: 'error', value: "Something went wrong, Relation could not be deleted." })
            res.redirect('/projects');
        })
    })

}

/* Controller to delete is_about relation from database */
exports.postDeleteDeliverable = (req, res, next) => {
    /* get id from params */
    const project_id = req.query.project_id;
    const deliverable_id = req.query.deliverable_id;
    
    /* create the connection, execute query, flash respective message and redirect to projects route */
    pool.getConnection((err, conn) => {
        var sqlQuery = `DELETE FROM deliverable WHERE project_id = ${project_id} AND deliver_id = ${deliverable_id}`;

        conn.promise().query(sqlQuery)
        .then(() => {
            pool.releaseConnection(conn);
            req.flash('messages', { type: 'success', value: "Successfully deleted deliverable!" })
            res.redirect('/projects');
        })
        .catch(err => {
            req.flash('messages', { type: 'error', value: "Something went wrong, Deliverable could not be deleted." })
            res.redirect('/projects');
        })
    })

}

/* Controller to render data shown in create search by date page */
exports.getSearchByDate = (req, res, next) => {
    res.render('create_search_by_date.ejs', {
        pageTitle: "Insert Desired Date"
    })
}

/* QUERY 3.1: Controller to retrieve projects, researhcers for particular date from database */
exports.postProjectsResearchersDate = (req, res, next) => {

    const date = req.body.date;

    /* check for messages in order to show them when rendering the page */
    let messages = req.flash("messages");
    if (messages.length == 0) messages = [];

    /* create the connection, execute query, render data */
    pool.getConnection((err, conn) => {
        
        conn.promise().query(`SELECT project.project_id, project.title, researcher.researcher_id, researcher.first_name, researcher.last_name 
                              FROM researcher 
                              INNER JOIN works_on ON researcher.researcher_id = works_on.researcher_id 
                              INNER JOIN project ON project.project_id = works_on.project_id 
                              WHERE project.entry_date <= '${date}' AND project.due_date >= '${date}'`)
        .then(([rows, projects_researchers]) => {
            res.render('date-projects-researchers.ejs', {
                pageTitle: "Projects and Researchers for Particular Date",
                projects_researchers: rows,
                messages: messages
            })
        })
        .then(() => pool.releaseConnection(conn))
        .catch(err => console.log(err))
    })

}

/* Controller to render data shown in create search by duration page */
exports.getSearchByDuration = (req, res, next) => {
    res.render('create_search_by_duration.ejs', {
        pageTitle: "Insert Desired Duration"
    })
}

/* QUERY 3.1: Controller to retrieve projects, researhcers for particular duration from database */
exports.postProjectsResearchersDuration = (req, res, next) => {

    const duration = req.body.duration;

    /* check for messages in order to show them when rendering the page */
    let messages = req.flash("messages");
    if (messages.length == 0) messages = [];

    /* create the connection, execute query, render data */
    pool.getConnection((err, conn) => {
        
        conn.promise().query(`SELECT project.project_id, project.title, researcher.researcher_id, researcher.first_name, researcher.last_name 
                              FROM researcher 
                              INNER JOIN works_on ON researcher.researcher_id = works_on.researcher_id 
                              INNER JOIN project ON project.project_id = works_on.project_id 
                              WHERE project.duration = ${duration};`)
        .then(([rows, projects_researchers]) => {
            res.render('duration-projects-researchers.ejs', {
                pageTitle: "Projects and Researchers for Particular Duration",
                projects_researchers: rows,
                messages: messages
            })
        })
        .then(() => pool.releaseConnection(conn))
        .catch(err => console.log(err))
    })

}

/* Controller to render data shown in create deliverable page */
exports.getCreateDeliverable = (req, res, next) => {
    res.render('create_deliverable.ejs', {
        pageTitle: "Deliverable Creation Page"
    })
}

/* Controller to create a new deliverable in the database */
exports.postDeliverable = (req, res, next) => {

    /* get necessary data sent */
    const id = req.body.id;
    const title = req.body.title;
    const summary = req.body.summary;
    const deliver_date = req.body.deliver_date;

    /* create the connection, execute query, flash respective message and redirect to projects route */
    pool.getConnection((err, conn) => {
        var sqlQuery = `INSERT INTO deliverable(project_id, title, summary, deliver_date) VALUES(?, ?, ?, ?)`;

        conn.promise().query(sqlQuery, [id, title, summary, deliver_date])
        .then(() => {
            pool.releaseConnection(conn);
            req.flash('messages', { type: 'success', value: "Successfully added a new Deliverable!" })
            res.redirect('/projects');
        })
        .catch(err => {
            req.flash('messages', { type: 'error', value: "Something went wrong, Deliverable could not be added." })
            res.redirect('/projects');
        })
    })
}

/* Controller to render data shown in create is about relation page */
exports.getCreateIsAbout = (req, res, next) => {
    res.render('create_is_about.ejs', {
        pageTitle: "Is About relation Creation Page"
    })
}

/* Controller to create a new is about relation in the database */
exports.postIsAbout = (req, res, next) => {

    /* get necessary data sent */
    const id = req.body.id;
    const field = req.body.field;

    /* create the connection, execute query, flash respective message and redirect to projects route */
    pool.getConnection((err, conn) => {
        var sqlQuery = `INSERT INTO is_about(project_id, field_name) VALUES(?, ?)`;

        conn.promise().query(sqlQuery, [id, field])
        .then(() => {
            pool.releaseConnection(conn);
            req.flash('messages', { type: 'success', value: "Successfully added a new Is About relation!" })
            res.redirect('/projects');
        })
        .catch(err => {
            req.flash('messages', { type: 'error', value: "Something went wrong, Is About relation could not be added." })
            res.redirect('/projects');
        })
    })
}
