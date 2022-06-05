const { pool } = require('../utils/database');

/* Controller to retrieve researchers from database */
exports.getResearchers = (req, res, next) => {

    /* check for messages in order to show them when rendering the page */
    let messages = req.flash("messages");
    if (messages.length == 0) messages = [];

    /* create the connection, execute query, render data */
    pool.getConnection((err, conn) => {
        
        conn.promise().query('SELECT researcher_id, first_name, last_name, sex, DATE_FORMAT(birth_date, "%Y-%m-%d") AS birth_date, DATE_FORMAT(recruitment_date, "%Y-%m-%d") AS recruitment_date, organization_id , DATE_FORMAT(last_update, "%Y-%m-%d") AS last_update FROM researcher')
        .then(([rows, researchers]) => {
            res.render('researchers.ejs', {
                pageTitle: "Researchers Page",
                researchers: rows,
                messages: messages
            })
        })
        .then(() => pool.releaseConnection(conn))
        .catch(err => console.log(err))
    })

}

/* Controller to delete researcher by ID from database */
exports.postDeleteResearcher = (req, res, next) => {
    /* get id from params */
    const id = req.params.id;
    
    /* create the connection, execute query, flash respective message and redirect to researchers route */
    pool.getConnection((err, conn) => {
        var sqlQuery = `DELETE FROM researcher WHERE researcher_id = ${id}`;

        conn.promise().query(sqlQuery)
        .then(() => {
            pool.releaseConnection(conn);
            req.flash('messages', { type: 'success', value: "Successfully deleted researcher!" })
            res.redirect('/researchers');
        })
        .catch(err => {
            req.flash('messages', { type: 'error', value: "Something went wrong, Researcher could not be deleted." })
            res.redirect('/researchers');
        })
    })

}

/* Controller to update an researcher in the database */
exports.postUpdateResearcher = (req, res, next) => {

    /* get necessary data sent */
    const id = req.body.id;
    const first_name = req.body.first_name;
    const last_name = req.body.last_name;
    const sex = req.body.sex;
    const birth_date = req.body.birth_date;
    const recruitment_date = req.body.recruitment_date;
    const org_id = req.body.org_id;

    /* create the connection, execute query, flash respective message and redirect to researchers route */
    pool.getConnection((err, conn) => {
        var sqlQuery = `UPDATE researcher SET first_name = ?, last_name = ?, sex = ?, birth_date = ?, recruitment_date = ?, organization_id = ? WHERE researcher_id = ${id}`;

        conn.promise().query(sqlQuery, [first_name, last_name, sex, birth_date, recruitment_date, org_id])
        .then(() => {
            pool.releaseConnection(conn);
            req.flash('messages', { type: 'success', value: "Successfully updated researcher!" })
            res.redirect('/researchers');
        })
        .catch(err => {
            req.flash('messages', { type: 'error', value: "Something went wrong, Researcher could not be updated." })
            res.redirect('/researchers');
        })
    })
}

/* Controller to render data shown in create researcher page */
exports.getCreateResearcher = (req, res, next) => {
    res.render('create_researcher.ejs', {
        pageTitle: "Researcher Creation Page"
    })
}

/* Controller to create a new researcher in the database */
exports.postResearcher = (req, res, next) => {

    /* get necessary data sent */
    const first_name = req.body.first_name;
    const last_name = req.body.last_name;
    const sex = req.body.sex;
    const birth_date = req.body.birth_date;
    const recruitment_date = req.body.recruitment_date;
    const org_id = req.body.org_id;

    /* create the connection, execute query, flash respective message and redirect to researchers route */
    pool.getConnection((err, conn) => {
        var sqlQuery = `INSERT INTO researcher(first_name, last_name, sex, birth_date, recruitment_date, organization_id) VALUES(?, ?, ?, ?, ?, ?)`;

        conn.promise().query(sqlQuery, [first_name, last_name, sex, birth_date, recruitment_date, org_id])
        .then(() => {
            pool.releaseConnection(conn);
            req.flash('messages', { type: 'success', value: "Successfully added a new Researcher!" })
            res.redirect('/researchers');
        })
        .catch(err => {
            req.flash('messages', { type: 'error', value: "Something went wrong, Researcher could not be added." })
            res.redirect('/researchers');
        })
    })
}

