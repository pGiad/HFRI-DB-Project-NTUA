const express = require('express');
const organizationsController = require('../controllers/organizations');

const router = express.Router();

router.get('/', organizationsController.getOrganizations);
router.post('/delete/:id', organizationsController.postDeleteOrganization);
router.post('/update/:id', organizationsController.postUpdateOrganization);
router.get('/organization-creation-page', organizationsController.getCreateOrganization);
router.post('/create', organizationsController.postOrganization);
router.get('/org-with-same-num-of-projects', organizationsController.getOrgWithSameNumOfProjects);
router.get('/organization-projects-view', organizationsController.getOrganizationProjectsView);
router.get('/phones', organizationsController.getPhones);
router.post('/phones/delete', organizationsController.postDeletePhone);
router.get('/phone-creation-page', organizationsController.getCreatePhone);
router.post('/phone-create', organizationsController.postPhone);

module.exports = router;