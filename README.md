# leo-leo
A mobile app /w Lotus backend for User Management

### Tạo database

**Bước 1:**

Pull code và chạy lệnh sau:

`bundle install`

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

### Tạo API

**Bước 1**

Vào folder leoleo/apps tạo folder api, trong folder api tạo folder v1

**Bước 2**

Vào folder v1 tạo folder `controllers` để define API

controllers/users/index.rb 

index.rb tương ứng với 1 action index trong get all

`UserRepository.all` giúp mình get all use

**Bước 3**

Vào folder v1 tạo folder config

`config/routes.rb`

`resources :users, only: [:index]` 

resources tự động ra 4 cái routes tương ứng với các action

```C: Create --> POST
R: Read --> GET
U: Update --> PUT
D: Delete --> DELETE```

use option `only` chỉ phục vụ action index --> Get all content 

**Bước 4**

Vào folder v1 tạo folder presenters

**Bước 5**

Vào folder v1 tạo folder presenters

`presenters/users/index.rb`

Cấu trúc data trả về như mình mong muốn.

**Bước 5**

file application.rb

Custom config ở file này.

### Config enviroment

**Bước 1**

Vào folder `leoleo/config/.env.development` 

edit url của data base `LEOLEO_DATABASE_URL="sqlite://db/leo_leo_development.db"`

**Bước 2**

Vào folder `leoleo/config/environment.rb`

Tương tự như Web application bạn add thêm 2 dòng này cho api:

Thêm vào `require_relative '../apps/api/v1/application'`

Ngoài ra thêm mount `ApiV1::Application, at: '/api/v1'` vào `Lotus::Container.configure` 

### Hoàn thành

Vào command line chạy lệnh sau:

`lotus serve`

Nếu bạn bị đụng port với port của lotus thì bạn có thể dùng lệnh sau:

`lotus serve -p 3000` Có thể thay 3000 bằng 1 con số bất 


