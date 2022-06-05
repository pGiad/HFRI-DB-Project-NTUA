const { pool } = require('../utils/database');

/* Controller to retrieve organizations from database */
exports.getOrganizations = (req, res, next) => {

    /* check for messages in order to show them when rendering the page */
    let messages = req.flash("messages");
    if (messages.length == 0) messages = [];

    /* create the connection, execute query, render data */
    pool.getConnection((err, conn) => {
        
        conn.promise().query('SELECT organization_id, abbreviation, name, street_name, street_number, zip_code, city, organization_type, DATE_FORMAT(last_update, "%Y-%m-%d") AS last_update FROM organization')
        .then(([rows, fields]) => {
            res.render('organizations.ejs', {
                pageTitle: "Organizations Page",
                organizations: rows,
                messages: messages
            })
        })
        .then(() => pool.releaseConnection(conn))
        .catch(err => console.log(err))
    })

}

/* Controller to delete organization by ID from database */
exports.postDeleteOrganization = (req, res, next) => {
    /* get id from params */
    const id = req.params.id;
    
    /* create the connection, execute query, flash respective message and redirect to organizations route */
    pool.getConnection((err, conn) => {
        var sqlQuery = `DELETE FROM organization WHERE organization_id = ${id}`;

        conn.promise().query(sqlQuery)
        .then(() => {
            pool.releaseConnection(conn);
            req.flash('messages', { type: 'success', value: "Successfully deleted organization!" })
            res.redirect('/organizations');
        })
        .catch(err => {
            req.flash('messages', { type: 'error', value: "Something went wrong, Organization could not be deleted." })
            res.redirect('/organizations');
        })
    })

}

/* Controller to update an organization in the database */
exports.postUpdateOrganization = (req, res, next) => {

    /* get necessary data sent */
    const id = req.body.id;
    const abbreviation = req.body.abbreviation;
    const name = req.body.name;
    const str_name = req.body.str_name;
    const str_num = req.body.str_num;
    const zip = req.body.zip;
    const city = req.body.city;
    const type = req.body.type;

    /* create the connection, execute query, flash respective message and redirect to organizations route */
    pool.getConnection((err, conn) => {
        var sqlQuery = `UPDATE organization SET abbreviation = ?, name = ?, street_name = ?, street_number = ?, zip_code = ?, city = ?, organization_type = ? WHERE organization_id = ${id}`;

        conn.promise().query(sqlQuery, [abbreviation, name, str_name, str_num, zip, city, type])
        .then(() => {
            pool.releaseConnection(conn);
            req.flash('messages', { type: 'success', value: "Successfully updated organization!" })
            res.redirect('/organizations');
        })
        .catch(err => {
            req.flash('messages', { type: 'error', value: "Something went wrong, Organization could not be updated." })
            res.redirect('/organizations');
        })
    })
}

/* Controller to render data shown in create organization page */
exports.getCreateOrganization = (req, res, next) => {
    res.render('create_organization.ejs', {
        pageTitle: "Organization Creation Page"
    })
}

/* Controller to create a new organization in the database */
exports.postOrganization = (req, res, next) => {

    /* get necessary data sent */
    const abbreviation = req.body.abbreviation;
    const name = req.body.name;
    const str_name = req.body.str_name;
    const str_num = req.body.str_num;
    const zip = req.body.zip;
    const city = req.body.city;
    const type = req.body.type;

    /* create the connection, execute query, flash respective message and redirect to organizations route */
    pool.getConnection((err, conn) => {
        var sqlQuery = `INSERT INTO organization(abbreviation, name, street_name, street_number, zip_code, city, organization_type) VALUES(?, ?, ?, ?, ?, ?, ?)`;

        conn.promise().query(sqlQuery, [abbreviation, name, str_name, str_num, zip, city, type])
        .then(() => {
            pool.releaseConnection(conn);
            req.flash('messages', { type: 'success', value: "Successfully added a new Organization!" })
            res.redirect('/organizations');
        })
        .catch(err => {
            req.flash('messages', { type: 'error', value: "Something went wrong, Organization could not be added." })
            res.redirect('/organizations');
        })
    })
}

