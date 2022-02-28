# Criar migrations User
    npx sequelize-cli model:generate --name User --attributes name:string,email:string,password_hash:string

## Criar migrate
    npx sequelize-cli db:migrate

# Criar migrations Project
    npx sequelize-cli model:generate --name Project --attributes name:string,description:string,status:enum,user_id:integer


# Criar migrations Task
    npx sequelize-cli model:generate --name Task --attributes due_date:date,effort:integer,title:string,description:text,order:integer,status:enum,user_id:integer,project_id:integer 

# Criar migrations Upload
    npx sequelize-cli migration:generate --name add-upload-to-task

