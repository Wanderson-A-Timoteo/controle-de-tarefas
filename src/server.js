import "dotenv/config";

import "./database";

import AdminJS from "adminjs";
import AdminJSExpress from "@adminjs/express";
import AdminJSSequelize from "@adminjs/sequelize";
import express from "express";

import UsersResource from "./resources/UsersResource";
import ProjectResources from "./resources/ProjectsResource";
import TasksResources from "./resources/TasksResource";

import User from "./models/user";

import locale from "./locales";
import theme from "./theme";

AdminJS.registerAdapter(AdminJSSequelize);

const app = express();

const adminJS = new AdminJS({
  database: [],
    rootPath: '/admin',
    dashboard: {
        component: AdminJS.bundle("./components/Dashboard/index"), // Substitui o dashboard padrão pelo compomente dashboard que criamos
    },
    resources: [UsersResource, ProjectResources, TasksResources],
    branding: {
        companyName: 'Controle de Tarefas',
        logo: false,
        softwareBrothers: false,
        theme
    },
    ...locale,
});

//const router = AdminJSExpress.buildRouter(adminJS);
const router = AdminJSExpress.buildAuthenticatedRouter(adminJS, {
  authenticate: async (email, password) => {
    const user = await User.findOne({ where: { email } });

    if (user && (await user.checkPassword(password))) {
      return user;
    }

    return false;
  },
  cookiePassword: process.env.SECRET
});

app.use(adminJS.options.rootPath, router);
app.listen(5000, () => {
  console.log("AdminJS is under http://localhost:5000/admin");
});
