import Sequelize from "sequelize";
import config from "../config/database";

//import Model from "../models/xxx";

const models = [];

class Database {
  constructor() {
    this.connection = new Sequelize(config);
    this.init();
    this.associate();
  }

  init() {

  }

  associate() {

  }
}

export default new Database();