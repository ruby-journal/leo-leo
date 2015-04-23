# leo-leo
A mobile app /w Lotus backend for User Management

**Bước 1:**

Pull code và chạy lệnh sau:

```
bundle install

```

**Bước 2:**

Tạo 1 file `leoleo/database.db`

Chạy lệnh này `ruby database.rb` ở command line

**Bước 3:**

Vào folder leoleo/lip/

 `config/mapping.rb` update mapping

 `leoleo/entities` create 1 file `user.rb` tạo 1 user entity

 `leoleo/repositories` create 1 file `user_repository` tạo 1 user repository

**Bước 4**

Vào `leoleo/leoleo.rb` update config mapping dùng 'mapping "#{__dir__}/config/mapping"'

**Bước 5**

Vào `leoleo/config` update

`.env.development` update url `LEOLEO_DATABASE_URL="sqlite://db/leo_leo_development.db"`

**Bước 6**

Vào `folder leoleo/lib/leoleo` tạo file `migrator.rb`

Update Rakefile

Vào leoleo/db` create 1 file `seeds.rb`

Chạy lệnh này `bundle exec rake db:seed`






