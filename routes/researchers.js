const express = require('express');
const researchersController = require('../controllers/researchers');

const router = express.Router();

router.get('/', researchersController.getResearchers);
router.post('/delete/:id', researchersController.postDeleteResearcher);
router.post('/update/:id', researchersController.postUpdateResearcher);
router.get('/researcher-creation-page', researchersController.getCreateResearcher);
router.post('/create', researchersController.postResearcher);
router.get('/young-researchers', researchersController.getYoungs);
router.get('/research-without-deliverables', researchersController.getResWithoutDeliverables);
router.get('/researcher-projects-view', researchersController.getResearcherProjectsView);
router.post('/researcher-projects-view/delete', researchersController.postDeleteResearcherProjectsView);
router.get('/researcher-projects-view/works-on-creation-page', researchersController.getCreateWorksOn);
router.post('/researcher-projects-view/works-on-create', researchersController.postWorksOn);

module.exports = router;