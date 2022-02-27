# Criar migrations User
    npx sequelize-cli model:generate --name User --attributes name:string,email:string,password_hash:string

## Criar migrate
    npx sequelize-cli db:migrate

# Criar migrations Project
    npx sequelize-cli model:generate --name Project --attributes name:string,description:string,status:enum,user_id:integer
    
