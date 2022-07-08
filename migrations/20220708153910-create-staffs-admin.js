'use strict';
module.exports = {
  async up(queryInterface, Sequelize) {
    await queryInterface.createTable('StaffsAdmins', {
      id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: Sequelize.INTEGER
      },
      username: {
        type: Sequelize.STRING,
        allowNull: false,
        charset: 'utf8',
        collate: 'utf8_general_ci'
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
      role: {
        type: Sequelize.ENUM(['staffs','admin']),
        defaultValue: 'staffs'
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
    await queryInterface.dropTable('StaffsAdmins');
  }
};
