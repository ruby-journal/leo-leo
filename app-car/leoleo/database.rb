require "sqlite3"

# Open a database
db = SQLite3::Database.new 'leoleo_development.db'

# Create a database
rows = db.execute <<-SQL
  create table users (
    name varchar(255),
    email varchar(255),
    gender int,
    about text,
    image_url varchar(255)
  );
SQL