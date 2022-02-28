import "dotenv/config";
import "./database";
import AdminJS from 'adminjs';
import AdminJSExpress from '@adminjs/express';
import AdminJSSequelize from "@adminjs/sequelize";
import express from 'express';
import UsersResource from './resources/UsersResources';
import locale from './locales';
import ProjectResources from "./resources/ProjectsResources";
import TasksResources from "./resources/TasksResources";

AdminJS.registerAdapter(AdminJSSequelize);

const app = express();

const adminJS = new AdminJS({
    database: [],
    rootPath: '/admin',
    dashboard: {
        component: AdminJS.bundle("./components/Dashboard/index"), // Substitui o dashboard padrão pelo compomente dashboard que criamos
    },
    resources: [UsersResource, ProjectResources, TasksResources],
    ...locale,
});

const router = AdminJSExpress.buildRouter(adminJS);

app.use(adminJS.options.rootPath, router);
app.listen(5000, () => {
    console.log("AdminJS is under http://localhost:5000/admin");
});