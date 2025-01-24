const {Subcategory, Category } = require('../models/models'); // Подключаем модель
const sequelize = require('../db')
class SubcategoryController {
async addSubcategory(req, res) {
      const { categoryName, subcategories } = req.body;
      try {
        // Проверяем, существует ли уже категория
        let category = await Category.findOne({ where: { categoryName } });

        if (!category) {
          // Создаём новую категорию
          category = await Category.create({ categoryName });
          console.log(`Created category: ${categoryName}`);
        } else {
          console.log(`Category already exists: ${categoryName}`);
        }

        // Создаём подкатегории, если они переданы и являются массивом
        if (Array.isArray(subcategories) && subcategories.length > 0) {
          for (const subcategoryName of subcategories) {
            // Проверяем, существует ли подкатегория для этой категории
            let subcategory = await Subcategory.findOne({
              where: {
                subcategoryName,
                categoryId: category.id
              }
            });

            if (!subcategory) {
              // Создаём новую подкатегорию
              subcategory = await Subcategory.create({
                subcategoryName,
                categoryId: category.id
              });
              console.log(`Created subcategory: ${subcategoryName} under category: ${categoryName}`);
            } else {
              console.log(`Subcategory already exists: ${subcategoryName} under category: ${categoryName}`);
            }
          }
        }

        res.status(201).json({ message: 'Category and subcategories created successfully' });
      } catch (error) {
        console.error('Error creating category and subcategories:', error);
        res.status(500).json({ message: 'Failed to create category and subcategories' });
      }

   }

    async getSubcategories(req, res) {
      try {
        const subcategory = await Subcategory.findAll();

      res.status(200).json(subcategory);
    } catch (error) {
      res.status(400).json({ error: error.message });
      console.error('Failed to get subcategories:', error);
    }
    }

async clearSubcategoryList(req, res) {
  try {
    await Subcategory.truncate({ cascade: true, restartIdentity: true });
  res.status(200).json({ message: 'Subcategory cleared and auto-increment reset.' });
} catch (error) {
  res.status(400).json({ error: error.message });
  console.error('Failed to clear Ad:', error);
}
}
}

  module.exports = new SubcategoryController()