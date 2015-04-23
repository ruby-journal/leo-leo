[
  {name: 'My Mai', email: 'my.mai@asnet.com.vn', gender: 0, about: 'cung okay', image_url: 'https://avatars3.githubusercontent.com/u/6791942?v=3&s=460'},
].each do |car_attrs|
  car = Car.new(car_attrs)
  CarRepository.persist(car)
end