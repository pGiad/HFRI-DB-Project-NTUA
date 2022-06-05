const express = require('express');
const executivesController = require('../controllers/executives');

const router = express.Router();

router.get('/', executivesController.getExecutives);
router.post('/delete/:id', executivesController.postDeleteExecutive);
router.post('/update/:id', executivesController.postUpdateExecutive);
router.get('/executive-creation-page', executivesController.getCreateExecutive);
router.post('/create', executivesController.postExecutive);
router.get('/top5-executives', executivesController.getTop5);
router.get('/projects-researchers', executivesController.getProjectsResearchers);

module.exports = router;