const express = require('express');
const projectsController = require('../controllers/projects');

const router = express.Router();

router.get('/', projectsController.getProjects);
router.post('/delete/:id', projectsController.postDeleteProject);
router.post('/update/:id', projectsController.postUpdateProject);
router.get('/project-creation-page', projectsController.getCreateProject);
router.post('/create', projectsController.postProject);
router.get('/deliverables', projectsController.getDeliverables);
router.get('/fields', projectsController.getFields);
router.post('/fields/delete', projectsController.postDeleteProjectField);
router.post('/deliverables/delete', projectsController.postDeleteDeliverable);
router.get('/project-based-on-date', projectsController.getSearchByDate);
router.get('/projects-researchers-date', projectsController.getProjectsResearchersDate);

module.exports = router;