/* Controller to retrieve young researchers from database */
exports.getYoungs = (req, res, next) => {

    /* check for messages in order to show them when rendering the page */
    let messages = req.flash("messages");
    if (messages.length == 0) messages = [];

    /* create the connection, execute query, render data */
    pool.getConnection((err, conn) => {
        
        conn.promise().query('SELECT * FROM young_researchers')
        .then(([rows, youngs]) => {
            res.render('young-researchers.ejs', {
                pageTitle: "Young Researchers",
                youngs: rows,
                messages: messages
            })
        })
        .then(() => pool.releaseConnection(conn))
        .catch(err => console.log(err))
    })

}

/* Controller to retrieve researchers with 5 or more projects without deliverables from database */
exports.getResWithoutDeliverables = (req, res, next) => {

    /* check for messages in order to show them when rendering the page */
    let messages = req.flash("messages");
    if (messages.length == 0) messages = [];

    /* create the connection, execute query, render data */
    pool.getConnection((err, conn) => {
        
        conn.promise().query('SELECT * FROM research_without_deliverables')
        .then(([rows, res_without_deliverables]) => {
            res.render('res-without-deliverables.ejs', {
                pageTitle: "Researchers Without Deliverables",
                res_without_deliverables: rows,
                messages: messages
            })
        })
        .then(() => pool.releaseConnection(conn))
        .catch(err => console.log(err))
    })

}

/* Controller to retrieve projects per researcher view of relational schema from database */
exports.getResearcherProjectsView = (req, res, next) => {

    /* check for messages in order to show them when rendering the page */
    let messages = req.flash("messages");
    if (messages.length == 0) messages = [];

    /* create the connection, execute query, render data */
    pool.getConnection((err, conn) => {
        
        conn.promise().query('SELECT * FROM researcher_project_view')
        .then(([rows, res_projects_view]) => {
            res.render('researcher-projects-view.ejs', {
                pageTitle: "Projects per Researcher View",
                res_projects_view: rows,
                messages: messages
            })
        })
        .then(() => pool.releaseConnection(conn))
        .catch(err => console.log(err))
    })

}

/* Controller to delete works_on relation from database */
exports.postDeleteResearcherProjectsView = (req, res, next) => {
    /* get id from params */
    const project_id = req.query.project_id;
    const researcher_id = req.query.researcher_id;
    
    /* create the connection, execute query, flash respective message and redirect to researchers route */
    pool.getConnection((err, conn) => {
        var sqlQuery = `DELETE FROM works_on WHERE project_id = ${project_id} AND researcher_id = ${researcher_id}`;

        conn.promise().query(sqlQuery)
        .then(() => {
            pool.releaseConnection(conn);
            req.flash('messages', { type: 'success', value: "Successfully deleted relation!" })
            res.redirect('/researchers/researcher-projects-view');
        })
        .catch(err => {
            req.flash('messages', { type: 'error', value: "Something went wrong, Relation could not be deleted." })
            res.redirect('/researchers/researcher-projects-view');
        })
    })

}

/* Controller to render data shown in create works on page */
exports.getCreateWorksOn = (req, res, next) => {
    res.render('create_works_on.ejs', {
        pageTitle: "Works On Creation Page"
    })
}

/* Controller to create a new works on relation in the database */
exports.postWorksOn = (req, res, next) => {

    /* get necessary data sent */
    const project_id = req.body.project_id;
    const researcher_id = req.body.researcher_id;

    /* create the connection, execute query, flash respective message and redirect to projects per researcher view route */
    pool.getConnection((err, conn) => {
        var sqlQuery = `INSERT INTO works_on(project_id, researcher_id) VALUES(?, ?)`;

        conn.promise().query(sqlQuery, [project_id, researcher_id])
        .then(() => {
            pool.releaseConnection(conn);
            req.flash('messages', { type: 'success', value: "Successfully added a new Works On relation!" })
            res.redirect('/researchers/researcher-projects-view');
        })
        .catch(err => {
            req.flash('messages', { type: 'error', value: "Something went wrong, Works On relation could not be added." })
            res.redirect('/researchers/researcher-projects-view');
        })
    })
}