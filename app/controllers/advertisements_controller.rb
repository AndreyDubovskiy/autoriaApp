require 'kaminari'

class AdvertisementsController < ApplicationController

  #GET
  before_action :authenticate_user_login!

  def statistic1
    @statistics = ActiveRecord::Base.connection.execute("
      SELECT cities.name AS city_name, COUNT(advertisements.id) AS advertisement_count
      FROM cities
      JOIN advertisements ON cities.id = advertisements.city_id
      GROUP BY cities.name
      ORDER BY advertisement_count DESC
    ")
    render 'stat1'
  end

  def statistic2
    @statistics = ActiveRecord::Base.connection.execute("
      SELECT subquery.city_name, MAX(subquery.advertisement_title) AS advertisement_title, subquery.price_count, MAX(subquery.valute_name) AS valute_name, MAX(subquery.price_total) AS price_total
      FROM (
        SELECT cities.name AS city_name, advertisements.title AS advertisement_title, prices.count AS price_count, valutes.name AS valute_name, (prices.count * valutes.rate) AS price_total
        FROM advertisements
        JOIN cities ON cities.id = advertisements.city_id
        JOIN (
          SELECT city_id, MAX(prices.count * valutes.rate) AS max_price
          FROM advertisements
          JOIN price_data ON price_data.advertisement_id = advertisements.id
          JOIN prices ON prices.price_datum_id = price_data.id
          JOIN valutes ON valutes.id = prices.valute_id
          GROUP BY city_id
        ) AS max_prices ON max_prices.city_id = cities.id
        JOIN price_data ON price_data.advertisement_id = advertisements.id
        JOIN prices ON prices.price_datum_id = price_data.id
        JOIN valutes ON valutes.id = prices.valute_id
        WHERE (prices.count * valutes.rate) = max_prices.max_price
        ORDER BY city_name
      ) AS subquery
      GROUP BY subquery.city_name, subquery.price_count
      ORDER BY price_total DESC;
    ")
    render 'stat2'
  end
  def statistic3
    @statistics = ActiveRecord::Base.connection.execute("
      SELECT subquery.city_name, MAX(subquery.advertisement_title) AS advertisement_title, subquery.price_count, MAX(subquery.valute_name) AS valute_name, MAX(subquery.price_total) AS price_total
      FROM (
        SELECT cities.name AS city_name, advertisements.title AS advertisement_title, prices.count AS price_count, valutes.name AS valute_name, (prices.count * valutes.rate) AS price_total
        FROM advertisements
        JOIN cities ON cities.id = advertisements.city_id
        JOIN (
          SELECT city_id, MAX(prices.count * valutes.rate) AS max_price
          FROM advertisements
          JOIN price_data ON price_data.advertisement_id = advertisements.id
          JOIN prices ON prices.price_datum_id = price_data.id
          JOIN valutes ON valutes.id = prices.valute_id
          GROUP BY city_id
        ) AS max_prices ON max_prices.city_id = cities.id
        JOIN price_data ON price_data.advertisement_id = advertisements.id
        JOIN prices ON prices.price_datum_id = price_data.id
        JOIN valutes ON valutes.id = prices.valute_id
        WHERE (prices.count * valutes.rate) = max_prices.max_price
        ORDER BY city_name
      ) AS subquery
      GROUP BY subquery.city_name, subquery.price_count
      ORDER BY price_total ASC;
    ")
    render 'stat3'
  end
  def allAdvertisements
    @advs = Advertisement.eager_load(:photos, price_data: { price: :valute }).all
    @advs = AdvertisementQuery.new(@advs).call(params)
    @advs = Kaminari.paginate_array(@advs).page(params[:page]).per(4)
    render 'all'
  end

  def show
    @current_user = current_user_login.user
    @tmp = Advertisement.eager_load(:city, :photos, :user, auto: [:type_auto, :model_marka_auto, :type_kuzov, :country, :color, :type_fuel, :type_transmission, :type_drive_auto], price_data: { price: :valute }).find(params[:id])
    if(@tmp)
      render 'show'
    else
      redirect_to advertisements_path
    end
  end

  #GET
  def createPage
    render 'create'
  end

  #POST
  def create
    @new_auto = Auto.new
    @new_auto.is_new = (params.has_key? 'is_new')
    @new_auto.year = params[:year].to_i
    @new_auto.mileage = params[:mileage].to_i
    @new_auto.type_auto_id = params[:type_auto_id].to_i
    @new_auto.model_marka_auto_id = params[:model_marka_auto_id].to_i
    @new_auto.type_kuzov_id = params[:type_kuzov_id].to_i
    @new_auto.country_id = params[:country_id].to_i
    @new_auto.color_id = params[:color_id].to_i
    @new_auto.type_fuel_id = params[:type_fuel_id].to_i
    @new_auto.type_transmission_id = params[:type_transmission_id].to_i
    @new_auto.type_drive_auto_id = params[:type_drive_auto_id].to_i
    @new_auto.save
    @new = Advertisement.new()
    @new.user = current_user_login.user
    @new.title = params[:title]
    @new.text = params[:text]
    @new.auto = @new_auto
    @new.city_id = params[:city_id].to_i
    @new.save
    @new_photo = Photo.new
    @new_photo.file.attach(params[:file])
    @new_photo.advertisement = @new
    @new_photo.save
    @new_price = Price.new
    @new_price.count = params[:count].to_i
    @new_price.valute_id = params[:valute_id].to_i
    @new_price.save
    @new_price_data = PriceDatum.new
    @new_price_data.date = Date.today
    @new_price_data.price = @new_price
    @new_price_data.advertisement = @new
    @new_price_data.save

    redirect_to advertisements_show_path(id: @new.id)
  end

  #GET
  def editPage
    @tmp = Advertisement.find(params[:id])
    render 'edit'
  end

  #POST
  def edit
    @tmp = Advertisement.eager_load(:city, :photos, :user, auto: [:type_auto, :model_marka_auto, :type_kuzov, :country, :color, :type_fuel, :type_transmission, :type_drive_auto], price_data: { price: :valute }).find(params[:id])
    if @tmp
      @new_auto = @tmp.auto
      @new_auto.is_new = (params.has_key? 'is_new')
      @new_auto.year = params[:year].to_i
      @new_auto.mileage = params[:mileage].to_i
      @new_auto.type_auto_id = params[:type_auto_id].to_i
      @new_auto.model_marka_auto_id = params[:model_marka_auto_id].to_i
      @new_auto.type_kuzov_id = params[:type_kuzov_id].to_i
      @new_auto.country_id = params[:country_id].to_i
      @new_auto.color_id = params[:color_id].to_i
      @new_auto.type_fuel_id = params[:type_fuel_id].to_i
      @new_auto.type_transmission_id = params[:type_transmission_id].to_i
      @new_auto.type_drive_auto_id = params[:type_drive_auto_id].to_i
      @new_auto.save
      @tmp.title = params[:title]
      @tmp.text = params[:text]
      @tmp.city_id = params[:city_id].to_i
      @tmp.save
      if (params.has_key? 'file')
        @new_photo = @tmp.photos.first
        @new_photo.file.attach(params[:file])
        @new_photo.save
      end
      @new_price_data = @tmp.price_data.last
      @new_price = @new_price_data.price
      if (params[:count].to_i != @new_price.count)
        @new_price_data = PriceDatum.new
        @new_price_data.date = Date.today
        @new_price_data.advertisement = @tmp
        @new_price_data.save
        @new_price = Price.new
        @new_price.count = params[:count].to_i
        @new_price.valute_id = params[:valute_id].to_i
        @new_price.price_datum = @new_price_data
        @new_price.save
      else
        @new_price.valute_id = params[:valute_id].to_i
        @new_price.save
      end
    end
    redirect_to advertisements_show_path(id: @tmp.id)
  end

  #DELETE
  def delete
    @tmp = Advertisement.eager_load(:city, :photos, :user, :auto, price_data: { price: :valute }).find(params[:id])
    if @tmp and (current_user_login.user.id == @tmp.user.id or current_user_login.admin)
      @auto = @tmp.auto
      if @auto
        @auto.delete
      end
      @dates_price = @tmp.price_data
      @dates_price.each do |date_price|
        date_price.price.delete
        date_price.delete
      end
      @photos = @tmp.photos
      @photos.each do |photo|
        photo.delete
      end
      @tmp.delete
    end
    redirect_to advertisements_path
  end
end