/* Controller to retrieve organizations have handled the same number of projects 
 * and >=10 in period of 2 sequential years from database 
 */
exports.getOrgWithSameNumOfProjects = (req, res, next) => {

    /* check for messages in order to show them when rendering the page */
    let messages = req.flash("messages");
    if (messages.length == 0) messages = [];

    /* create the connection, execute query, render data */
    pool.getConnection((err, conn) => {
        
        conn.promise().query('SELECT * FROM org_with_same_num_of_proj')
        .then(([rows, org_with_same_num_of_proj]) => {
            res.render('org-with-same-num-of-projects.ejs', {
                pageTitle: "Organizations with same number of projects",
                org_with_same_num_of_proj: rows,
                messages: messages
            })
        })
        .then(() => pool.releaseConnection(conn))
        .catch(err => console.log(err))
    })

}

/* Controller to retrieve projects per organization view of relational schema from database */
exports.getOrganizationProjectsView = (req, res, next) => {

    /* check for messages in order to show them when rendering the page */
    let messages = req.flash("messages");
    if (messages.length == 0) messages = [];

    /* create the connection, execute query, render data */
    pool.getConnection((err, conn) => {
        
        conn.promise().query('SELECT * FROM organization_project_view')
        .then(([rows, org_projects_view]) => {
            res.render('organization-projects-view.ejs', {
                pageTitle: "Projects per Organization View",
                org_projects_view: rows,
                messages: messages
            })
        })
        .then(() => pool.releaseConnection(conn))
        .catch(err => console.log(err))
    })

}

/* Controller to retrieve phone numbers of organizations from database */
exports.getPhones = (req, res, next) => {

    const id = req.query.id;

    /* check for messages in order to show them when rendering the page */
    let messages = req.flash("messages");
    if (messages.length == 0) messages = [];

    /* create the connection, execute query, render data */
    pool.getConnection((err, conn) => {
        
        conn.promise().query(`SELECT * FROM phone_number WHERE organization_id = ${id}`)
        .then(([rows, phones]) => {
            res.render('organization-phones.ejs', {
                pageTitle: "Phone numbers",
                phones: rows,
                messages: messages
            })
        })
        .then(() => pool.releaseConnection(conn))
        .catch(err => console.log(err))
    })

}

/* Controller to delete phone from database */
exports.postDeletePhone = (req, res, next) => {
    /* get id from params */
    const id = req.query.id;
    const phone = req.query.phone;
    
    /* create the connection, execute query, flash respective message and redirect to organizations route */
    pool.getConnection((err, conn) => {
        var sqlQuery = `DELETE FROM phone_number WHERE organization_id = ${id} AND phone = '${phone}'`;

        conn.promise().query(sqlQuery)
        .then(() => {
            pool.releaseConnection(conn);
            req.flash('messages', { type: 'success', value: "Successfully deleted phone!" })
            res.redirect('/organizations');
        })
        .catch(err => {
            req.flash('messages', { type: 'error', value: "Something went wrong, Phone could not be deleted." })
            res.redirect('/organizations');
        })
    })

}

/* Controller to render data shown in create phone page */
exports.getCreatePhone = (req, res, next) => {
    res.render('create_phone.ejs', {
        pageTitle: "Phone Creation Page"
    })
}

/* Controller to create a new phone in the database */
exports.postPhone = (req, res, next) => {

    /* get necessary data sent */
    const id = req.body.id;
    const phone = req.body.phone;

    /* create the connection, execute query, flash respective message and redirect to organizations route */
    pool.getConnection((err, conn) => {
        var sqlQuery = `INSERT INTO phone_number(organization_id, phone) VALUES(?, ?)`;

        conn.promise().query(sqlQuery, [id, phone])
        .then(() => {
            pool.releaseConnection(conn);
            req.flash('messages', { type: 'success', value: "Successfully added a new Phone!" })
            res.redirect('/organizations');
        })
        .catch(err => {
            req.flash('messages', { type: 'error', value: "Something went wrong, Phone could not be added." })
            res.redirect('/organizations');
        })
    })
}