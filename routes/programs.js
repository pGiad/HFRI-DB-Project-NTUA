const express = require('express');
const programsController = require('../controllers/programs');

const router = express.Router();

router.get('/', programsController.getPrograms);
router.post('/delete/:id', programsController.postDeleteProgram);
router.post('/update/:id', programsController.postUpdateProgram);
router.get('/program-creation-page', programsController.getCreateProgram);
router.post('/create', programsController.postProgram);

module.exports = router;