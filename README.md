Criar migrations
    npx sequelize-cli model:generate --name User --attributes name:string,email:string,password_hash:string

    npx sequelize-cli db:migrate
    
