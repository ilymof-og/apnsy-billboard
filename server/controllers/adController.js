const {Ad, Photo, Category, Subcategory,Region} = require('../models/models')
const path = require('path');
const { v4: uuidv4 } = require('uuid'); // Импорт UUID

class AdController 
{
   
  async AdCreate(req, res) {
    try {
      let { adName, description, price, regionId, categoryId, subcategoryId } = req.body;
  
      // Проверяем наличие изображений
      if (!req.files || !req.files.images || req.files.images.length === 0) {
        return res.status(400).json({ message: "Необходимо загрузить хотя бы одно изображение" });
      }
  
      // Проверяем наличие категории
      const category = await Category.findByPk(categoryId);
      if (!category) {
        return res.status(400).json({ message: "Категория не найдена" });
      }
  
      // Проверяем наличие подкатегории
      const subcategory = await Subcategory.findOne({ where: { id: subcategoryId, categoryId } });
      if (!subcategory) {
        return res.status(400).json({ message: "Подкатегория не найдена или не принадлежит выбранной категории" });
      }
  
      // Создаем объявление
      const ad = await Ad.create({ adName, description, price, regionId, categoryId, subcategoryId });
  
      // Массив для изображений
      let images = req.files.images;
  
      // Если images - это не массив (если одно изображение), превращаем его в массив
      if (!Array.isArray(images)) {
        images = [images];
      }
  
      // Обрабатываем каждое изображение
      for (let image of images) {
        let fileName = uuidv4() + path.extname(image.name);
        const imagePath = path.resolve(__dirname, '..', 'static', fileName);
  
        // Перемещаем файл в директорию 'static'
        await image.mv(imagePath);
  
        // Сохраняем информацию о фото в базе данных и связываем его с объявлением
        await Photo.create({
          url: fileName,
          adId: ad.id
        });
      }
  
      // Возвращаем объявление с фотографиями
      const adWithPhotos = await Ad.findByPk(ad.id, {
        include: { model: Photo, as: 'photos' }
      });
  
      return res.status(201).json(adWithPhotos);
    } catch (error) {
      console.error(error);
      return res.status(500).json({ message: "Ошибка сервера", error: error.message });
    }
  }
   
    async GetAllAd(req,res)
    {
      try {
        let ad = await Ad.findAll({
          include: [
            {
              model: Category,
              as: 'category',
              attributes: ['categoryName'],
            },
            {
              model: Subcategory,
              as: 'subcategory',
              attributes: ['subcategoryName'],
            },
            {
              model: Region,
              as: 'region',
              attributes: ['regionName'],
            },
            {
              model: Photo,
              as: 'photos',
              attributes: ['url'],
            }
          ],
          attributes: ['adName', 'description', 'price']
        });
    
        if (!ad) {
          console.log('Объявление не найдено');
          return res.status(404).json({ message: "Объявление не найдено" });
        }
    
        return res.status(200).json(ad);
       
         
        }
         catch (error) {
        console.error('Ошибка при получении объявления:', error);
        return res.status(500).json({ message: "Ошибка сервера", error: error.message });
      }
    }
    
    async getOne(req, res) {
      try {
        const { adId } = req.params;
    
        console.log('Получение объявления с ID:', adId);
    
        const ad = await Ad.findByPk(adId, {
          include: [
            {
              model: Category,
              as: 'category',
              attributes: ['categoryName'],
            },
            {
              model: Subcategory,
              as: 'subcategory',
              attributes: ['subcategoryName'],
            },
            {
              model: Region,
              as: 'region',
              attributes: ['regionName'],
            },
            {
              model: Photo,
              as: 'photos',
              attributes: ['url'],
            }
          ],
          attributes: ['adName', 'description', 'price']
        });
    
        if (!ad) {
          console.log('Объявление не найдено');
          return res.status(404).json({ message: "Объявление не найдено" });
        }
    
        return res.status(200).json(ad);
      } catch (error) {
        console.error('Ошибка при получении объявления:', error);
        return res.status(500).json({ message: "Ошибка сервера", error: error.message });
      }
    }

    async clearAllAds(req,res) {
      try {
        await Ad.truncate({ cascade: true, restartIdentity: true });
      res.status(200).json({ message: 'Ad cleared and auto-increment reset.' });
    } catch (error) {
      res.status(400).json({ error: error.message });
      console.error('Failed to clear Ad:', error);
    }
  }
}




module.exports = new AdController()