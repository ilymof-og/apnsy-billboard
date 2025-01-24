const {Basket,User,Ad } = require('../models/models'); // Подключаем модель
const sequelize = require('../db')


class BasketController
{
    async getBasket(req, res, next) {
        try {
            const { userId } = req.params;
            const user = await User.findByPk(userId, {
                include: {
                    model: Basket,
                    include: [Ad]
                }
            });
    
            if (user && user.basket) {
                res.json(user.basket.ads);  // Вернуть объявления, связанные с корзиной
            } else {
                res.status(404).json({ message: 'Корзина или пользователь не найдены' });
            }
        } catch (error) {
            next(error);
        }
    }

    async  addToBasket(req,res) {
        const {userId, adId} = req.body
        const user = await User.findByPk(userId); // Убедитесь, что userId — это число, а не объект
        const ad = await Ad.findByPk(adId);
        
        if (user && ad) {
            await user.basket.addAd(ad);
        } else {
            throw new Error('User or Ad not found');
        }
    }
}

module.exports = new BasketController()