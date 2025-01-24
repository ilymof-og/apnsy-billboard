const Router = require('express')
const router = new Router()
const basketController = require('../controllers/basketController')

router.post('/add',basketController.addToBasket)
router.get('/:userId',basketController.getBasket)


module.exports = router