'use strict';
module.exports = {
  async up(queryInterface, Sequelize) {
    await queryInterface.createTable('Users', {
      id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: Sequelize.INTEGER
      },
      username: {
        type: Sequelize.STRING,
        charset: ' utf8',
        collate: 'utf8_general_ci',
        allowNull: false
      },
      password: {
        type: Sequelize.STRING,
        validate: {
          min: 8,
          max: 16
        },
        allowNull: false
      },
      email: {
        type: Sequelize.STRING,
        validate: {
          isEmail: true
        },
        allowNull: false
      },
      phone: {
        type: Sequelize.STRING,
        validate: {
          min: 10,
          max: 10
        },
        allowNull: false
      },
      address: {
        type: Sequelize.STRING,
        charset: 'utf8',
        collate: 'utf8_general_ci',
        allowNull: false
      },
      roleId: {
        type: Sequelize.INTEGER,
        references: {
          model: 'Role',
          key: 'id'
        }
      },
      createdAt: {
        allowNull: false,
        type: Sequelize.DATE
      },
      updatedAt: {
        allowNull: false,
        type: Sequelize.DATE
      }
    });
  },
  async down(queryInterface, Sequelize) {
    await queryInterface.dropTable('Users');
  }
};
