class PagesController < ApplicationController
  def my_page
    render 'pages'
  end

  def allPost
    @posts = Advertisement.all
    render 'adv'
  end

  def tests
    @tmp = TypeAuto.new
    @tmp.name = "Легкове"
    @tmp.save
    @tmp = TypeFuel.new
    @tmp.name = "Бензин"
    @tmp.save
    @tmp = TypeKuzov.new
    @tmp.name = "Хетчбек"
    @tmp.save
    @tmp = TypeTransmission.new
    @tmp.name = "Автомат"
    @tmp.save
    @tmp = TypeDriveAuto.new
    @tmp.name = "Повний привід"
    @tmp.save
    @tmp = Color.new
    @tmp.name = "Червоний"
    @tmp.save
    @tmp = Country.new
    @tmp.name = "Німеччина"
    @tmp.save
    @tmp = Photo.new
    @tmp.name = "Німеччина"
    @tmp.save
    for i in 1..10
      t = Advertisement.new
      t.photos = Photo.all.sample
      t.photos = Photo.all.sample
      t.photos = Photo.all.sample
      t.photos = Photo.all.sample
      t.photos = Photo.all.sample
      t.save

    end
  end



end
