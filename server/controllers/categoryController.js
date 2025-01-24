const {Category,Subcategory } = require('../models/models'); // Подключаем модель
const sequelize = require('../db')
class CategoryController {

  async CreateCategory(req,res)
  {
    try{
      const{ categoryName} = req.body;
      const category = await Category.create({ categoryName})        
      res.status(201).json(category);
    } catch (error) {
      res.status(400).json({ error: error.message });
    }

    }  
    catch (error) {
      console.error('Failed to add Category:', error);
  }
  async clearCategoryList(req, res) {
    const t = await sequelize.transaction(); // Открываем транзакцию

    try {
      // Удаляем все подкатегории и категории
      await Subcategory.destroy({ where: {}, truncate: true, cascade: true }, { transaction: t });
      await Category.destroy({ where: {}, truncate: true, cascade: true }, { transaction: t });
  
      // Сбрасываем последовательности для таблиц categories и subcategories
      await sequelize.query("ALTER SEQUENCE categories_id_seq RESTART WITH 1;", { transaction: t });
      await sequelize.query("ALTER SEQUENCE subcategories_id_seq RESTART WITH 1;", { transaction: t });
  
      // Если всё успешно, коммитим транзакцию
      await t.commit();
  
      res.status(200).json({ message: 'Categories and subcategories deleted, IDs reset' });
    } catch (error) {
      // В случае ошибки откатываем транзакцию
      await t.rollback();
      console.error('Error deleting categories and subcategories:', error);
      res.status(500).json({ message: 'Failed to delete categories and subcategories' });
    }
  }
async getAll (req, res) {
  try {
    const categories = await Category.findAll({
      include: [{ model: Subcategory }]
    });
    res.status(200).json(categories);
  } catch (error) {
    console.error('Error fetching categories and subcategories:', error);
    res.status(500).json({ message: 'Failed to fetch categories and subcategories' });
  }
  }
  async GetOneCategoryWithSub (req, res) {
      const { id } = req.params;
    
      try {
        const category = await Category.findOne({
          where: { id },
          include: [{ model: Subcategory }]
        });
    
        if (!category) {
          return res.status(404).json({ message: 'Category not found' });
        }
    
        res.status(200).json(category);
      } catch (error) {
        console.error('Error fetching category and subcategories:', error);
        res.status(500).json({ message: 'Failed to fetch category and subcategories' });
      }
    }
  
 async delOneCategory(req,res)
 {
  const { id } = req.params; // Получаем id категории из запроса
  const t = await sequelize.transaction(); // Открываем транзакцию

  try {
    // Найти категорию по id
    const category = await Category.findByPk(id);

    if (!category) {
      return res.status(404).json({ message: 'Category not found' });
    }

    // Удалить подкатегории, связанные с категорией
    await Subcategory.destroy({ where: { categoryId: id }, transaction: t });

    // Удалить саму категорию
    await Category.destroy({ where: { id }, transaction: t });

    // Если всё успешно, коммитим транзакцию
    await t.commit();

    res.status(200).json({ message: 'Category and its subcategories deleted successfully' });
  } catch (error) {
    // В случае ошибки откатываем транзакцию
    await t.rollback();
    console.error('Error deleting category and its subcategories:', error);
    res.status(500).json({ message: 'Failed to delete category and subcategories' });
  }
 }
}

module.exports = new CategoryController()