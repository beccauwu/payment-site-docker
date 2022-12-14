read -p "Enter the database user (default root):" db_user
[ -z "$db_user" ] && db_user="root"
printf "\n"
read -p "Create full backup? (y/n):" backup_all
printf "\n"
if [ "$backup_all" == "y" ]; then
    printf "Backing up databases...\n"
    mkdir -p backups/db/full
    docker exec -t postgres pg_dumpall -c -U $db_user > backups/db/full/backup-$(date +%d-%m-%Y-%H-%M-%S).sql
    printf "Database backup complete.\n"
    printf "File saved to backups/db/full\n"
else
    printf "listing databases...\n"
    docker exec -it postgres bash -c "psql -U $db_user -l" 
    read -p "Enter the database name:" db_name
    printf "\n"
    printf "Backing up $db_name...\n"
    mkdir -p backups/db/$db_name
    docker exec -t postgres pg_dump -c -U $db_user $db_name > backups/db/$db_name/backup-$(date +%d-%m-%Y-%H-%M-%S).sql
    printf "Database saved to backups/$dbname.\n"
fi