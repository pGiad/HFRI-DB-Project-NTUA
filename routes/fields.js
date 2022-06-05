const express = require('express');
const fieldsController = require('../controllers/fields');

const router = express.Router();

router.get('/', fieldsController.getFields);
router.post('/delete/:field_name', fieldsController.postDeleteField);
router.post('/update/:field_name', fieldsController.postUpdateField);
router.get('/field-creation-page', fieldsController.getCreateField);
router.post('/create', fieldsController.postField);
router.get('/top3-fields', fieldsController.getTop3);
router.get('/projects-researchers', fieldsController.getProjectsResearchers);

module.exports = router;