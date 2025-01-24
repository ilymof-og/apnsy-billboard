const Router = require('express')
const router = new Router()
const userController = require('../controllers/userController')


router.post('/registration', userController.registration)
router.post('/login', userController.login)
router.get('/auth', userController.check)
router.post('/api/basket/add', async (req, res, next) => {
    try {
        const { userId, adId } = req.body;  // Получаем userId и adId из запроса
        await userController.addToBasket(userId, adId);    // Вызываем функцию для добавления
        res.json({ message: 'Ad added to basket' });
    } catch (error) {
        next(error);
    }
});

module.exports = router