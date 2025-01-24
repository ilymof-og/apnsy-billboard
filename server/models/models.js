const sequelize = require('../db')
const {DataTypes} = require('sequelize')

const User = sequelize.define('user', {
    id: {type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true},
    firstName: {type: DataTypes.STRING, allowNull: false},
    lastName: {type: DataTypes.STRING, allowNull: false},
    email: {type: DataTypes.STRING, unique: true, allowNull: false},
    password: {type: DataTypes.STRING,allowNull: false}, 
    phoneNumber:{type: DataTypes.STRING, allowNull: false},
    role: {type: DataTypes.STRING, defaultValue: "USER"},
})

const Ad = sequelize.define('ad', 
    {
        id: {type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true},
        adName: {type: DataTypes.STRING, allowNull: false},
        description: {type: DataTypes.STRING, allowNull: false},
        price: {type: DataTypes.INTEGER, allowNull: false},
    }
 )
 const Basket = sequelize.define('basket', {
    id: {type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true},
})

const BasketAd = sequelize.define('basket_ad', {
  id: {type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true},
});

 const Photo= sequelize.define('image', 
    {
        id: {type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true},
        url: {type: DataTypes.STRING, allowNull: false}
    }
 )

 const Category = sequelize.define('category', 
    {
        id: {type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true},
        categoryName: {type: DataTypes.STRING}
    }
 )

 const Region = sequelize.define('region', 
    {
        id: {type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true},
        regionName: {type: DataTypes.STRING}
    }
 )
 const Subcategory = sequelize.define('subcategory', {
    id: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true
    },
    subcategoryName: {
      type: DataTypes.STRING,
      allowNull: false
    },
    categoryId: {
      type: DataTypes.INTEGER,
      allowNull: false,
      references: {
        model: Category,
        key: 'id'
      }
    }
  });


  


 Ad.belongsTo(Category,{as:'category', foreignKey: 'categoryId'});
 Category.hasMany(Ad, { as: 'ads', foreignKey: 'categoryId' });

 Ad.belongsTo(Subcategory,{as:'subcategory', foreignKey: 'subcategoryId'});
 Subcategory.hasMany(Ad, { as: 'ads', foreignKey: 'subcategoryId' });

 Ad.belongsTo(Region,{as:'region', foreignKey: 'regionId'});
 Region.hasMany(Ad, { as: 'ads', foreignKey: 'regionId' });

 Ad.hasMany(Photo, { as: 'photos', foreignKey: 'adId' });
 Photo.belongsTo(Ad, { foreignKey: 'adId' });

 Category.hasMany(Subcategory, { foreignKey: 'categoryId', onDelete: 'CASCADE' });
 Subcategory.belongsTo(Category, { foreignKey: 'categoryId' });

User.hasOne(Basket);
Basket.belongsTo(User);

Basket.belongsToMany(Ad, { through: BasketAd });
Ad.belongsToMany(Basket, { through: BasketAd });

module.exports = 
{
    User,
    Photo,
    Category,
    Ad,
    Region,
    Basket,
    BasketAd,
    Subcategory
}