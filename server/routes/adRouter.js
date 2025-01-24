const Router = require('express')
const router = new Router()
const adController = require('../controllers/adController')


router.post('/', adController.AdCreate)
router.get('/', adController.GetAllAd)
router.get('/:adId', adController.getOne);
router.delete('/',adController.clearAllAds)


module.exports = router